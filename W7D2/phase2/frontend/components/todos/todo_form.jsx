import React from 'react';


class TodoForm extends React.Component {
  constructor(props){
    super(props);

  this.submitHandler = this.submitHandler.bind(this);
  this.handleChange = this.handleChange.bind(this);

  this.state = {
    title: "",
    body: ""
  };
  }

  handleChange(property){
    return e => this.setState({ [property]: e.target.value });


  }

  submitHandler(event) {
    event.preventDefault();
    const { receiveTodo } = this.props;
    const todo = Object.assign({}, this.state);
    receiveTodo(todo);
  }


  render(){

    return(
      <form onSubmit={this.submitHandler}>
        <label>Title
          <input type="text" onChange={this.handleChange('title')} value={this.state.title}/>
        </label>

        <label>Body
          <input type="text" onChange={this.handleChange('body')} value={this.state.body}/>
        </label>

        <button>Add Todo</button>

      </form>
    )
  }
}


export default TodoForm;
