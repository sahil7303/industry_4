-- Part Management
CREATE TABLE parts (
    serial_number VARCHAR(50) PRIMARY KEY,
    manufacturer_id VARCHAR(50) NOT NULL,
    manufacturing_date TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL,
    specifications JSONB,
    qc_data JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Assembly Management
CREATE TABLE assemblies (
    assembly_id VARCHAR(50) PRIMARY KEY,
    part_serial_number VARCHAR(50) REFERENCES parts(serial_number),
    assembly_date TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL,
    test_results JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Feedback Management
CREATE TABLE feedback (
    feedback_id VARCHAR(50) PRIMARY KEY,
    assembly_id VARCHAR(50) REFERENCES assemblies(assembly_id),
    description TEXT,
    severity VARCHAR(20),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

