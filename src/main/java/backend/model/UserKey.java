package backend.model;

import java.time.LocalDateTime;

public class UserKey {
    private Integer id;
    private Integer userId;
    private String publicKeyContent;
    private String status;
    private LocalDateTime createdAt;
    private LocalDateTime revokedAt;

    public UserKey() {}

    public UserKey(Integer userId, String publicKeyContent) {
        this.userId = userId;
        this.publicKeyContent = publicKeyContent;
        this.status = "ACTIVE";
        this.createdAt = LocalDateTime.now();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPublicKeyContent() {
        return publicKeyContent;
    }

    public void setPublicKeyContent(String publicKeyContent) {
        this.publicKeyContent = publicKeyContent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getRevokedAt() {
        return revokedAt;
    }

    public void setRevokedAt(LocalDateTime revokedAt) {
        this.revokedAt = revokedAt;
    }

    public boolean isActive() {
        return "ACTIVE".equals(status);
    }

    @Override
    public String toString() {
        return "UserKey{" +
                "id=" + id +
                ", userId=" + userId +
                ", status='" + status + '\'' +
                ", createdAt=" + createdAt +
                ", revokedAt=" + revokedAt +
                '}';
    }
}

