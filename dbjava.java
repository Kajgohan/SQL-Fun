import java.sql.*;
import java.util.Scanner;

import static java.lang.Integer.*;

public class dbjava {

    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = null;
        String username = args[0];
        String password = args[1];
        try {
            conn = DriverManager.getConnection
                    ("jdbc:oracle:thin:@oracle.wpi.edu:1521:orcl", username, password);
        }   catch(SQLException e){
            e.printStackTrace();
        }
        if (conn != null){
            System.out.println("You made it. Connection is successful. Take control of your database now!");
        } else{
            System.out.println("Failed to make connection!");
        }


        if(args.length == 2){
            System.out.println("1- Report Patients Basic Information");
            System.out.println("2- Report Doctors Basic Information");
            System.out.println("3- Report Admissions Information");
            System.out.println("4- Update Admissions Payment");
            return;
        }
        else if (args.length == 3){
            if(parseInt(args[2]) == 1){
                System.out.print("Enter Patient SSN: ");
                String patientSSN = reader.nextLine();
                try{
                    PreparedStatement arg1 = conn.prepareStatement("select SSN, fName, lName, address from PATIENT where SSN = ?");
                    arg1.setString(1, patientSSN);
                    ResultSet patient = arg1.executeQuery();
                    patient.next();
                    String pSSN = patient.getString("SSN");
                    String pfName = patient.getString("fName");
                    String plName = patient.getString("lName");
                    String paddress = patient.getString("address");
                    System.out.println("Patient SSN: " + pSSN);
                    System.out.println("Patient First Name: " + pfName);
                    System.out.println("Patient Last Name: " + plName);
                    System.out.println("Patient Address: " + paddress);
                    patient.close();
                    arg1.close();

                }catch(SQLException e){
                    e.printStackTrace();
                }
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return;

            }
            else if(parseInt(args[2]) == 2){
                System.out.print("Enter Doctor ID: ");
                int doctorID = reader.nextInt();
                try{
                    PreparedStatement arg2 = conn.prepareStatement("select dID, FName, LName, Gender from DOCTOR where dID = ?");
                    arg2.setInt(1, doctorID);
                    ResultSet doctor = arg2.executeQuery();
                    doctor.next();
                    String ddID = doctor.getString("dID");
                    String dfName = doctor.getString("FName");
                    String dlName = doctor.getString("LName");
                    String dGender = doctor.getString("Gender");
                    System.out.println("Doctor ID: " + ddID);
                    System.out.println("Doctor First Name: " + dfName);
                    System.out.println("Doctor Last Name: " + dlName);
                    System.out.println("Doctor Gender: " + dGender);
                    doctor.close();
                    arg2.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return;


            }
            else if(parseInt(args[2]) == 3){
                System.out.print("Enter Admission Number: ");
                int admissionNumber = reader.nextInt();
                try{
                    PreparedStatement arg3 = conn.prepareStatement("select SSN, startTime, totalPayment from ADMISSION where admissionID = ?");
                    PreparedStatement arg31 = conn.prepareStatement("select roomNumber, enterTime, leaveTime from RoomVisit where admissionID = ?");
                    PreparedStatement arg32 = conn.prepareStatement("select dID from seePatientsWhoAre where admissionID = ?");
                    arg3.setInt(1, admissionNumber);
                    arg31.setInt(1, admissionNumber);
                    arg32.setInt(1, admissionNumber);
                    ResultSet admission = arg3.executeQuery();
                    ResultSet roomVisit = arg31.executeQuery();
                    ResultSet seePatients = arg32.executeQuery();
                    admission.next();
                    String pSSN = admission.getString("SSN");
                    String asDate = admission.getString("startTime");
                    String tPayment = admission.getString("totalPayment");
                    System.out.println("Admission Number: " + admissionNumber);
                    System.out.println("Patient SSN: " + pSSN);
                    System.out.println("Admission date(Start Date): " + asDate);
                    System.out.println("Total Payment: " + tPayment);
                    System.out.println("Rooms:");
                    while(roomVisit.next()){
                        String roomNum = roomVisit.getString("roomNumber");
                        String fromD = roomVisit.getString("enterTime");
                        String toD = roomVisit.getString("leaveTime");
                        System.out.println("RoomNum: " + roomNum + "    FromDate: " + fromD + "    ToDate: " + toD);
                    }
                    System.out.println("Doctors who examined the patient during this admission: ");
                    while(seePatients.next()){
                        String doctID = seePatients.getString("dID");
                        System.out.println("DoctorID: "+ doctID);
                    }
                    admission.close();
                    roomVisit.close();
                    seePatients.close();
                    arg3.close();
                    arg31.close();
                    arg32.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return;
            }
            else if(parseInt(args[2]) == 4){
                System.out.print("Enter Admission Number: ");
                int admissionNum = reader.nextInt();
                System.out.println();
                System.out.print("Enter the new total payment");
                int newTotalPayment = reader.nextInt();

                PreparedStatement arg4 = null;
                try {
                    arg4 = conn.prepareStatement("update ADMISSION set totalPayment = ? where admissionID = ?");
                    arg4.setInt(2,admissionNum);
                    arg4.setInt(1, newTotalPayment);
                    arg4.executeUpdate();
                    arg4.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return;


            }
            else{
                System.out.println("Parameter 3 is out of range");
                System.out.println("Terminating program.");
                return;
            }
        }
        else{
            System.out.println("Invalid amount of arguments. Terminating program.");
            return;
        }
    }
}
