def calculate_decision(score: int) -> str:
    if score > 80:
        return "APPROVED"
    elif 50 <= score <= 80:
        return "MANUAL_REVIEW"
    else:
        return "REJECTED"
