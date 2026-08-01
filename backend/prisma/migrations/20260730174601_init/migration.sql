-- CreateTable
CREATE TABLE "Donor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "donorId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "dob" DATETIME NOT NULL,
    "gender" TEXT NOT NULL,
    "bloodType" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT,
    "address" TEXT,
    "city" TEXT,
    "state" TEXT,
    "weight" REAL,
    "lastDonationDate" DATETIME,
    "status" TEXT NOT NULL DEFAULT 'Active',
    "totalDonations" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "BloodInventory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "batchId" TEXT NOT NULL,
    "bloodType" TEXT NOT NULL,
    "units" INTEGER NOT NULL,
    "collectionDate" DATETIME NOT NULL,
    "expiryDate" DATETIME NOT NULL,
    "source" TEXT NOT NULL,
    "storageLocation" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Available',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "BloodRequest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "requestId" TEXT NOT NULL,
    "hospitalName" TEXT NOT NULL,
    "contactPerson" TEXT,
    "contactNumber" TEXT,
    "patientName" TEXT,
    "bloodType" TEXT NOT NULL,
    "unitsRequired" INTEGER NOT NULL,
    "requiredByDate" DATETIME NOT NULL,
    "priority" TEXT NOT NULL DEFAULT 'Normal',
    "status" TEXT NOT NULL DEFAULT 'Pending',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Donation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "donationId" TEXT NOT NULL,
    "donorId" INTEGER NOT NULL,
    "bloodType" TEXT NOT NULL,
    "units" INTEGER NOT NULL DEFAULT 1,
    "donationDate" DATETIME NOT NULL,
    "source" TEXT NOT NULL,
    "screeningResult" TEXT NOT NULL DEFAULT 'Passed',
    "status" TEXT NOT NULL DEFAULT 'Accepted',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Donation_donorId_fkey" FOREIGN KEY ("donorId") REFERENCES "Donor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Donor_donorId_key" ON "Donor"("donorId");

-- CreateIndex
CREATE UNIQUE INDEX "BloodInventory_batchId_key" ON "BloodInventory"("batchId");

-- CreateIndex
CREATE UNIQUE INDEX "BloodRequest_requestId_key" ON "BloodRequest"("requestId");

-- CreateIndex
CREATE UNIQUE INDEX "Donation_donationId_key" ON "Donation"("donationId");
