

package tomcat.monitoring;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.TimeZone;

import javax.management.MBeanAttributeInfo;
import javax.management.MBeanInfo;
import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Lifecycle;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.LifecycleListener;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;
import org.apache.catalina.mbeans.MBeanUtils;
import org.apache.catalina.util.LifecycleSupport;
import org.apache.catalina.util.StringManager;
import org.apache.catalina.valves.Constants;
import org.apache.catalina.valves.ValveBase;


/** This valve is a modification of the Tomcat's AccessLogValve.
 *  It preserves all of its functionality and adds custpm print statements
 *  that output essential statistics about Tomcat's resource utilization. 
 *  
 *  This software is free for any use, but since it is a direct modification
 *  of the Tomcat's AccessLogValve I would prefer for it to be used as
 *  an example only.
 * 
 */

public class ResourceTrackingAccessLogValve 
    extends ValveBase
    implements Lifecycle {


    // ----------------------------------------------------------- Constructors


    /**
     * Construct a new instance of this class with default property values.
     */
    public ResourceTrackingAccessLogValve () {

        super();
        setPattern("common");


    }
   
    
    //MBean attribute names for accessing data base and connector thread pool 
    // resource statistics 
    /**
     * Number of currently active connections
     */
	public static final String DB_POOL_NUM_ACTIVE_ATTRIBUTE = "numActive";
	/**
	 * Maximum number of allowed connections
	 */
	public static final Object DB_POOL_MAX_ACTIVE_ATTRIBUTE = "maxActive";
	
	/**
	 * Number of threads currently busy servicing incoming requests 
	 */
	public static final String THREAD_POOL_CURR_BUSY_ATTRIBUTE = "currentThreadsBusy";
	
	/**
	 * Number of threads loaded to service incoming requests
	 */
	public static final String THREAD_POOL_CURR_COUNT_ATTRIBUTE = "currentThreadCount";


    // ----------------------------------------------------- Instance Variables

    
    private MBeanServer mbeanServer; 
    
    
    //These properties are used for MBean server instantiation    
    /**
     * This has to match the Engine name from server.xml
     */
	private String domain = "Standalone";
	
	/**
	 * MBean server host.
	 */
	private String host = "localhost";

	
	private static Hashtable<String,String> connectionPoolMBeanID = new Hashtable<String,String>();
	private static Hashtable<String,String> threadPoolMBeanID = new Hashtable<String,String>();
	
		
	/**
	 * Standard JMX ObjectName holders for MBeans of our interest.
	 *  
	 */
	private ObjectName dbPoolObjectName;	
	private ObjectName threadPoolObjectName;

    
	/** 
	 * Just a placeholder for a print out of db pool size resource statistics
	 */
	private String dbConnectionCount = "N/A";
	
	/** 
	 * Placeholder for a print out of connector threads resource statistics
	 */
	private String threadsBusyCount = "N/A";
	
    /**
     * Placeholder for a print out of resource statistics for active threads
     */
	private String threadsCurrentCount = "N/A";
	
	/**
	 * Placeholder for a print out of max size of the db connection pool
	 */
	private String dbMaxSize = "N/A";
	
    /**
     * The as-of date for the currently open log file, or a zero-length
     * string if there is no open log file.
     */
    private String dateStamp = "";
    
    
    
    /**
     * These are default values. These default values can be changed by adding or 
     * changing attributes of the Valve definition element located in server.xml file.
     * Just make sure that attribute names in server match the names of these properties.
     */
    private String applicationPath = "/Test";
    
    private String jdbcName = "jdbc/testDB";
    
    private String connectorName = "jk-8009";

    /**
     * The directory in which log files are created.
     */
    private String directory = "logs";


    /**
     * The descriptive information about this implementation.
     */
    protected static final String info =
        "tomcat.monitoring/1.0";


    /**
     * The lifecycle event support for this component.
     */
    protected LifecycleSupport lifecycle = new LifecycleSupport(this);


    /**
     * The set of month abbreviations for log messages.
     */
    protected static final String months[] =
    { "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
	


    /**
     * If the current log pattern is the same as the common access log
     * format pattern, then we'll set this variable to true and log in
     * a more optimal and hard-coded way.
     */
    private boolean common = false;


    /**
     * For the combined format (common, plus useragent and referer), we do
     * the same
     */
    private boolean combined = false;


    /**
     * The pattern used to format our access log lines.
     */
    private String pattern = null;


    /**
     * The default prefix that is added to the log file filenames.
     */
    private String prefix = "resource_tracking_log.";


    /**
     * Should we rotate our log file? Default is true (like old behavior)
     */
    private boolean rotatable = true;


    /**
     * The string manager for this package.
     */
    private StringManager sm =
        StringManager.getManager(Constants.Package);


    /**
     * Has this component been started yet?
     */
    private boolean started = false;


    /**
     * The suffix that is added to log file filenames.
     */
    private String suffix = "";


    /**
     * The PrintWriter to which we are currently logging, if any.
     */
    private PrintWriter writer = null;


    /**
     * A date formatter to format a Date into a date in the format
     * "yyyy-MM-dd".
     */
    private SimpleDateFormat dateFormatter = null;


    /**
     * A date formatter to format Dates into a day string in the format
     * "dd".
     */
    private SimpleDateFormat dayFormatter = null;


    /**
     * A date formatter to format a Date into a month string in the format
     * "MM".
     */
    private SimpleDateFormat monthFormatter = null;


    /**
     * Time taken formatter for 3 decimal places.
     */
     private DecimalFormat timeTakenFormatter = null;


    /**
     * A date formatter to format a Date into a year string in the format
     * "yyyy".
     */
    private SimpleDateFormat yearFormatter = null;


    /**
     * A date formatter to format a Date into a time in the format
     * "kk:mm:ss" (kk is a 24-hour representation of the hour).
     */
    private SimpleDateFormat timeFormatter = null;


    /**
     * The system timezone.
     */
    private TimeZone timezone = null;

    
    /**
     * The time zone offset relative to GMT in text form when daylight saving
     * is not in operation.
     */
    private String timeZoneNoDST = null;


    /**
     * The time zone offset relative to GMT in text form when daylight saving
     * is in operation.
     */
    private String timeZoneDST = null;
    
    
    /**
     * The system time when we last updated the Date that this valve
     * uses for log lines.
     */
    private Date currentDate = null;


    /**
     * When formatting log lines, we often use strings like this one (" ").
     */
    private String space = " ";


    /**
     * Resolve hosts.
     */
    private boolean resolveHosts = false;


    /**
     * Instant when the log daily rotation was last checked.
     */
    private long rotationLastChecked = 0L;


    /**
     * Are we doing conditional logging. default false.
     */
    private String condition = null;


    /**
     * Date format to place in log file name. Use at your own risk!
     */
    private String fileDateFormat = null;


    // ------------------------------------------------------------- Properties


    /**
     * Return the directory in which we create log files.
     */
    public String getDirectory() {

        return (directory);

    }


    /**
     * Set the directory in which we create log files.
     *
     * @param directory The new log file directory
     */
    public void setDirectory(String directory) {

        this.directory = directory;

    }


    /**
     * Return descriptive information about this implementation.
     */
    public String getInfo() {

        return (info);

    }


    /**
     * Return the format pattern.
     */
    public String getPattern() {

        return (this.pattern);

    }


    /**
     * Set the format pattern, first translating any recognized alias.
     *
     * @param pattern The new pattern
     */
    public void setPattern(String pattern) {

        if (pattern == null)
            pattern = "";
        if (pattern.equals(Constants.AccessLog.COMMON_ALIAS))
            pattern = Constants.AccessLog.COMMON_PATTERN;
        if (pattern.equals(Constants.AccessLog.COMBINED_ALIAS))
            pattern = Constants.AccessLog.COMBINED_PATTERN;
        this.pattern = pattern;

        if (this.pattern.equals(Constants.AccessLog.COMMON_PATTERN))
            common = true;
        else
            common = false;

        if (this.pattern.equals(Constants.AccessLog.COMBINED_PATTERN))
            combined = true;
        else
            combined = false;

    }


    /**
     * Return the log file prefix.
     */
    public String getPrefix() {

        return (prefix);

    }


    /**
     * Set the log file prefix.
     *
     * @param prefix The new log file prefix
     */
    public void setPrefix(String prefix) {

        this.prefix = prefix;

    }


    /**
     * Should we rotate the logs
     */
    public boolean isRotatable() {

        return rotatable;

    }


    /**
     * Set the value is we should we rotate the logs
     *
     * @param rotatable true is we should rotate.
     */
    public void setRotatable(boolean rotatable) {

        this.rotatable = rotatable;

    }


    /**
     * Return the log file suffix.
     */
    public String getSuffix() {

        return (suffix);

    }


    /**
     * Set the log file suffix.
     *
     * @param suffix The new log file suffix
     */
    public void setSuffix(String suffix) {

        this.suffix = suffix;

    }


    /**
     * Set the resolve hosts flag.
     *
     * @param resolveHosts The new resolve hosts value
     */
    public void setResolveHosts(boolean resolveHosts) {

        this.resolveHosts = resolveHosts;

    }


    /**
     * Get the value of the resolve hosts flag.
     */
    public boolean isResolveHosts() {

        return resolveHosts;

    }


    /**
     * Return whether the attribute name to look for when
     * performing conditional loggging. If null, every
     * request is logged.
     */
    public String getCondition() {

        return condition;

    }


    /**
     * Set the ServletRequest.attribute to look for to perform
     * conditional logging. Set to null to log everything.
     *
     * @param condition Set to null to log everything
     */
    public void setCondition(String condition) {

        this.condition = condition;

    }

    /**
     *  Return the date format date based log rotation.
     */
    public String getFileDateFormat() {
        return fileDateFormat;
    }


    /**
     *  Set the date format date based log rotation.
     */
    public void setFileDateFormat(String fileDateFormat) {
        this.fileDateFormat =  fileDateFormat;
    }

    // --------------------------------------------------------- Public Methods


    /**
     * Log a message summarizing the specified request and response, according
     * to the format specified by the <code>pattern</code> property.
     *
     * @param request Request being processed
     * @param response Response being processed
     *
     * @exception IOException if an input/output error has occurred
     * @exception ServletException if a servlet error has occurred
     */
    public void invoke(Request request, Response response)
        throws IOException, ServletException {


        // Pass this request on to the next valve in our pipeline
        long t1=System.currentTimeMillis();

        getNext().invoke(request, response);

        long t2=System.currentTimeMillis();
        long time=t2-t1;

        if (condition!=null &&
                null!=request.getRequest().getAttribute(condition)) {
            return;
        }


        Date date = getDate();
        StringBuffer result = new StringBuffer();

        // Check to see if we should log using the "common" access log pattern
        if (common || combined) {
            String value = null;

            if (isResolveHosts())
                result.append(request.getRemoteHost());
            else
                result.append(request.getRemoteAddr());

            result.append(" - ");

            value = request.getRemoteUser();
            if (value == null)
                result.append("- ");
            else {
                result.append(value);
                result.append(space);
            }

            result.append("[");
            result.append(dayFormatter.format(date));           // Day
            result.append('/');
            result.append(lookup(monthFormatter.format(date))); // Month
            result.append('/');
            result.append(yearFormatter.format(date));          // Year
            result.append(':');
            result.append(timeFormatter.format(date));          // Time
            result.append(space);
            result.append(getTimeZone(date));                   // Time Zone
            result.append("] \"");

            result.append(request.getMethod());
            result.append(space);
            result.append(request.getRequestURI());
            if (request.getQueryString() != null) {
                result.append('?');
                result.append(request.getQueryString());
            }
            result.append(space);
            result.append(request.getProtocol());
            result.append("\" ");

            result.append(response.getStatus());

            result.append(space);

            int length = response.getContentCount();

            if (length <= 0)
                value = "-";
            else
                value = "" + length;
            result.append(value);

            if (combined) {
                result.append(space);
                result.append("\"");
                String referer = request.getHeader("referer");
                if(referer != null)
                    result.append(referer);
                else
                    result.append("-");
                result.append("\"");

                result.append(space);
                result.append("\"");
                String ua = request.getHeader("user-agent");
                if(ua != null)
                    result.append(ua);
                else
                    result.append("-");
                result.append("\"");
            }

        } else {
            // Generate a message based on the defined pattern
            boolean replace = false;
            for (int i = 0; i < pattern.length(); i++) {
                char ch = pattern.charAt(i);
                if (replace) {
                    /* For code that processes {, the behavior will be ... if I
                     * do not enounter a closing } - then I ignore the {
                     */
                    if ('{' == ch){
                        StringBuffer name = new StringBuffer();
                        int j = i + 1;
                        for(;j < pattern.length() && '}' != pattern.charAt(j); j++) {
                            name.append(pattern.charAt(j));
                        }
                        if (j+1 < pattern.length()) {
                            /* the +1 was to account for } which we increment now */
                            j++;
                            result.append(replace(name.toString(),
                                                pattern.charAt(j),
                                                request,
                                                response));
                            i=j; /*Since we walked more than one character*/
                        } else {
                            //D'oh - end of string - pretend we never did this
                            //and do processing the "old way"
                            result.append(replace(ch, date, request, response, time));
                        }
                    } else {
                        result.append(replace(ch, date, request, response,time ));
                    }
                    replace = false;
                } else if (ch == '%') {
                    replace = true;
                } else {
                    result.append(ch);
                }
            }
        }
        
       // these are custom appended lines to otherwise original AccessLogValve 
       // code 
        
       loadStatisticsMBeans();
        
       result.append( " | busy connector threads: " + this.threadsBusyCount ); 
       result.append( " active connector threads: " + this.threadsCurrentCount  ); 
       result.append( " active db connections: " + this.dbConnectionCount );
       result.append( " max db connections : " + this.dbMaxSize );
      
     
        
        log(result.toString(), date);

    }


    // -------------------------------------------------------- Private Methods


    /**
     * Close the currently open log file (if any)
     */
    private synchronized void close() {

        if (writer == null)
            return;
        writer.flush();
        writer.close();
        writer = null;
        dateStamp = "";

    }


    /**
     * Log the specified message to the log file, switching files if the date
     * has changed since the previous log call.
     *
     * @param message Message to be logged
     * @param date the current Date object (so this method doesn't need to
     *        create a new one)
     */
    public void log(String message, Date date) {

        if (rotatable){
            // Only do a logfile switch check once a second, max.
            long systime = System.currentTimeMillis();
            if ((systime - rotationLastChecked) > 1000) {

                // We need a new currentDate
                currentDate = new Date(systime);
                rotationLastChecked = systime;

                // Check for a change of date
                String tsDate = dateFormatter.format(currentDate);

                // If the date has changed, switch log files
                if (!dateStamp.equals(tsDate)) {
                    synchronized (this) {
                        if (!dateStamp.equals(tsDate)) {
                            close();
                            dateStamp = tsDate;
                            open();
                        }
                    }
                }

            }
        }

        // Log this message
        if (writer != null) {
            writer.println(message);
        }

    }


    /**
     * Return the month abbreviation for the specified month, which must
     * be a two-digit String.
     *
     * @param month Month number ("01" .. "12").
     */
    private String lookup(String month) {

        int index;
        try {
            index = Integer.parseInt(month) - 1;
        } catch (Throwable t) {
            index = 0;  // Can not happen, in theory
        }
        return (months[index]);

    }


    /**
     * Open the new log file for the date specified by <code>dateStamp</code>.
     */
    private synchronized void open() {

        // Create the directory if necessary
        File dir = new File(directory);
        if (!dir.isAbsolute())
            dir = new File(System.getProperty("catalina.base"), directory);
        dir.mkdirs();

        // Open the current log file
        try {
            String pathname;
            // If no rotate - no need for dateStamp in fileName
            if (rotatable){
                pathname = dir.getAbsolutePath() + File.separator +
                            prefix + dateStamp + suffix;
            } else {
                pathname = dir.getAbsolutePath() + File.separator +
                            prefix + suffix;
            }
            writer = new PrintWriter(new FileWriter(pathname, true), true);
        } catch (IOException e) {
            writer = null;
        }

    }


    /**
     * Return the replacement text for the specified pattern character.
     *
     * @param pattern Pattern character identifying the desired text
     * @param date the current Date so that this method doesn't need to
     *        create one
     * @param request Request being processed
     * @param response Response being processed
     */
    private String replace(char pattern, Date date, Request request,
                           Response response, long time) {

        String value = null;

        if (pattern == 'a') {
            value = request.getRemoteAddr();
        } else if (pattern == 'A') {
            try {
                value = InetAddress.getLocalHost().getHostAddress();
            } catch(Throwable e){
                value = "127.0.0.1";
            }
        } else if (pattern == 'b') {
            int length = response.getContentCount();
            if (length <= 0)
                value = "-";
            else
                value = "" + length;
        } else if (pattern == 'B') {
            value = "" + response.getContentLength();
        } else if (pattern == 'h') {
            value = request.getRemoteHost();
        } else if (pattern == 'H') {
            value = request.getProtocol();
        } else if (pattern == 'l') {
            value = "-";
        } else if (pattern == 'm') {
            if (request != null)
                value = request.getMethod();
            else
                value = "";
        } else if (pattern == 'p') {
            value = "" + request.getServerPort();
        } else if (pattern == 'D') {
                    value = "" + time;
        } else if (pattern == 'q') {
            String query = null;
            if (request != null)
                query = request.getQueryString();
            if (query != null)
                value = "?" + query;
            else
                value = "";
        } else if (pattern == 'r') {
            StringBuffer sb = new StringBuffer();
            if (request != null) {
                sb.append(request.getMethod());
                sb.append(space);
                sb.append(request.getRequestURI());
                if (request.getQueryString() != null) {
                    sb.append('?');
                    sb.append(request.getQueryString());
                }
                sb.append(space);
                sb.append(request.getProtocol());
            } else {
                sb.append("- - ");
                sb.append(request.getProtocol());
            }
            value = sb.toString();
        } else if (pattern == 'S') {
            if (request != null)
                if (request.getSession(false) != null)
                    value = request.getSessionInternal(false).getIdInternal();
                else value = "-";
            else
                value = "-";
        } else if (pattern == 's') {
            if (response != null)
                value = "" + response.getStatus();
            else
                value = "-";
        } else if (pattern == 't') {
            StringBuffer temp = new StringBuffer("[");
            temp.append(dayFormatter.format(date));             // Day
            temp.append('/');
            temp.append(lookup(monthFormatter.format(date)));   // Month
            temp.append('/');
            temp.append(yearFormatter.format(date));            // Year
            temp.append(':');
            temp.append(timeFormatter.format(date));            // Time
            temp.append(' ');
            temp.append(getTimeZone(date));                     // Timezone
            temp.append(']');
            value = temp.toString();
        } else if (pattern == 'T') {
            value = timeTakenFormatter.format(time/1000d);
        } else if (pattern == 'u') {
            if (request != null)
                value = request.getRemoteUser();
            if (value == null)
                value = "-";
        } else if (pattern == 'U') {
            if (request != null)
                value = request.getRequestURI();
            else
                value = "-";
        } else if (pattern == 'v') {
            value = request.getServerName();
        } else {
            value = "???" + pattern + "???";
        }

        if (value == null)
            return ("");
        else
            return (value);

    }


    /**
     * Return the replacement text for the specified "header/parameter".
     *
     * @param header The header/parameter to get
     * @param type Where to get it from i=input,c=cookie,r=ServletRequest,s=Session
     * @param request Request being processed
     * @param response Response being processed
     */
    private String replace(String header, char type, Request request,
                           Response response) {

        Object value = null;

        switch (type) {
            case 'i':
                if (null != request)
                    value = request.getHeader(header);
                else
                    value= "??";
                break;
/*
            // Someone please make me work
            case 'o':
                break;
*/
            case 'c':
                 Cookie[] c = request.getCookies();
                 for (int i=0; c != null && i < c.length; i++){
                     if (header.equals(c[i].getName())){
                         value = c[i].getValue();
                         break;
                     }
                 }
                break;
            case 'r':
                if (null != request)
                    value = request.getAttribute(header);
                else
                    value= "??";
                break;
            case 's':
                if (null != request) {
                    HttpSession sess = request.getSession(false);
                    if (null != sess)
                        value = sess.getAttribute(header);
                }
               break;
            default:
                value = "???";
        }

        /* try catch in case toString() barfs */
        try {
            if (value!=null)
                if (value instanceof String)
                    return (String)value;
                else
                    return value.toString();
            else
               return "-";
        } catch(Throwable e) {
            return "-";
        }
    }


    /**
     * This method returns a Date object that is accurate to within one
     * second.  If a thread calls this method to get a Date and it's been
     * less than 1 second since a new Date was created, this method
     * simply gives out the same Date again so that the system doesn't
     * spend time creating Date objects unnecessarily.
     *
     * @return Date
     */
    private Date getDate() {
        if(currentDate == null) {
        currentDate = new Date();
        } else {
          // Only create a new Date once per second, max.
          long systime = System.currentTimeMillis();
          if ((systime - currentDate.getTime()) > 1000) {
              currentDate = new Date(systime);
          }
    }

        return currentDate;
    }


    private String getTimeZone(Date date) {
        if (timezone.inDaylightTime(date)) {
            return timeZoneDST;
        } else {
            return timeZoneNoDST;
        }
    }
    
    
    private String calculateTimeZoneOffset(long offset) {
        StringBuffer tz = new StringBuffer();
        if ((offset<0))  {
            tz.append("-");
            offset = -offset;
        } else {
            tz.append("+");
        }

        long hourOffset = offset/(1000*60*60);
        long minuteOffset = (offset/(1000*60)) % 60;

        if (hourOffset<10)
            tz.append("0");
        tz.append(hourOffset);

        if (minuteOffset<10)
            tz.append("0");
        tz.append(minuteOffset);

        return tz.toString();
    }


    // ------------------------------------------------------ Lifecycle Methods


    /**
     * Add a lifecycle event listener to this component.
     *
     * @param listener The listener to add
     */
    public void addLifecycleListener(LifecycleListener listener) {

        lifecycle.addLifecycleListener(listener);

    }


    /**
     * Get the lifecycle listeners associated with this lifecycle. If this
     * Lifecycle has no listeners registered, a zero-length array is returned.
     */
    public LifecycleListener[] findLifecycleListeners() {

        return lifecycle.findLifecycleListeners();

    }


    /**
     * Remove a lifecycle event listener from this component.
     *
     * @param listener The listener to add
     */
    public void removeLifecycleListener(LifecycleListener listener) {

        lifecycle.removeLifecycleListener(listener);

    }


    /**
     * Prepare for the beginning of active use of the public methods of this
     * component.  This method should be called after <code>configure()</code>,
     * and before any of the public methods of the component are utilized.
     *
     * @exception LifecycleException if this component detects a fatal error
     *  that prevents this component from being used
     */
    public void start() throws LifecycleException {

        // Validate and update our current component state
        if (started)
            throw new LifecycleException
                (sm.getString("accessLogValve.alreadyStarted"));
        lifecycle.fireLifecycleEvent(START_EVENT, null);
        started = true;

        // Initialize the timeZone, Date formatters, and currentDate
        timezone = TimeZone.getDefault();
        timeZoneNoDST = calculateTimeZoneOffset(timezone.getRawOffset());
        Calendar calendar = Calendar.getInstance(timezone);
        int offset = calendar.get(Calendar.DST_OFFSET);
        timeZoneDST = calculateTimeZoneOffset(timezone.getRawOffset()+offset);
        
        if (fileDateFormat==null || fileDateFormat.length()==0)
            fileDateFormat = "yyyy-MM-dd";
        dateFormatter = new SimpleDateFormat(fileDateFormat);
        dateFormatter.setTimeZone(timezone);
        dayFormatter = new SimpleDateFormat("dd");
        dayFormatter.setTimeZone(timezone);
        monthFormatter = new SimpleDateFormat("MM");
        monthFormatter.setTimeZone(timezone);
        yearFormatter = new SimpleDateFormat("yyyy");
        yearFormatter.setTimeZone(timezone);
        timeFormatter = new SimpleDateFormat("HH:mm:ss:S");
        timeFormatter.setTimeZone(timezone);
        currentDate = new Date();
        dateStamp = dateFormatter.format(currentDate);
        timeTakenFormatter = new DecimalFormat("0.000");
       
        open();

    }


	/**
	 * This method lazy loads the resource statistics related
	 * MBeans, and updates the resource counts with the most recent 
	 * attributes values read from the MBeans.
	 *  
	 */
	private void loadStatisticsMBeans() {
		
		try {
			
			// instantiante mbeanserver in this place
			// because all the mbeans are now loaded
			if ( this.mbeanServer == null ) {
				
				 this.mbeanServer = MBeanUtils.createServer();
				 
			}//end if
			
			if ( this.dbPoolObjectName == null ) {
								
				this.connectionPoolMBeanID.put( "name","\"" + this.getJdbcName() + "\"" );			
				this.connectionPoolMBeanID.put( "class", "javax.sql.DataSource" );			
				this.connectionPoolMBeanID.put( "host", this.getHost() );		
				this.connectionPoolMBeanID.put( "path", this.getApplicationPath() );
				this.connectionPoolMBeanID.put( "type", "DataSource" ); 				
				
				this.dbPoolObjectName = ObjectName.getInstance( this.domain , this.connectionPoolMBeanID  );
				
			}

			MBeanInfo mBeanInfo = mbeanServer.getMBeanInfo( this.dbPoolObjectName );
			
			MBeanAttributeInfo attributeInfo[] = mBeanInfo.getAttributes();		
			
			for (int i = 0; i < attributeInfo.length; i++) {
				
				
				if ( attributeInfo[ i ].getName().equals( this.DB_POOL_NUM_ACTIVE_ATTRIBUTE ) ) {
					
					this.dbConnectionCount = mbeanServer.getAttribute( dbPoolObjectName, attributeInfo[ i ].getName() ).toString(); 
				}		
				if ( attributeInfo[ i ].getName().equals( this.DB_POOL_MAX_ACTIVE_ATTRIBUTE ) ) {
					
					this.dbMaxSize = mbeanServer.getAttribute( dbPoolObjectName, attributeInfo[ i ].getName() ).toString(); 
				}			
				
			}//end for
			
			
			if ( this.threadPoolObjectName == null ) {
				
				this.threadPoolMBeanID.put( "name", this.getConnectorName() );
				this.threadPoolMBeanID.put( "type", "ThreadPool" );
				
				this.threadPoolObjectName = ObjectName.getInstance( this.domain , this.threadPoolMBeanID  );
			}
			

			mBeanInfo = mbeanServer.getMBeanInfo( this.threadPoolObjectName );
			
			attributeInfo = mBeanInfo.getAttributes();		
			
			for (int i = 0; i < attributeInfo.length; i++) {
				
				
				if ( attributeInfo[ i ].getName().equals( this.THREAD_POOL_CURR_BUSY_ATTRIBUTE ) ) {
					
					this.threadsBusyCount= mbeanServer.getAttribute( threadPoolObjectName, attributeInfo[ i ].getName() ).toString(); 
				}		
				
				if ( attributeInfo[ i ].getName().equals( this.THREAD_POOL_CURR_COUNT_ATTRIBUTE ) ) {
					
					this.threadsCurrentCount = mbeanServer.getAttribute( threadPoolObjectName, attributeInfo[ i ].getName() ).toString(); 
				}	
				
			}//end for
		        
			
		} catch (Exception e) {
			
			System.err.println( "Problem encountered while accessing resource statistics MBeans " + e );
			
			e.printStackTrace();
		} 
	}


    /**
     * Gracefully terminate the active use of the public methods of this
     * component.  This method should be the last one called on a given
     * instance of this component.
     *
     * @exception LifecycleException if this component detects a fatal error
     *  that needs to be reported
     */
    public void stop() throws LifecycleException {

        // Validate and update our current component state
        if (!started)
            throw new LifecycleException
                (sm.getString("accessLogValve.notStarted"));
        lifecycle.fireLifecycleEvent(STOP_EVENT, null);
        started = false;

        close();

    }


	/**
	 * @return Returns the jdbcName.
	 */
	public String getJdbcName() {
		return this.jdbcName;
	}


	/**
	 * @param jdbcName The jdbcName to set.
	 */
	public void setJdbcName(String jdbcName) {
		this.jdbcName = jdbcName;
	}


	/**
	 * @return Returns the connectorName.
	 */
	public String getConnectorName() {
		return this.connectorName;
	}


	/**
	 * @param connectorName The connectorName to set.
	 */
	public void setConnectorName(String connectorName) {
		this.connectorName = connectorName;
	}


	/**
	 * @return Returns the getApplicationPath.
	 */
	public String getApplicationPath() {
		return this.applicationPath;
	}


	/**
	 * @param getApplicationPath The getApplicationPath to set.
	 */
	public void setApplicationPath(String getApplicationPath) {
		this.applicationPath = getApplicationPath;
	}


	/**
	 * @return Returns the domain.
	 */
	public String getDomain() {
		return this.domain;
	}


	/**
	 * @param domain The domain to set.
	 */
	public void setDomain(String domain) {
		this.domain = domain;
	}


	/**
	 * @return Returns the host.
	 */
	public String getHost() {
		return this.host;
	}


	/**
	 * @param host The host to set.
	 */
	public void setHost(String host) {
		this.host = host;
	}
}
