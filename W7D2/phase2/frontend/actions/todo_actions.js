export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';


export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

export const returnSomething = (variable) => ({
  variable: variable
});

$ajax
dispatch(fetchTodos.then(todos => dispatch(receiveTodos(todos))))

window.receiveTodo = receiveTodo;
window.returnSomething = returnSomething;

receiveTodo({title: 'wash cat', body: 'now'})
receiveTodo(todo)
//
//
//
//
//
//
//
// is different from
(todo) => dispatch(receiveTodo(todo))
//
// what does it return?
//
// - state with new item?
// - function?
// - store?
//
