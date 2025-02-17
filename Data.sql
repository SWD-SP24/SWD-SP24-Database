-- Table: permissions
CREATE TABLE permissions (
    permission_id SERIAL PRIMARY KEY,
    permission_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- Table: membership_packages
CREATE TABLE membership_packages (
    membership_package_id SERIAL PRIMARY KEY,
    membership_package_name VARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(18, 2) NOT NULL,
    validity_period INTEGER NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('active', 'inactive')),
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    admin_id INTEGER
);

-- Table: users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    uid VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(50),
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    avatar VARCHAR(255),
    role VARCHAR(50) NOT NULL CHECK (role IN ('admin', 'member', 'doctor')),
    status VARCHAR(50) NOT NULL CHECK (status IN ('active', 'inactive')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    membership_package_id INTEGER,
    email_activation VARCHAR(50) NOT NULL DEFAULT 'unactivated' CHECK (email_activation IN ('unactivated', 'activated', 'failed')),
    CONSTRAINT FK_users_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages(membership_package_id)
);

-- Table: children
CREATE TABLE children (
    children_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL,
    avatar VARCHAR(255),
    member_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_children_users FOREIGN KEY (member_id) REFERENCES users(user_id)
);

-- Table: growth_indicators
CREATE TABLE growth_indicators (
    growth_indicators_id SERIAL PRIMARY KEY,
    height INTEGER NOT NULL,
    weight INTEGER NOT NULL,
    bmi INTEGER NOT NULL,
    record_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    children_id INTEGER NOT NULL,
    CONSTRAINT FK_growth_indicators_children FOREIGN KEY (children_id) REFERENCES children(children_id)
);

-- Table: consultation_notes
CREATE TABLE consultation_notes (
    consultation_note_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    record_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    member_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    children_id INTEGER NOT NULL,
    CONSTRAINT FK_consultation_notes_member FOREIGN KEY (member_id) REFERENCES users(user_id),
    CONSTRAINT FK_consultation_notes_doctor FOREIGN KEY (doctor_id) REFERENCES users(user_id),
    CONSTRAINT FK_consultation_notes_children FOREIGN KEY (children_id) REFERENCES children(children_id)
);

-- Table: package_permissions
CREATE TABLE package_permissions (
    membership_package_id INTEGER NOT NULL,
    permission_id INTEGER NOT NULL,
    PRIMARY KEY (membership_package_id, permission_id),
    CONSTRAINT FK_package_permissions_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages(membership_package_id),
    CONSTRAINT FK_package_permissions_permissions FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);

-- Table: user_memberships
CREATE TABLE user_memberships (
    user_membership_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    membership_package_id INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP,
    status VARCHAR(50) NOT NULL CHECK (status IN ('active', 'expired', 'cancelled')),
    CONSTRAINT FK_user_memberships_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_user_memberships_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages(membership_package_id)
);

-- Table: categories
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Table: blog_contents
CREATE TABLE blog_contents (
    blog_content_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    thumbnail_url VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('published', 'draft', 'archived')),
    views INTEGER NOT NULL DEFAULT 0,
    likes INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    admin_id INTEGER NOT NULL,
    CONSTRAINT FK_blog_contents_admin FOREIGN KEY (admin_id) REFERENCES users(user_id)
);

