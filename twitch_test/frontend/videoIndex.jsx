import React from 'react';
import Thumbnail from './thumbnail';
import GamesList from './gamesList';

class VideoIndex extends React.Component {
	constructor(props){
		super(props);

		this.makeCall = this.makeCall.bind(this)
	}

	makeCall(name){
		this.props.makeCall(name);
	}


	render(){
		return(
			<div className="thumbnail-list">
				{GamesList.map( game => {
					return (
							<Thumbnail image={game.clip_url} name={game.display} makeCall={this.makeCall} key={game}/>
						)
				})}
			</div>
			)
	}
}

export default VideoIndex;