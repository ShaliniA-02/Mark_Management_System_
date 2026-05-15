package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.StudentMark;

public class MarkDAO {

    private final String URL =
            "jdbc:mysql://localhost:3306/studentdb";

    private final String USER = "root";
    private final String PASS = "@shalini075881";

    // =========================
    // DRIVER LOAD
    // =========================
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =========================
    // CONNECTION
    // =========================
    public Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASS);
    }

    // =========================
    // AUTO ID
    // =========================
    public int getNextId() throws Exception {

        int nextId = 101;

        String sql = "SELECT MAX(StudentID) FROM StudentMarks";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next() && rs.getInt(1) != 0) {
                nextId = rs.getInt(1) + 1;
            }
        }

        return nextId;
    }

    // =========================
    // INSERT MARK
    // =========================
    public void addMark(StudentMark sm) throws Exception {

        String sql =
            "INSERT INTO StudentMarks (StudentID, StudentName, Subject, Marks, ExamDate) " +
            "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sm.getStudentID());
            ps.setString(2, sm.getStudentName());
            ps.setString(3, sm.getSubject());
            ps.setInt(4, sm.getMarks());
            ps.setDate(5, sm.getExamDate());

            ps.executeUpdate();
        }
    }

    // =========================
    // GET ALL
    // =========================
    public List<StudentMark> getAllMarks() throws Exception {

        List<StudentMark> list = new ArrayList<>();

        String sql = "SELECT * FROM StudentMarks ORDER BY StudentID ASC";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }

        return list;
    }

    // =========================
    // GET BY ID (IMPORTANT FIX)
    // =========================
    public StudentMark getMarkById(int id) throws Exception {

        String sql = "SELECT * FROM StudentMarks WHERE StudentID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }
        }

        return null;
    }

    // =========================
    // UPDATE MARK
    // =========================
    public boolean updateMark(StudentMark sm) throws Exception {

        String sql = "UPDATE StudentMarks SET Marks=? WHERE StudentID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, sm.getMarks());
            ps.setInt(2, sm.getStudentID());

            return ps.executeUpdate() > 0;
        }
    }

    // =========================
    // DELETE MARK
    // =========================
    public boolean deleteMark(int id) throws Exception {

        String sql = "DELETE FROM StudentMarks WHERE StudentID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        }
    }

    // =========================
    // SUBJECT FILTER
    // =========================
    public List<StudentMark> getMarksBySubject(String subject) throws Exception {

        List<StudentMark> list = new ArrayList<>();

        String sql =
            "SELECT * FROM StudentMarks WHERE LOWER(Subject)=LOWER(?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, subject);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }

        return list;
    }

    // =========================
    // CONDITION FILTER
    // =========================
    public List<StudentMark> getMarksByCondition(String operator, int marks)
            throws Exception {

        List<StudentMark> list = new ArrayList<>();

        if (!operator.equals(">") &&
            !operator.equals("<") &&
            !operator.equals(">=") &&
            !operator.equals("<=") &&
            !operator.equals("=")) {

            throw new IllegalArgumentException("Invalid operator");
        }

        String sql =
            "SELECT * FROM StudentMarks WHERE Marks " + operator + " ? ORDER BY Marks DESC";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, marks);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }

        return list;
    }

    // =========================
    // TOP N
    // =========================
    public List<StudentMark> getTopNStudents(int n) throws Exception {

        List<StudentMark> list = new ArrayList<>();

        String sql = "SELECT * FROM StudentMarks ORDER BY Marks DESC LIMIT ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, n);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }

        return list;
    }

    // =========================
    // ABOVE MARKS
    // =========================
    public List<StudentMark> getAboveMarks(int marks) throws Exception {

        List<StudentMark> list = new ArrayList<>();

        String sql =
            "SELECT * FROM StudentMarks WHERE Marks >= ? ORDER BY Marks DESC";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, marks);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }

        return list;
    }

    // =========================
    // MAP ROW
    // =========================
    private StudentMark mapRow(ResultSet rs) throws SQLException {

        StudentMark sm = new StudentMark();

        sm.setStudentID(rs.getInt("StudentID"));
        sm.setStudentName(rs.getString("StudentName"));
        sm.setSubject(rs.getString("Subject"));
        sm.setMarks(rs.getInt("Marks"));
        sm.setExamDate(rs.getDate("ExamDate"));

        return sm;
    }
}