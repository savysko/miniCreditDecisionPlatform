def get_credit_score(customer_id: str) -> int:
    """
    Deterministic scoring logic for testing purposes.
    Converts customer_id to numeric hash.
    """
    base = sum(ord(char) for char in customer_id)
    score = base % 100
    return score
