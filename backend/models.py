from pydantic import BaseModel
from typing import Optional


class LoanRequest(BaseModel):
    customerId: str
    amount: float
    durationMonths: int


class LoanResponse(BaseModel):
    loanId: str
    status: str


class ScoreResponse(BaseModel):
    customerId: str
    creditScore: int


class DecisionResponse(BaseModel):
    loanId: str
    creditScore: int
    decision: str