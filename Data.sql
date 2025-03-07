-- Table: permissions
CREATE TABLE permissions (
    permission_id INT PRIMARY KEY IDENTITY(1,1),
    permission_name NVARCHAR(255) NOT NULL UNIQUE,
    description NVARCHAR(MAX)
);

-- Table: membership_packages
CREATE TABLE membership_packages (
    membership_package_id INT PRIMARY KEY IDENTITY(1,1),
    membership_package_name NVARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(18, 2) NOT NULL,
    validity_period INT NOT NULL,
    status NVARCHAR(50) NOT NULL CHECK (status IN ('active', 'inactive')),
    created_time DATETIME NOT NULL DEFAULT GETDATE(),
    admin_id INT
);

-- Table: users
CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    uid NVARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(50),
    password_hash VARCHAR(255) NOT NULL,
    full_name NVARCHAR(255) NOT NULL,
    avatar VARCHAR(255),
    role NVARCHAR(50) NOT NULL CHECK (role IN ('admin', 'member', 'doctor')),
    status NVARCHAR(50) NOT NULL CHECK (status IN ('active', 'inactive')),
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    membership_package_id INT,
    email_activation NVARCHAR(50) NOT NULL DEFAULT 'unactivated' 
        CHECK (email_activation IN ('unactivated', 'activated', 'failed')),
    address VARCHAR(100),
    zipcode VARCHAR(50),
    state VARCHAR(50),
    phone_number VARCHAR(50),
    CONSTRAINT FK_users_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages(membership_package_id)
);

-- Table: children
CREATE TABLE children (
    children_id INT PRIMARY KEY IDENTITY(1,1),
    full_name NVARCHAR(255) NOT NULL,
    age INT NOT NULL,
    avatar VARCHAR(255),
    member_id INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_children_users FOREIGN KEY (member_id) REFERENCES users(user_id)
);

-- Table: growth_indicators
CREATE TABLE growth_indicators (
    growth_indicators_id INT PRIMARY KEY IDENTITY(1,1),
    height DECIMAL(10,2) NOT NULL,
    weight DECIMAL(10,2) NOT NULL,
    bmi DECIMAL(10,2) NOT NULL,
    record_time DATETIME NOT NULL DEFAULT GETDATE(),
    children_id INT NOT NULL,
    CONSTRAINT FK_growth_indicators_children FOREIGN KEY (children_id) REFERENCES children(children_id)
);

-- Table: consultation_notes
CREATE TABLE consultation_notes (
    consultation_note_id INT PRIMARY KEY IDENTITY(1,1),
    content NVARCHAR(MAX) NOT NULL,
    record_time DATETIME NOT NULL DEFAULT GETDATE(),
    member_id INT NOT NULL,
    doctor_id INT NOT NULL,
    children_id INT NOT NULL,
    CONSTRAINT FK_consultation_notes_member FOREIGN KEY (member_id) REFERENCES users(user_id),
    CONSTRAINT FK_consultation_notes_doctor FOREIGN KEY (doctor_id) REFERENCES users(user_id),
    CONSTRAINT FK_consultation_notes_children FOREIGN KEY (children_id) REFERENCES children(children_id)
);

-- Table: package_permissions
CREATE TABLE package_permissions (
    membership_package_id INT NOT NULL,
    permission_id INT NOT NULL,
    PRIMARY KEY (membership_package_id, permission_id),
    CONSTRAINT FK_package_permissions_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages(membership_package_id),
    CONSTRAINT FK_package_permissions_permissions FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);
-- Table: PaymentTransactions
CREATE TABLE PaymentTransactions (
    PaymentTransactionId INT PRIMARY KEY IDENTITY(1,1),
    PaymentId NVARCHAR(100) NULL, -- Có thể null (theo cập nhật sau này)
    UserId INT NOT NULL, -- ID người dùng thanh toán
    MembershipPackageId INT NOT NULL, -- ID gói thành viên
    Amount DECIMAL(18,2) NOT NULL, -- Số tiền thanh toán
    TransactionDate DATETIME NOT NULL DEFAULT GETDATE(), -- Thời gian giao dịch
    Status NVARCHAR(50) NOT NULL CHECK (Status IN ('pending', 'success', 'failed')), -- Trạng thái giao dịch
    CONSTRAINT FK_PaymentTransactions_Users FOREIGN KEY (UserId) REFERENCES users(user_id),
    CONSTRAINT FK_PaymentTransactions_MembershipPackages FOREIGN KEY (MembershipPackageId) REFERENCES membership_packages(membership_package_id)
);
-- Table: user_memberships
CREATE TABLE user_memberships (
    user_membership_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    membership_package_id INT NOT NULL,
    start_date DATETIME NOT NULL DEFAULT GETDATE(),
    end_date DATETIME,
    status NVARCHAR(50) NOT NULL CHECK (status IN ('active', 'expired', 'cancelled')),
    PaymentTransactionId INT NULL, -- Thêm trực tiếp khi tạo bảng
    CONSTRAINT FK_user_memberships_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_user_memberships_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages(membership_package_id),
    CONSTRAINT FK_UserMemberships_PaymentTransactions FOREIGN KEY (PaymentTransactionId) REFERENCES PaymentTransactions(PaymentTransactionId)
);

