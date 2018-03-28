import React from 'react';

class TodoListItem extends React.Component {
    constructor(props){
      super(props);
    }

    render(){
      const {title, body} = this.props;
      return(
        <li>{title} : {body}</li>
      )
    }
}


export default TodoListItem;
