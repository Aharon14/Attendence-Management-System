package dao;

import model.Attendance;
import java.sql.*;
import java.util.*;

public class AttendanceDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/attendance_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root"; // ✅ Change this

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) { e.printStackTrace(); }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean markAttendance(Attendance att) {
        String sql = "INSERT INTO attendance (student_id, date, status) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, att.getStudentId());
            stmt.setDate(2, new java.sql.Date(att.getDate().getTime()));
            stmt.setString(3, att.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Attendance> getAttendanceByStudentId(int studentId) {
        List<Attendance> list = new ArrayList<>();
        String sql = "SELECT * FROM attendance WHERE student_id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                att.setId(rs.getInt("id"));
                att.setStudentId(rs.getInt("student_id"));
                att.setDate(rs.getDate("date"));
                att.setStatus(rs.getString("status"));
                list.add(att);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
 // Get a single attendance record by ID
    public Attendance getAttendanceById(int id) {
        Attendance att = null;
        String sql = "SELECT * FROM attendance WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                att = new Attendance();
                att.setId(rs.getInt("id"));
                att.setStudentId(rs.getInt("student_id"));
                att.setDate(rs.getDate("date"));
                att.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return att;
    }

    // Update attendance
    public boolean updateAttendance(Attendance att) {
        String sql = "UPDATE attendance SET student_id=?, date=?, status=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, att.getStudentId());
            stmt.setDate(2, new java.sql.Date(att.getDate().getTime()));
            stmt.setString(3, att.getStatus());
            stmt.setInt(4, att.getId());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete attendance
    public boolean deleteAttendance(int id) {
        String sql = "DELETE FROM attendance WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
 // Fetch all attendance records (for teacher/admin view)
    public List<Attendance> getAllAttendance() {
        List<Attendance> list = new ArrayList<>();
        String sql = "SELECT * FROM attendance ORDER BY date DESC";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                att.setId(rs.getInt("id"));
                att.setStudentId(rs.getInt("student_id"));
                att.setDate(rs.getDate("date"));
                att.setStatus(rs.getString("status"));
                list.add(att);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
