package Model;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Date;

/**
 * @author abdussalam
 */
public class Model {

    public int registerationFunciton(User user, Connection con) throws SQLException {
        Statement stmt = con.createStatement();
        String sql = "insert into user (address,name,notes,password,phone_num,user_name,job) values ( '" + user.getAddress() + "','" + user.getName() + "','" + user.getNotes() + "'"
                + ",'" + user.getPasswrd() + "','" + user.getPhoneNum() + "','" + user.getUserName() + "','" + user.getJob() + "');";
        return stmt.executeUpdate(sql);
    }

    public int checkValidation(String username, Connection con) throws SQLException {
        Statement stmt = (Statement) con.createStatement();
        String sql = "select * from user ;";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String uname = rs.getString("user_name");
            if (uname.equals(username)) {
                return 0;
            }
        }
        return 1;
    }

    public HashMap<String, String> isValid(String username, String password, Connection con) throws SQLException {
        Statement stmt = (Statement) con.createStatement();
        System.out.println("user " + username + " pass " + password);
        String sql = "select * from user where user_name = '" + username + "' and password = '" + password + "';";
        ResultSet rs = stmt.executeQuery(sql);
        User user = new User();
        HashMap<String, String> userData = new HashMap<>();
        if (rs.next()) {
            userData.put("id", rs.getString("id"));
            userData.put("address", rs.getString("address"));
            userData.put("name", rs.getString("name"));
            userData.put("notes", rs.getString("notes"));
            userData.put("password", rs.getString("password"));
            userData.put("phone_num", rs.getString("phone_num"));
            userData.put("user_name", rs.getString("user_name"));
            userData.put("job", rs.getString("job"));
            return userData;
        }
        return null;
    }

    public int main() {
        return 0;
    }

//    public User getUserData(Connection con, String table, String name) throws SQLException {
//        Statement stmt = con.createStatement();
//        String sql = "select * from " + table + " where name ='" + name + "'";
//        ResultSet rs = stmt.executeQuery(sql);
//        rs.next();
//        String s = rs.getString(1);
//        int type = 0;
//        int ssn = 4;
//        User user = new User(s, "",
//                0, "", "",
//                "", "", ssn);
//        return user;
//    }
    List<String> getAllNames(Connection con) throws SQLException {
        Statement stmt = con.createStatement();
        String sql = "select * from client";
        ResultSet rs = stmt.executeQuery(sql);
        List<String> list = new ArrayList<>();
        while (rs.next()) {
            list.add(rs.getString("name"));
        }
        return list;
    }

    public List<String> getData(String query) throws SQLException {
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        List<String> all = getAllNames(con);
        int size = all.size();
        String name = "";
        query = query.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for (int i = 0; i < size; i++) {
            name = all.get(i).toLowerCase();
            if (name.startsWith(query)) {
                matched.add(all.get(i));
            }
        }
        return matched;
    }

