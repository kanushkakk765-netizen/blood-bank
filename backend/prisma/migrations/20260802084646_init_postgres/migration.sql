-- CreateTable
CREATE TABLE "Donor" (
    "id" SERIAL NOT NULL,
    "donorId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "dob" TIMESTAMP(3) NOT NULL,
    "gender" TEXT NOT NULL,
    "bloodType" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT,
    "address" TEXT,
    "city" TEXT,
    "state" TEXT,
    "weight" DOUBLE PRECISION,
    "lastDonationDate" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'Active',
    "totalDonations" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Donor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BloodInventory" (
    "id" SERIAL NOT NULL,
    "batchId" TEXT NOT NULL,
    "bloodType" TEXT NOT NULL,
    "units" INTEGER NOT NULL,
    "collectionDate" TIMESTAMP(3) NOT NULL,
    "expiryDate" TIMESTAMP(3) NOT NULL,
    "source" TEXT NOT NULL,
    "storageLocation" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Available',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BloodInventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BloodRequest" (
    "id" SERIAL NOT NULL,
    "requestId" TEXT NOT NULL,
    "hospitalName" TEXT NOT NULL,
    "contactPerson" TEXT,
    "contactNumber" TEXT,
    "patientName" TEXT,
    "bloodType" TEXT NOT NULL,
    "unitsRequired" INTEGER NOT NULL,
    "requiredByDate" TIMESTAMP(3) NOT NULL,
    "priority" TEXT NOT NULL DEFAULT 'Normal',
    "status" TEXT NOT NULL DEFAULT 'Pending',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BloodRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Donation" (
    "id" SERIAL NOT NULL,
    "donationId" TEXT NOT NULL,
    "donorId" INTEGER NOT NULL,
    "bloodType" TEXT NOT NULL,
    "units" INTEGER NOT NULL DEFAULT 1,
    "donationDate" TIMESTAMP(3) NOT NULL,
    "source" TEXT NOT NULL,
    "screeningResult" TEXT NOT NULL DEFAULT 'Passed',
    "status" TEXT NOT NULL DEFAULT 'Accepted',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Donation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Donor_donorId_key" ON "Donor"("donorId");

-- CreateIndex
CREATE UNIQUE INDEX "BloodInventory_batchId_key" ON "BloodInventory"("batchId");

-- CreateIndex
CREATE UNIQUE INDEX "BloodRequest_requestId_key" ON "BloodRequest"("requestId");

-- CreateIndex
CREATE UNIQUE INDEX "Donation_donationId_key" ON "Donation"("donationId");

-- AddForeignKey
ALTER TABLE "Donation" ADD CONSTRAINT "Donation_donorId_fkey" FOREIGN KEY ("donorId") REFERENCES "Donor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
