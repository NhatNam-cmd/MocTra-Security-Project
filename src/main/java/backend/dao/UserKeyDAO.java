package backend.dao;

import backend.db.DBConnect;
import backend.model.UserKey;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserKeyDAO {

    public boolean savePublicKey(UserKey userKey) {
        String sql = "INSERT INTO user_keys (user_id, public_key_content, status, created_at) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, userKey.getUserId());
            ps.setString(2, userKey.getPublicKeyContent());
            ps.setString(3, "ACTIVE");
            ps.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        userKey.setId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public UserKey getActivePublicKeyByUserId(Integer userId) {
        String sql = "SELECT id, user_id, public_key_content, status, created_at, revoked_at " +
                "FROM user_keys WHERE user_id = ? AND status = 'ACTIVE' ORDER BY created_at DESC LIMIT 1";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapResultSetToUserKey(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<UserKey> getAllKeysByUserId(Integer userId) {
        List<UserKey> keys = new ArrayList<>();
        String sql = "SELECT id, user_id, public_key_content, status, created_at, revoked_at " +
                "FROM user_keys WHERE user_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                keys.add(mapResultSetToUserKey(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return keys;
    }

    public boolean revokeKey(Integer keyId) {
        String sql = "UPDATE user_keys SET status = 'REVOKED', revoked_at = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            ps.setInt(2, keyId);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public UserKey getKeyById(Integer keyId) {
        String sql = "SELECT id, user_id, public_key_content, status, created_at, revoked_at " +
                "FROM user_keys WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, keyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapResultSetToUserKey(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getKeyCount(Integer userId) {
        String sql = "SELECT COUNT(*) as count FROM user_keys WHERE user_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private UserKey mapResultSetToUserKey(ResultSet rs) throws SQLException {
        UserKey userKey = new UserKey();
        userKey.setId(rs.getInt("id"));
        userKey.setUserId(rs.getInt("user_id"));
        userKey.setPublicKeyContent(rs.getString("public_key_content"));
        userKey.setStatus(rs.getString("status"));

        Timestamp createdAt = rs.getTimestamp("created_at");
        if (createdAt != null) {
            userKey.setCreatedAt(createdAt.toLocalDateTime());
        }

        Timestamp revokedAt = rs.getTimestamp("revoked_at");
        if (revokedAt != null) {
            userKey.setRevokedAt(revokedAt.toLocalDateTime());
        }

        return userKey;
    }
}
