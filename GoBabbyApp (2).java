import java.sql.* ;
import java.util.*;
import java.util.Objects;
import java.util.Scanner;

class GoBabbyApp
{
    public static void main ( String [ ] args ) throws SQLException
    {
      // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
          tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "";
        String your_password = "";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd 
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        int state = 0;
        int substate = 0;
        String curID = "";
        String curDate = "";
        String curappointmentNumber = "";
        ArrayList<String> allAppointmentDates = new ArrayList<String>();
        ArrayList<String> allPregnancyNumber  = new ArrayList<String>();
        ArrayList<String> allAppointmentID  = new ArrayList<String>();
        ArrayList<String> allmotherName  = new ArrayList<String>();
        ArrayList<String> allmotherID  = new ArrayList<String>();
        ArrayList<String> allCoupleID  = new ArrayList<String>();
        while (true) {
            if (state == 0) {
                curID = menuService("\nPlease enter your practitioner id [E] to exit: ");
                if (Objects.equals(curID, "E")) {
                    break;
                } else {
                    String querySQL = "SELECT * from midwife where midwife.practid = " + curID;
                    java.sql.ResultSet rs = statement.executeQuery(querySQL);
                    state++;
                    if (!rs.next()) {
                        System.out.println("\nError Invalid ID Retype It");
                        state--;
                    }
                }
            }
            if (state == 1) {
                curDate = menuService("\nPlease enter the date for appointment list [E] to exit:" );
                if (Objects.equals(curDate, "E")) {
                    break;
                }
                state = 2;
            }
            if (state == 2){
                String queryTest = "SELECT date from appointment where date = '" + curDate + "' and appointment.practid = " + curID;
                java.sql.ResultSet testForValidity = statement.executeQuery(queryTest);
                if (!testForValidity.next()){
                    System.out.println("Sorry there is no appointment for that date");
                    state = 1;
                } else{
                    state = 3;
                }
            }
            if (state == 3){
                String querySQL2 = "SELECT time, name, appointment.practid, pregnancy.practid, mother.qcid, pregnancy.coupleid, pregnancy.pregnancynumber, appointmentid, appointment.date from appointment, couple, mother, pregnancy where pregnancy.coupleid = couple.coupleid and pregnancy.pregnancynumber = appointment.pregnancynumber and appointment.coupleid = couple.coupleid and couple.qcid = mother.qcid" +
                        " and appointment.practid = " + curID + " and date = '" + curDate + "' Order by time";
                java.sql.ResultSet rs2 = statement.executeQuery(querySQL2);
                int i = 1;
                String indicator;
                while (rs2.next()) {
                    String midwifeAppointment = rs2.getString(3);
                    String midwifePrimary = rs2.getString(4);
                    if (Objects.equals(midwifeAppointment, midwifePrimary)) {
                        indicator = "P";
                    } else {
                        indicator = "B";
                    }
                    String time = rs2.getString(1);
                    String motherName = rs2.getString(2);
                    String motherHI = rs2.getString(5);
                    System.out.println("\n" + Integer.toString(i) + ":  " + time + " " + indicator + " " + motherName + " " + motherHI);
                    String coupleID = rs2.getString(6);
                    allCoupleID.add(coupleID);
                    String aptDate = rs2.getString(9);
                    allAppointmentDates.add(aptDate);
                    String pregnancyNum = rs2.getString(7);
                    allPregnancyNumber.add(pregnancyNum);
                    String appointmentID = rs2.getString(8);
                    allAppointmentID.add(appointmentID);
                    allmotherName.add(rs2.getString(2));
                    allmotherID.add(rs2.getString(5));
                    i++;
                    state = 4;
                    if (i == 1)
                        System.out.println("\nError Invalid date Retype It");
                }
            }
            if (state == 4) {
                if (substate == 0){
                    curappointmentNumber = menuService("\nEnter the appointment number that you would like to work on.\n" +
                            "[E] to exit [D] to go back to another date :");
                }
                if (Objects.equals(curappointmentNumber, "E")) {
                    break;
                } else if (Objects.equals(curappointmentNumber, "D")) {
                    state = 1;
                } else {
                    String momName = allmotherName.get(Integer. parseInt(curappointmentNumber)-1);
                    String momID = allmotherID.get(Integer. parseInt(curappointmentNumber)-1);
                    System.out.println("\nFor " + momName + " " + momID +
                            "\n1. Review Notes" +
                            "\n2. Review test" +
                            "\n3. Add a note" +
                            "\n4. Prescribe a test" +
                            "\n5. Go back to appointments." +
                            "\n");
                    state++;
                }
            }
            if (state == 5){
                String preferedService = menuService("Enter your choice:");
                if (Objects.equals(preferedService, "E"))
                    break;
                String curCoupleID = allCoupleID.get(Integer. parseInt(curappointmentNumber)-1);
                String curPregnancyNumber = allPregnancyNumber.get(Integer. parseInt(curappointmentNumber)-1);
                String curAppointment = allAppointmentID.get(Integer.parseInt(curappointmentNumber)-1);
                String curAptDate = allAppointmentDates.get(Integer.parseInt(curappointmentNumber)-1);
                int numericService = Integer. parseInt(preferedService);
                if (numericService==1){
                    String querySQL3 = "SELECT note.date, note.time, note.content FROM appointment, pregnancy, note where appointment.appointmentid = note.appointmentid and appointment.date = note.date and appointment.coupleid = pregnancy.coupleid and appointment.pregnancynumber = pregnancy.pregnancynumber and pregnancy.coupleid = " + curCoupleID + " and pregnancy.pregnancynumber = " + curPregnancyNumber;
                    java.sql.ResultSet rs3 = statement.executeQuery(querySQL3);
                    while(rs3.next()){
                        String noteDate = rs3.getString(1);
                        String noteTime = rs3.getString(2);
                        String noteContent = rs3.getString(3);
                        System.out.println("\n" + noteDate + " " + noteTime + " " + noteContent);
                    }
                    state--;
                    substate++;
                }
                else if (numericService==2){
                    String querySQL4 = "SELECT dateofbirth, dateprescribed, type, result FROM medicaltest, pregnancy where medicaltest.coupleid = pregnancy.coupleid and medicaltest.pregnancynumber = pregnancy.pregnancynumber and medicaltest.coupleid = " + curCoupleID + " and medicaltest.pregnancynumber = " + curPregnancyNumber;
                    java.sql.ResultSet rs4 = statement.executeQuery(querySQL4);
                    while(rs4.next()){
                        String dateBirth = rs4.getString(1);
                        String datePerscribedTest = rs4.getString(2);
                        String testType = rs4.getString(3);
                        String testResult = rs4.getString(4);
                        if (Objects.equals(testResult,null))
                            testResult = "PENDING";
                        if (Objects.equals(dateBirth, null)) {
                            System.out.println(datePerscribedTest + " [" + testType + "] " + testResult);
                        }
                    }
                    state--;
                    substate++;
                }
                else if (numericService==3){
                    String noteContent = menuService("Please type your observation: ");
                    Random r = new Random();
                    int timeHour = r.nextInt(6);
                    String updateNoteContent = noteContent.replace("'","''");;
                    String insertSQL = "INSERT INTO note VALUES ('" + curAptDate + "'," + "'" + timeHour + ":00 PM', '" + updateNoteContent + "'," + curAppointment + ")";
                    statement.executeUpdate(insertSQL);
                    System.out.println("Inserted Note Successfully!");
                    state--;
                    substate++;
                }
                else if (numericService==4){
                    String testType = menuService("Please enter the type of test: ");
                    Random r2 = new Random();
                    int testID = r2.nextInt(5000);
                    String updatedTestType = testType.replace("'", "''");
                    String insertSQL2 = "INSERT INTO medicaltest VALUES (" + testID + ", null, null, " + "'" + curAptDate + "','" + updatedTestType + "', null, " + curCoupleID + "," + curPregnancyNumber + "," + curID + ", null, null, null)";
                    statement.executeUpdate(insertSQL2);
                    System.out.println("Inserted Test Successfully!");
                    state--;
                    substate++;
                }
                else if (numericService==5){
                    state = 2;
                    substate = 0;
                }
            }
        }
    }


    public static String menuService(String s) {
        Scanner input = new Scanner(System.in);
        System.out.println("\n"+s);
        String inputString = input.nextLine();
        if (Objects.equals(inputString, "E")) {
            System.out.println("\nExited");
            return "E";
        } else {
            return inputString;
        }
    }
}
