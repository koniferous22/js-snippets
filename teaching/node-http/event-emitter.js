const listeners = [
  {
    method: 'GET',
    endpoint: '/endpoint1',
    handler: () => {
      console.log('Request from endpoint1')
    }
  }
]

function serveRequest(request) {
  listeners.forEach(({ method, endpoint, handler }) => {
    if (request.method === method && request.endpoint === endpoint) {
      handler();
    }
  })
}

const EventEmitter = require('events');
const util = require('util');

function MyEmitter() {
  EventEmitter.call(this);
  this.emit('event');
}
util.inherits(MyEmitter, EventEmitter);

const myEmitter = new MyEmitter();
myEmitter.on('event', serveRequest);

myEmitter.emit('event', {
  method: 'GET',
  endpoint: '/endpoint1'
});