-- Table: categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(255) NOT NULL
);

-- Table: blog_contents
CREATE TABLE blog_contents (
    blog_content_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255) NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
    thumbnail_url VARCHAR(255) NOT NULL,
    status NVARCHAR(50) NOT NULL CHECK (status IN ('published', 'draft', 'archived')),
    views INT NOT NULL DEFAULT 0,
    likes INT NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    admin_id INT NOT NULL,
    CONSTRAINT FK_blog_contents_admin FOREIGN KEY (admin_id) REFERENCES users(user_id)
);

-- Table: blog_categories
CREATE TABLE blog_categories (
    blog_content_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (blog_content_id, category_id),
    CONSTRAINT FK_blog_categories_blog_contents FOREIGN KEY (blog_content_id) REFERENCES blog_contents(blog_content_id),
    CONSTRAINT FK_blog_categories_categories FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Table: feedbacks
CREATE TABLE feedbacks (
    feedback_id INT PRIMARY KEY IDENTITY(1,1),
    rating INT NOT NULL,
    content NVARCHAR(MAX),
    member_id INT NOT NULL,
    CONSTRAINT FK_feedbacks_users FOREIGN KEY (member_id) REFERENCES users(user_id)
);

-- Table: replies
CREATE TABLE replies (
    reply_id INT PRIMARY KEY IDENTITY(1,1),
    content NVARCHAR(MAX) NOT NULL,
    feedback_id INT NOT NULL,
    admin_id INT NOT NULL,
    CONSTRAINT FK_replies_feedbacks FOREIGN KEY (feedback_id) REFERENCES feedbacks(feedback_id),
    CONSTRAINT FK_replies_admin FOREIGN KEY (admin_id) REFERENCES users(user_id)
);



-- Thêm các gói thành viên
INSERT INTO membership_packages (membership_package_name, price, validity_period, status, created_time, admin_id)
VALUES
('Basic', 9.99, 30, 'active', '2025-01-14 08:00:00', null),
('Standard', 19.99, 30, 'active', '2025-01-14 08:00:00', null),
('Premium', 49.99, 30, 'active', '2025-01-14 08:00:00', null);

-- Thêm các quyền
INSERT INTO permissions (permission_name, description)
VALUES
('Growth Tracking', 'Allows tracking growth metrics (height, weight).'),
('Growth Chart', 'Provides access to growth charts (BMI, trends).'),
('Multiple Children Tracking', 'Track data for multiple children.'),
('Doctor Consultation', 'Share data with doctors for advice.'),
('Historical Data Access', 'Access past growth data for analysis.'),
('Diet Recommendations', 'Receive diet suggestions based on growth metrics.'),
('Activity Suggestions', 'Get activity recommendations tailored to child development.'),
('Custom Growth Milestones', 'Set and track custom milestones for child growth.'),
('Health Alerts', 'Receive automatic alerts for health concerns.');

-- Cập nhật bảng package_permissions cho từng gói thành viên

-- Gói Basic (thừa hưởng không có, chỉ có 3 tính năng)
INSERT INTO package_permissions (membership_package_id, permission_id)
VALUES
(1, 1), -- Growth Tracking
(1, 2), -- Growth Chart
(1, 5); -- Historical Data Access

-- Gói Standard (thừa hưởng từ gói Basic + các tính năng mới)
INSERT INTO package_permissions (membership_package_id, permission_id)
VALUES
(2, 1), -- Growth Tracking (thừa hưởng từ Basic)
(2, 2), -- Growth Chart (thừa hưởng từ Basic)
(2, 5), -- Historical Data Access (thừa hưởng từ Basic)
(2, 4), -- Doctor Consultation
(2, 7), -- Diet Recommendations
(2, 8); -- Activity Suggestions

-- Gói Premium (thừa hưởng từ gói Standard + các tính năng mới)
INSERT INTO package_permissions (membership_package_id, permission_id)
VALUES
(3, 1), -- Growth Tracking
(3, 2), -- Growth Chart
(3, 5), -- Historical Data Access
(3, 4), -- Doctor Consultation
(3, 6), -- Diet Recommendations
(3, 7), -- Activity Suggestions
(3, 8), -- Custom Growth Milestones
(3, 9); -- Health Alerts

-- Thêm gói Trial
INSERT INTO membership_packages (membership_package_name, price, validity_period, status, created_time, admin_id)
VALUES
('Trial', 0, 7, 'active', '2025-01-14 08:00:00', null);

-- Thêm các quyền cho gói Trial (thừa hưởng từ gói Standard)
INSERT INTO package_permissions (membership_package_id, permission_id)
VALUES
(4, 1), -- Growth Tracking (thừa hưởng từ Standard)
(4, 2), -- Growth Chart (thừa hưởng từ Standard)
(4, 5), -- Historical Data Access (thừa hưởng từ Standard)
(4, 4), -- Doctor Consultation (thừa hưởng từ Standard)
(4, 7), -- Diet Recommendations (thừa hưởng từ Standard)
(4, 8); -- Activity Suggestions

-- 1. Xoá các bản ghi từ bảng package_permissions có liên quan đến gói có id = 4
DELETE FROM package_permissions
WHERE membership_package_id = 4;

-- 2. Xoá gói thành viên có membership_package_id = 4
DELETE FROM membership_packages
WHERE membership_package_id = 4;

-- 3. Cập nhật gói có membership_package_id = 1: set price = 0 và validity_period = 9999
UPDATE membership_packages
SET price = 0,
    validity_period = 9999
WHERE membership_package_id = 1;
CREATE TABLE Vaccine (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255),
    description NVARCHAR(255),
    doses_required INT
);

