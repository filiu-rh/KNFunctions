# Multi-stage build for Knative Function
FROM python:3.11-slim as builder

WORKDIR /workspace

COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Runtime stage
FROM python:3.11-slim

WORKDIR /workspace

# Copy Python dependencies from builder
COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

COPY . .

# Install the Knative Functions runtime
RUN pip install --no-cache-dir knative-functions

# Expose port for the function
EXPOSE 8080

# Run the function
CMD ["functions-framework", "--target=handle", "--debug"]
