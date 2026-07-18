from cloudevents.http import CloudEvent
from typing import Any

def handle(cloud_event: CloudEvent) -> Any:
    """
    Handle a CloudEvent for Knative Functions.
    
    Args:
        cloud_event: CloudEvent object
        
    Returns:
        Dictionary with greeting message
    """
    # Get data from the CloudEvent
    data = cloud_event.get_data()
    name = "World"
    
    if isinstance(data, dict) and "name" in data:
        name = data["name"]
    elif isinstance(data, str):
        name = data
    
    return {"message": f"Hello {name} from Knative Functions!"}