CREATE TABLE Vaccination_Schedule (
    id INT IDENTITY(1,1) PRIMARY KEY,
    vaccine_id INT,
    recommended_age_months INT,
    FOREIGN KEY (vaccine_id) REFERENCES Vaccine(id)
);

CREATE TABLE Deviation_Analysis (
    id INT IDENTITY(1,1) PRIMARY KEY,
    growth_record_id INT,
    computed_value DECIMAL(5,2),
    deviation_percentage DECIMAL(5,2),
    FOREIGN KEY (growth_record_id) REFERENCES growth_indicators(growth_indicators_id)
);

CREATE TABLE WHO_Growth_Standards (
    id INT IDENTITY(1,1) PRIMARY KEY,
    age_months INT,
    gender VARCHAR(10),  
    height_avg DECIMAL(5,2),
    weight_avg DECIMAL(5,2),
    bmi_avg DECIMAL(5,2)
);

CREATE TABLE FAQ (
    id INT IDENTITY(1,1) PRIMARY KEY,
    question NVARCHAR(255),
    answer NVARCHAR(255)
);

ALTER TABLE Vaccination_Schedule
ADD child_id INT NOT NULL,
    scheduled_date DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_child FOREIGN KEY (child_id) REFERENCES children(children_id);

CREATE TABLE Tooth (
    id INT IDENTITY(1,1) PRIMARY KEY,
    number_of_teeth INT NOT NULL,
    teething_period INT NOT NULL, -- Changed to INT for months
    name VARCHAR(255) NOT NULL
);
CREATE TABLE TeethingRecord (
    id INT IDENTITY(1,1) PRIMARY KEY,
    child_id INT NOT NULL,
    tooth_id INT NOT NULL,
    eruption_date DATETIME NULL,
    record_time DATETIME DEFAULT GETDATE(),
    note NVARCHAR(255) NULL,
    FOREIGN KEY (child_id) REFERENCES children(children_id),
    FOREIGN KEY (tooth_id) REFERENCES Tooth(id)
);
CREATE TABLE VaccineRecord (
    id INT IDENTITY(1,1) PRIMARY KEY,
    child_id INT NOT NULL,
    vaccine_id INT NOT NULL,
    administered_date DATETIME NOT NULL,
    dose NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_VaccineRecord_Child FOREIGN KEY (child_id) REFERENCES Child(id),
    CONSTRAINT FK_VaccineRecord_Vaccine FOREIGN KEY (vaccine_id) REFERENCES Vaccine(id)
);