-- Table: blog_categories
CREATE TABLE blog_categories (
    blog_content_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (blog_content_id, category_id),
    CONSTRAINT FK_blog_categories_blog_contents FOREIGN KEY (blog_content_id) REFERENCES blog_contents(blog_content_id),
    CONSTRAINT FK_blog_categories_categories FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Table: feedbacks
CREATE TABLE feedbacks (
    feedback_id SERIAL PRIMARY KEY,
    rating INTEGER NOT NULL,
    content TEXT,
    member_id INTEGER NOT NULL,
    CONSTRAINT FK_feedbacks_users FOREIGN KEY (member_id) REFERENCES users(user_id)
);

-- Table: replies
CREATE TABLE replies (
    reply_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    feedback_id INTEGER NOT NULL,
    admin_id INTEGER NOT NULL,
    CONSTRAINT FK_replies_feedbacks FOREIGN KEY (feedback_id) REFERENCES feedbacks(feedback_id),
    CONSTRAINT FK_replies_admin FOREIGN KEY (admin_id) REFERENCES users(user_id)
);

--------------------------------------------------
-- Insert membership packages
--------------------------------------------------
INSERT INTO membership_packages (membership_package_name, price, validity_period, status, created_time, admin_id)
VALUES
('Basic', 9.99, 30, 'active', '2025-01-14 08:00:00', NULL),
('Standard', 19.99, 30, 'active', '2025-01-14 08:00:00', NULL),
('Premium', 49.99, 30, 'active', '2025-01-14 08:00:00', NULL);

--------------------------------------------------
-- Insert permissions
--------------------------------------------------
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

--------------------------------------------------
-- Package permissions for Basic
--------------------------------------------------
INSERT INTO package_permissions (membership_package_id, permission_id)
VALUES
(1, 1), -- Growth Tracking
(1, 2), -- Growth Chart
(1, 5); -- Historical Data Access

--------------------------------------------------
-- Package permissions for Standard
--------------------------------------------------
INSERT INTO package_permissions (membership_package_id, permission_id)
VALUES
(2, 1), -- Growth Tracking (inherited from Basic)
(2, 2), -- Growth Chart (inherited from Basic)
(2, 5), -- Historical Data Access (inherited from Basic)
(2, 4), -- Doctor Consultation
(2, 7), -- Diet Recommendations
(2, 8); -- Activity Suggestions

--------------------------------------------------
-- Package permissions for Premium
--------------------------------------------------
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

--------------------------------------------------
-- Insert Trial membership package
--------------------------------------------------
INSERT INTO membership_packages (membership_package_name, price, validity_period, status, created_time, admin_id)
VALUES
('Trial', 0, 7, 'active', '2025-01-14 08:00:00', NULL);

--------------------------------------------------
-- Package permissions for Trial
--------------------------------------------------
INSERT INTO package_permissions (membership_package_id, permission_id)
VALUES
(4, 1), -- Growth Tracking (inherited from Standard)
(4, 2), -- Growth Chart (inherited from Standard)
(4, 5), -- Historical Data Access (inherited from Standard)
(4, 4), -- Doctor Consultation (inherited from Standard)
(4, 7), -- Diet Recommendations (inherited from Standard)
(4, 8); -- Activity Suggestions

--------------------------------------------------
-- Table: PaymentTransactions
--------------------------------------------------
CREATE TABLE PaymentTransactions (
    PaymentTransactionId SERIAL PRIMARY KEY,
    PaymentId VARCHAR(100),  -- now allows NULL
    UserId INTEGER NOT NULL,
    MembershipPackageId INTEGER NOT NULL,
    Amount DECIMAL(18, 2) NOT NULL,
    TransactionDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) NOT NULL CHECK (Status IN ('pending', 'success', 'failed')),
    CONSTRAINT FK_PaymentTransactions_Users FOREIGN KEY (UserId) REFERENCES users(user_id),
    CONSTRAINT FK_PaymentTransactions_MembershipPackages FOREIGN KEY (MembershipPackageId) REFERENCES membership_packages(membership_package_id)
);

--------------------------------------------------
-- Alter table user_memberships: add PaymentTransactionId column and foreign key
--------------------------------------------------
ALTER TABLE user_memberships
ADD COLUMN PaymentTransactionId INTEGER;

ALTER TABLE user_memberships
ADD CONSTRAINT FK_user_memberships_payment_transactions
FOREIGN KEY (PaymentTransactionId) REFERENCES PaymentTransactions(PaymentTransactionId);

--------------------------------------------------
-- Delete package_permissions and membership_packages for package id = 4 (Trial)
--------------------------------------------------
DELETE FROM package_permissions
WHERE membership_package_id = 4;

DELETE FROM membership_packages
WHERE membership_package_id = 4;

--------------------------------------------------
-- Update the Basic package (membership_package_id = 1)
--------------------------------------------------
UPDATE membership_packages
SET price = 0,
    validity_period = 9999
WHERE membership_package_id = 1;
