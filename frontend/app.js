const API_BASE = "http://127.0.0.1:8000";

function navigateToLoan() {
    window.location.href = "loan.html";
}

function navigateToDecision() {
    window.location.href = "decision.html";
}

function goHome() {
    window.location.href = "index.html";
}

async function submitLoan() {
    const customerId = document.getElementById("customer-id").value;
    const amount = document.getElementById("loan-amount").value;
    const duration = document.getElementById("loan-duration").value;

    const response = await fetch(`${API_BASE}/loan`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            customerId: customerId,
            amount: parseFloat(amount),
            durationMonths: parseInt(duration)
        })
    });

    const data = await response.json();

    document.getElementById("loan-result").innerText =
        `Loan ID: ${data.loanId} | Status: ${data.status}`;
}

async function getDecision() {
    const loanId = document.getElementById("loan-id-input").value;

    const response = await fetch(`${API_BASE}/decision/${loanId}`);
    const data = await response.json();

    document.getElementById("decision-result").innerText =
        `Score: ${data.creditScore} | Decision: ${data.decision}`;
}