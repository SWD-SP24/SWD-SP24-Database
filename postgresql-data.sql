-- blog_categories table
CREATE TABLE blog_categories (
    blog_content_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (blog_content_id, category_id)
);

-- blog_contents table
CREATE TABLE blog_contents (
    blog_content_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    thumbnail_url VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    views INTEGER NOT NULL DEFAULT 0,
    likes INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    admin_id INTEGER NOT NULL,
    CONSTRAINT blog_contents_status_check CHECK (status IN ('published', 'draft', 'archived'))
);

-- categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- children table
CREATE TABLE children (
    children_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    avatar VARCHAR(255) NULL,
    member_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dob DATE NULL,
    blood_type VARCHAR(10) NULL,
    allergies VARCHAR(255) NULL,
    chronic_conditions VARCHAR(255) NULL,
    gender VARCHAR(50) NULL,
    status INTEGER NOT NULL DEFAULT 1
);

-- consultation_notes table
CREATE TABLE consultation_notes (
    consultation_note_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    record_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    member_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    children_id INTEGER NOT NULL
);

-- Deviation_Analysis table
CREATE TABLE Deviation_Analysis (
    id SERIAL PRIMARY KEY,
    growth_record_id INTEGER NULL,
    computed_value DECIMAL(5, 2) NULL,
    deviation_percentage DECIMAL(5, 2) NULL
);

-- FAQ table
CREATE TABLE FAQ (
    id SERIAL PRIMARY KEY,
    question VARCHAR(255) NULL,
    answer VARCHAR(255) NULL
);

-- feedbacks table
CREATE TABLE feedbacks (
    feedback_id SERIAL PRIMARY KEY,
    rating INTEGER NOT NULL,
    content TEXT NULL,
    member_id INTEGER NOT NULL
);

-- growth_indicators table
CREATE TABLE growth_indicators (
    growth_indicators_id SERIAL PRIMARY KEY,
    height DECIMAL(10, 4) NOT NULL,
    weight DECIMAL(10, 4) NOT NULL,
    bmi DECIMAL(10, 4) NOT NULL,
    record_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    children_id INTEGER NOT NULL
);

-- membership_packages table
CREATE TABLE membership_packages (
    membership_package_id SERIAL PRIMARY KEY,
    membership_package_name VARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(18, 2) NOT NULL,
    validity_period INTEGER NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    admin_id INTEGER NULL,
    image TEXT NULL,
    yearly_price DECIMAL(18, 2) NULL,
    summary TEXT NULL,
    percent_discount INTEGER NULL,
    CONSTRAINT membership_packages_status_check CHECK (status IN ('active', 'inactive'))
);

-- package_permissions table
CREATE TABLE package_permissions (
    membership_package_id INTEGER NOT NULL,
    permission_id INTEGER NOT NULL,
    PRIMARY KEY (membership_package_id, permission_id)
);

-- PaymentTransactions table
CREATE TABLE PaymentTransactions (
    PaymentTransactionId SERIAL PRIMARY KEY,
    PaymentId VARCHAR(100) NULL,
    UserId INTEGER NOT NULL,
    MembershipPackageId INTEGER NOT NULL,
    Amount DECIMAL(18, 2) NOT NULL,
    TransactionDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) NOT NULL,
    previous_membership_package_name VARCHAR(255) NULL,
    user_membership_id INTEGER NULL,
    CONSTRAINT PaymentTransactions_Status_check CHECK (Status IN ('pending', 'success', 'failed'))
);

-- permissions table
CREATE TABLE permissions (
    permission_id SERIAL PRIMARY KEY,
    permission_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT NULL
);

-- replies table
CREATE TABLE replies (
    reply_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    feedback_id INTEGER NOT NULL,
    admin_id INTEGER NOT NULL
);

-- TeethingRecord table
CREATE TABLE TeethingRecord (
    id SERIAL PRIMARY KEY,
    child_id INTEGER NOT NULL,
    tooth_id INTEGER NOT NULL,
    eruption_date TIMESTAMP NULL,
    record_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    note VARCHAR(255) NULL
);

-- Tooth table
CREATE TABLE Tooth (
    id SERIAL PRIMARY KEY,
    number_of_teeth INTEGER NOT NULL,
    teething_period INTEGER NOT NULL,
    name VARCHAR(255) NULL
);

-- user_memberships table
CREATE TABLE user_memberships (
    user_membership_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    membership_package_id INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP NULL,
    status VARCHAR(50) NOT NULL,
    PaymentTransactionId INTEGER NULL,
    CONSTRAINT user_memberships_status_check CHECK (status IN ('active', 'pending', 'expired', 'cancelled'))
);

-- users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    uid VARCHAR(255) NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(50) NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    avatar VARCHAR(255) NULL,
    role VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    membership_package_id INTEGER NULL,
    email_activation VARCHAR(50) NOT NULL DEFAULT 'unactivated',
    address VARCHAR(100) NULL,
    zipcode VARCHAR(50) NULL,
    state VARCHAR(50) NULL,
    country VARCHAR(50) NULL,
    specialization VARCHAR(255) NULL,
    license_number VARCHAR(255) NULL,
    hospital VARCHAR(255) NULL,
    CONSTRAINT users_role_check CHECK (role IN ('admin', 'member', 'doctor')),
    CONSTRAINT users_status_check CHECK (status IN ('active', 'inactive')),
    CONSTRAINT users_email_activation_check CHECK (email_activation IN ('unactivated', 'activated', 'failed'))
);

