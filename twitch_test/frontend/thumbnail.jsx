import React from 'react';



class Thumbnail extends React.Component{
	constructor(props){
		super(props);
		this.clickHandler = this.clickHandler.bind(this);

	}
	
	clickHandler(){
		this.props.makeCall(this.props.name);
	}


	render(){

		const {image} = this.props;
		const {name} = this.props;

		return(
			<div onClick={this.clickHandler}  className="thumbnail">
				<img src={image} />
				<h1>{name}</h1>
			</div>
			)

	}
}


export default Thumbnail;