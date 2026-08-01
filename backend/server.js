const express = require("express");
const cors = require("cors");
require("dotenv").config();
const { PrismaClient } = require("@prisma/client");
const { PrismaBetterSqlite3 } = require("@prisma/adapter-better-sqlite3");

const app = express();
const adapter = new PrismaBetterSqlite3({ url: process.env.DATABASE_URL });
const prisma = new PrismaClient({ adapter });

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("LifeLine Blood Bank API is running");
});

// GET all donors
app.get("/donors", async (req, res) => {
  try {
    const donors = await prisma.donor.findMany({
      orderBy: { createdAt: "desc" },
    });
    res.json(donors);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch donors" });
  }
});

// POST a new donor (Register Donor)
app.post("/donors", async (req, res) => {
  try {
    const {
      firstName, lastName, dob, gender, bloodType,
      phone, email, address, city, state, weight,
      lastDonationDate,
    } = req.body;

    const donorId = "D-" + Math.floor(10000 + Math.random() * 90000);

    const newDonor = await prisma.donor.create({
      data: {
        donorId,
        firstName,
        lastName,
        dob: new Date(dob),
        gender,
        bloodType,
        phone,
        email,
        address,
        city,
        state,
        weight: weight ? parseFloat(weight) : null,
        lastDonationDate: lastDonationDate ? new Date(lastDonationDate) : null,
      },
    });

    res.status(201).json(newDonor);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to register donor" });
  }
});
// GET all inventory batches
app.get("/inventory", async (req, res) => {
  try {
    const inventory = await prisma.bloodInventory.findMany({
      orderBy: { createdAt: "desc" },
    });
    res.json(inventory);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch inventory" });
  }
});

// POST a new inventory batch (Add Units)
app.post("/inventory", async (req, res) => {
  try {
    const {
      bloodType, units, collectionDate, expiryDate,
      source, storageLocation,
    } = req.body;

    const batchId = "BT-" + Date.now();

    const newBatch = await prisma.bloodInventory.create({
      data: {
        batchId,
        bloodType,
        units: parseInt(units),
        collectionDate: new Date(collectionDate),
        expiryDate: new Date(expiryDate),
        source,
        storageLocation,
      },
    });

    res.status(201).json(newBatch);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to add inventory" });
  }
});
// GET all blood requests
app.get("/requests", async (req, res) => {
  try {
    const requests = await prisma.bloodRequest.findMany({
      orderBy: { createdAt: "desc" },
    });
    res.json(requests);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch requests" });
  }
});

// POST a new blood request
app.post("/requests", async (req, res) => {
  try {
    const {
      hospitalName, contactPerson, contactNumber, patientName,
      bloodType, unitsRequired, requiredByDate, priority,
    } = req.body;

    const requestId = "R-" + Math.floor(1000 + Math.random() * 9000);

    const newRequest = await prisma.bloodRequest.create({
      data: {
        requestId,
        hospitalName,
        contactPerson,
        contactNumber,
        patientName,
        bloodType,
        unitsRequired: parseInt(unitsRequired),
        requiredByDate: new Date(requiredByDate),
        priority: priority || "Normal",
      },
    });

    res.status(201).json(newRequest);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to create request" });
  }
});

// PATCH approve a request
app.patch("/requests/:id/approve", async (req, res) => {
  try {
    const updated = await prisma.bloodRequest.update({
      where: { id: parseInt(req.params.id) },
      data: { status: "Approved" },
    });
    res.json(updated);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to approve request" });
  }
});

// GET all donations
app.get("/donations", async (req, res) => {
  try {
    const donations = await prisma.donation.findMany({
      orderBy: { createdAt: "desc" },
      include: { donor: true },
    });
    res.json(donations);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to fetch donations" });
  }
});

// POST a new donation
app.post("/donations", async (req, res) => {
  try {
    const {
      donorId, bloodType, units, donationDate,
      source, screeningResult,
    } = req.body;

    const donationId = "DON-" + Math.floor(1000 + Math.random() * 9000);

    const newDonation = await prisma.donation.create({
      data: {
        donationId,
        donorId: parseInt(donorId),
        bloodType,
        units: units ? parseInt(units) : 1,
        donationDate: new Date(donationDate),
        source,
        screeningResult: screeningResult || "Passed",
      },
    });

    res.status(201).json(newDonation);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to record donation" });
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});