-- Vaccination_Schedule table
CREATE TABLE Vaccination_Schedule (
    id SERIAL PRIMARY KEY,
    vaccine_id INTEGER NULL,
    recommended_age_months INTEGER NULL
);

-- Vaccine table
CREATE TABLE Vaccine (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NULL,
    description VARCHAR(255) NULL,
    doses_required INTEGER NULL
);

-- VaccineRecord table
CREATE TABLE VaccineRecord (
    id SERIAL PRIMARY KEY,
    child_id INTEGER NOT NULL,
    vaccine_id INTEGER NOT NULL,
    administered_date TIMESTAMP NOT NULL,
    dose INTEGER NULL,
    next_dose_date TIMESTAMP NULL
);

-- WHO_Growth_Standards table
CREATE TABLE WHO_Growth_Standards (
    id SERIAL PRIMARY KEY,
    age_months INTEGER NULL,
    gender VARCHAR(10) NULL,
    height_avg DECIMAL(10, 4) NOT NULL,
    weight_avg DECIMAL(10, 4) NOT NULL,
    bmi_avg DECIMAL(10, 4) NOT NULL
);

-- Add all foreign key constraints
ALTER TABLE blog_categories ADD CONSTRAINT FK_blog_categories_blog_contents FOREIGN KEY (blog_content_id) REFERENCES blog_contents (blog_content_id);
ALTER TABLE blog_categories ADD CONSTRAINT FK_blog_categories_categories FOREIGN KEY (category_id) REFERENCES categories (category_id);

ALTER TABLE blog_contents ADD CONSTRAINT FK_blog_contents_admin FOREIGN KEY (admin_id) REFERENCES users (user_id);

ALTER TABLE children ADD CONSTRAINT FK_children_users FOREIGN KEY (member_id) REFERENCES users (user_id);

ALTER TABLE consultation_notes ADD CONSTRAINT FK_consultation_notes_children FOREIGN KEY (children_id) REFERENCES children (children_id);
ALTER TABLE consultation_notes ADD CONSTRAINT FK_consultation_notes_doctor FOREIGN KEY (doctor_id) REFERENCES users (user_id);
ALTER TABLE consultation_notes ADD CONSTRAINT FK_consultation_notes_member FOREIGN KEY (member_id) REFERENCES users (user_id);

ALTER TABLE Deviation_Analysis ADD CONSTRAINT FK_Deviation_Analysis_growth_indicators FOREIGN KEY (growth_record_id) REFERENCES growth_indicators (growth_indicators_id);

ALTER TABLE feedbacks ADD CONSTRAINT FK_feedbacks_users FOREIGN KEY (member_id) REFERENCES users (user_id);

ALTER TABLE growth_indicators ADD CONSTRAINT FK_growth_indicators_children FOREIGN KEY (children_id) REFERENCES children (children_id);

ALTER TABLE package_permissions ADD CONSTRAINT FK_package_permissions_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages (membership_package_id);
ALTER TABLE package_permissions ADD CONSTRAINT FK_package_permissions_permissions FOREIGN KEY (permission_id) REFERENCES permissions (permission_id);

ALTER TABLE PaymentTransactions ADD CONSTRAINT FK_PaymentTransactions_MembershipPackages FOREIGN KEY (MembershipPackageId) REFERENCES membership_packages (membership_package_id);
ALTER TABLE PaymentTransactions ADD CONSTRAINT FK_PaymentTransactions_Users FOREIGN KEY (UserId) REFERENCES users (user_id);
ALTER TABLE PaymentTransactions ADD CONSTRAINT FK_PaymentTransactions_UserMembership FOREIGN KEY (user_membership_id) REFERENCES user_memberships (user_membership_id);

ALTER TABLE replies ADD CONSTRAINT FK_replies_admin FOREIGN KEY (admin_id) REFERENCES users (user_id);
ALTER TABLE replies ADD CONSTRAINT FK_replies_feedbacks FOREIGN KEY (feedback_id) REFERENCES feedbacks (feedback_id);

ALTER TABLE TeethingRecord ADD CONSTRAINT FK_TeethingRecord_children FOREIGN KEY (child_id) REFERENCES children (children_id);
ALTER TABLE TeethingRecord ADD CONSTRAINT FK_TeethingRecord_tooth FOREIGN KEY (tooth_id) REFERENCES Tooth (id);

ALTER TABLE user_memberships ADD CONSTRAINT FK_user_memberships_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages (membership_package_id);
ALTER TABLE user_memberships ADD CONSTRAINT FK_user_memberships_users FOREIGN KEY (user_id) REFERENCES users (user_id);
ALTER TABLE user_memberships ADD CONSTRAINT FK_UserMemberships_PaymentTransactions FOREIGN KEY (PaymentTransactionId) REFERENCES PaymentTransactions (PaymentTransactionId);

ALTER TABLE users ADD CONSTRAINT FK_users_membership_packages FOREIGN KEY (membership_package_id) REFERENCES membership_packages (membership_package_id);

ALTER TABLE Vaccination_Schedule ADD CONSTRAINT FK_Vaccination_Schedule_Vaccine FOREIGN KEY (vaccine_id) REFERENCES Vaccine (id);

ALTER TABLE VaccineRecord ADD CONSTRAINT FK_VaccineRecord_children FOREIGN KEY (child_id) REFERENCES children (children_id);
ALTER TABLE VaccineRecord ADD CONSTRAINT FK_VaccineRecord_Vaccine FOREIGN KEY (vaccine_id) REFERENCES Vaccine (id);
