from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from uuid import uuid4

from models import LoanRequest, LoanResponse, ScoreResponse, DecisionResponse
from data_store import loans
from score_service import get_credit_score
from decision_engine import calculate_decision

app = FastAPI(title="Mini Credit Decision Platform")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://127.0.0.1:5500"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/loan", response_model=LoanResponse)
def submit_loan(request: LoanRequest):
    loan_id = str(uuid4())

    loans[loan_id] = {
        "customerId": request.customerId,
        "amount": request.amount,
        "durationMonths": request.durationMonths,
        "status": "PROCESSING"
    }

    return LoanResponse(
        loanId=loan_id,
        status="PROCESSING"
    )


@app.get("/score/{customer_id}", response_model=ScoreResponse)
def get_score(customer_id: str):
    score = get_credit_score(customer_id)

    return ScoreResponse(
        customerId=customer_id,
        creditScore=score
    )


@app.get("/decision/{loan_id}", response_model=DecisionResponse)
def get_decision(loan_id: str):
    if loan_id not in loans:
        raise HTTPException(status_code=404, detail="Loan not found")

    loan = loans[loan_id]
    score = get_credit_score(loan["customerId"])
    decision = calculate_decision(score)

    loan["status"] = decision

    return DecisionResponse(
        loanId=loan_id,
        creditScore=score,
        decision=decision
    )
