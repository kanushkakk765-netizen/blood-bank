require('dotenv').config();
const { GoogleGenerativeAI } = require("@google/generative-ai");

async function testGemini() {
  try {
    const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
    const model = genAI.getGenerativeModel({ model: "gemini-flash-latest" });

    const result = await model.generateContent("Say hello in exactly 5 words.");
    const response = result.response;
    const text = response.text();

    console.log("SUCCESS! Gemini responded:");
    console.log(text);
  } catch (error) {
    console.error("ERROR calling Gemini API:");
    console.error(error.message);
  }
}

testGemini();