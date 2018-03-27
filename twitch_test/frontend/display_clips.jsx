import React from 'react';



class DisplayClips extends React.Component {

	constructor(props){
		super(props);

	}

	render(){
		const { data } = this.props

		let results = data.map( clips => {
			return (<iframe src={clips.embed_url} width='576' height='324' frameborder='0' scrolling='no' allowfullscreen='true' ></iframe>)
		})

		return(
			<div>
				{results}
			</div>
			)
	}
}


export default DisplayClips;


