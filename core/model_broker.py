# Simplified Broker for v6.0 Docker Boot
def get_best_model(role, provider="google"):
    # In a full run, this queries the API. 
    # For now, we return safe defaults.
    if provider == "google": return "gemini-2.0-flash-exp"
    if provider == "anthropic": return "claude-3-5-sonnet-20240620"
    return "gpt-4o" 
