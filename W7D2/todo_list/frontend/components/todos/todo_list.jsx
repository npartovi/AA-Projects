import { connect } from 'react-redux';
import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form'


class TodoList extends React.Component {
  constructor(props){
    super(props);
  }



  render(){

    const { todos, receiveTodo} = this.props;
    let result = todos.map((todo) =>
      <TodoListItem title={todo.title} body={todo.body} key={todo.id}/>
     );
    return(
      <div>
        <h1> This is the todo list</h1>
          {result}
          <TodoForm receiveTodo={receiveTodo} />
      </div>

  );

  }
}

export default TodoList;
