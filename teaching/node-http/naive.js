const listeners = [
  {
    method: 'GET',
    endpoint: '/endpoint1',
    handler: () => {
      console.log('Request from endpoint1')
    }
  }
]

let currentRequest;

function serveRequest(request) {
  listeners.forEach(({ method, endpoint, handler }) => {
    if (request.method === method && request.endpoint === endpoint) {
      handler();
    }
  })
}

function cleanup() {
  currentRequest = null;
}

function runServer() {
  console.log('Server is running');
  while(1) {
    if (currentRequest) {
      serveRequest(currentRequest);
      cleanup();
    }
    // console.log(`currentRequest: ${currentRequest}`);

  }
}


(function() {
  setTimeout(() => {
    console.log('TIMEOUT biaach');

    currentRequest = {
      method: 'GET',
      endpoint: 'endpoint1'
    }
  }, 3000); 
  runServer();
})()
