// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.6.0;

contract CertificateVerify {
    // Struct to represent a student certificate
    struct Certificate {
        uint256 studentId;
        string studentName;
        uint256 dateOfIssuance;
        string courseTitle;
        string instituteSignature;
    }

    // Mapping from student address to their certificate
    mapping(address => Certificate) public studentCertificates;

    // Event emitted when a new certificate is issued
    event CertificateIssued(address indexed studentAddress, uint256 dateOfIssuance);

    // Function to issue a new certificate
    function issueCertificate(
        uint256 _studentId,
        string memory _studentName,
        string memory _courseTitle,
        string memory _instituteSignature
    ) public {
        // Ensure the student does not already have a certificate
        require(studentCertificates[msg.sender].dateOfIssuance == 0, "Certificate already issued");

        // Create a new certificate
        Certificate memory newCertificate = Certificate({
            studentId: _studentId,
            studentName: _studentName,
            dateOfIssuance: block.timestamp,
            courseTitle: _courseTitle,
            instituteSignature: _instituteSignature
        });

        // Store the certificate for the student
        studentCertificates[msg.sender] = newCertificate;

        // Emit an event indicating that a new certificate has been issued
        emit CertificateIssued(msg.sender, block.timestamp);
    }
}
