import React from 'react';

class TodoListItem extends React.Component {
    constructor(props){
      super(props);
    }

    render(){
      <li>{props.todo.title}</li>
    }
}
