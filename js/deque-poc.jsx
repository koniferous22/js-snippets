import React, { useEffect, useState } from "react";
import "./styles.css";

const promise1 = () =>
  new Promise((resolve, reject) => setTimeout(() => resolve("value1"), 300));
const promise2 = () =>
  new Promise((resolve, reject) => setTimeout(() => resolve("value2"), 100));

let counter = 0;
let isCounterUsed = false;

function waitUntilNotUsed(cb) {
  if (isCounterUsed) {
    setTimeout(() => waitUntilNotUsed(cb), 10);
  } else {
    cb();
  }
}

function getId() {
  return new Promise((resolve, reject) => {
    waitUntilNotUsed(() => {
      isCounterUsed = true;
      const generatedId = counter;
      counter++;
      isCounterUsed = false;
      resolve(generatedId);
    });
  });
}
let deque = null;

function updateDequeAtIndex(index) {
  deque[index].isDone = true;
  const firstPendingPromise = deque.findIndex(({ isDone }) => isDone === false);
  deque = deque.slice(firstPendingPromise);
}

function usePromiseDeque() {
  useEffect(() => {
    if (deque !== null) {
      throw new Error("this shit can be initialized only once");
    }
    deque = [];
  }, []);
  return {
    addToQueue: (promise) =>
      new Promise((resolve, reject) =>
        getId().then((promiseId) => {
          deque.push({
            id: promiseId,
            isDone: false,
            promise: promise.then((value) => {
              console.log(
                `id: ${promiseId}, deque: ${JSON.stringify(deque, null, 2)}`
              );
              const promiseIndex = deque.findIndex(
                ({ id }) => id === promiseId
              );
              console.log(`id: ${promiseId}, promiseIndex: ${promiseIndex}`);
              const isLatest = promiseIndex === deque.length - 1;
              console.log(`id: ${promiseId}, isLatest: ${isLatest}`);
              if (promiseIndex < 0) {
                reject("lol the promise disappeared");
              }
              updateDequeAtIndex(promiseIndex);
              console.log(
                `id: ${promiseId}, updatedDeque: ${JSON.stringify(
                  deque,
                  null,
                  2
                )}`
              );
              resolve({
                isLatest,
                value
              });
            })
          });
        })
      )
  };
}

export default function App() {
  const { addToQueue } = usePromiseDeque();
  return (
    <div className="App">
      <h1>Hello CodeSandbox</h1>
      <h2>Start editing to see some magic happen!</h2>
      <button
        onClick={() => {
          console.log('-------');
          addToQueue(promise1()).then(({ value, isLatest }) => {
            console.log(`value: ${value}, isLatest: ${isLatest}`);
          });
          setTimeout(() => {
            addToQueue(promise2()).then(({ value, isLatest }) => {
              console.log(`value: ${value}, isLatest: ${isLatest}`);
            });
          }, 100);
        }}
      >
        Fire the promises
      </button>
    </div>
  );
}