//    int updateFunciton(User user, Connection con) throws SQLException {
//        Statement stmt = con.createStatement();
//        PreparedStatement pstatement = null;
//        String sql = "update  User set  name = '" + user.getName() + "', password = '" + user.getPassword() + "', type= " + user.isAdmin() + ""
//                + ", address='" + user.getAddress() + "',phone ='" + user.getPhone() + "',email='" + user.getEmail() + "', university='" + user.getUniversity() + "',SSN=" + user.getSSN() + " "
//                + "WHERE SSN = " + user.getSSN() + ";";
//        return stmt.executeUpdate(sql);
//    }
    public String checkClient(String name, Connection con) throws SQLException {
        Statement stmt = (Statement) con.createStatement();
        String sql = "select id , name from client where name ='" + name + "' ";
        System.out.println("befor exec");

        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            String id = rs.getString("id");
            String uname = rs.getString("name");
            System.out.println(sql + "   name: " + name + " " + id + "uname " + uname);

            if ((uname.equals(name))) {
                return id;
            }
        }
        return "false";
    }

    public HashMap<String, String> getClientData(Connection con, String name) throws SQLException {
        Statement stmt = con.createStatement();
        HashMap<String, String> clientData = new HashMap<>();
        String sql = "select * from client where name = '" + name + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            clientData.put("name", rs.getString("name"));
            clientData.put("id", rs.getString("id"));
            clientData.put("userName", rs.getString("userName"));
            clientData.put("medicalReport", rs.getString("medicalReport"));
            clientData.put("arrivingDate", rs.getString("arrivingDate"));
            clientData.put("departureDate", rs.getString("departureDate"));
            clientData.put("passportNum", rs.getString("passportNum"));
            clientData.put("ticketNum", rs.getString("ticketNum"));
            clientData.put("report", rs.getString("report"));
            clientData.put("others", rs.getString("others"));
            clientData.put("notes", rs.getString("notes"));
            clientData.put("medical_report_details", rs.getString("medical_report_details"));
            clientData.put("medicalReport_2", rs.getString("medicalReport_2"));
            clientData.put("helperName", rs.getString("helperName"));
            clientData.put("mandoop", rs.getString("mandoop"));
        }
        return clientData;
    }

    public ArrayList<HashMap<String, String>> getAllData(String clientID) throws SQLException {
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        Statement stmt = con.createStatement();
        ArrayList<HashMap<String, String>> alldata = new ArrayList<>();
        String sql = "select * from data,client,user where clientID = client.id and  userID = user.id and client.id = '" + clientID + "' and action = 1 ;";
        System.out.println(sql);
        ResultSet rs = stmt.executeQuery(sql);
        try {
            while (rs.next()) {
                HashMap<String, String> data = new HashMap<>();
                data.put("client.name", rs.getString("client.name"));
                data.put("userName", rs.getString("userName"));
                data.put("medicalReport", rs.getString("medicalReport"));
                data.put("arrivingDate", rs.getString("arrivingDate"));
                data.put("departureDate", rs.getString("departureDate"));
                data.put("passportNum", rs.getString("passportNum"));
                data.put("ticketNum", rs.getString("ticketNum"));
                data.put("others", rs.getString("others"));
                data.put("medical_report_details", rs.getString("medical_report_details"));
                data.put("address", rs.getString("address"));
                data.put("user.name", rs.getString("user.name"));
                data.put("user.id", rs.getString("user.id"));
                data.put("user.notes", rs.getString("user.notes"));
                data.put("password", rs.getString("password"));
                data.put("phone_num", rs.getString("phone_num"));
                data.put("user_name", rs.getString("user_name"));
                data.put("job", rs.getString("job"));
                data.put("medicalAction", rs.getString("medicalAction"));
                data.put("date", rs.getString("date"));
                data.put("note", rs.getString("note"));
                data.put("action", rs.getString("action"));
                data.put("data.id", rs.getString("data.id"));
                data.put("creationDate", rs.getString("creationDate"));
                data.put("deletionDate", rs.getString("deletionDate"));
                data.put("client.id", rs.getString("client.id"));
                data.put("bookingStatus", rs.getString("bookingStatus"));
                data.put("bookingDate", rs.getString("bookingDate"));
                data.put("bookingNotes", rs.getString("bookingNotes"));
                alldata.add(data);
            }
        } catch (Exception ex) {
            System.out.println("inside the catch in getAllData function:");
        }
        con.close();
        return alldata;
    }
//    public int editClientData(ArrayList<HashMap<String, String>> allData, Connection con, String idName) throws SQLException {
//        Statement stmt = con.createStatement();
//        PreparedStatement pstatement = null;
//        int id = Integer.parseInt(idName);
//        String sql = "update data set  name = '" + editData.get("name") + "'"
//                + ", arrivingDate='" + editData.get("arrivingDate") + "' ,medicalReport='" + editData.get("medicalReport") + "'"
//                + ", medical_report_details='" + editData.get("medical_report_details") + "' WHERE id =" + id + ";";
//        return stmt.executeUpdate(sql);
//    }
    public int addClient(Connection con, String userID, String medicalAction, String date, String clientID) throws SQLException {
        Statement stmt = con.createStatement();
        System.out.println("Date hhere");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date2 = new Date();
        System.out.println(dateFormat.format(date2)); //2016/11/16 12:08:43
        //String creationDate = dateFormat.format(date2);
        String creationDate = "2017-09-11";
        System.out.println("cout date:: " + date);
        String defalutDate = "2017-09-11";
        String sql = "insert into data (userID,medicalAction,date,clientID,creationDate , deletionDate)"
                + " values ( " + userID + ",'" + medicalAction + "','" + date + "'"
                + "," + clientID + ", '" + creationDate + "' , '" + defalutDate + "' );";
        return stmt.executeUpdate(sql);
    }

    public int delete(Connection con, String dataID) throws SQLException {
        Statement stmt = con.createStatement();
        PreparedStatement pstatement = null;
        String deletionDate = "2017-01-01";
        String sql = "update  data set  action = 0 , deletionDate = '" + deletionDate + "'"
                + " WHERE id = " + dataID + ";";
        return stmt.executeUpdate(sql);
    }

}
