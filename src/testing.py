from typing import Union
from fastapi import FastAPI, Request
from fastapi.middleware.trustedhost import TrustedHostMiddleware
import time
import uvicorn

app = FastAPI()

app.add_middleware(TrustedHostMiddleware, allowed_hosts=['127.0.0.1'])

@app.get("/")
async def read_root():
    return {"Hello": "World"}

@app.get("/test")
async def testing():
    return {"test":"123"}

@app.middleware("http")
async def add_process_time_header(request: Request, call_next):
    start_time = time.time()
    print(request.client.host)  
    response = await call_next(request)
    process_time = time.time() - start_time
    response.headers["X-Process-Time"] = str(process_time)
    return response

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)