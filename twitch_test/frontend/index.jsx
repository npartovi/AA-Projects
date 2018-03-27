import React from 'react';
import ReactDom from 'react-dom';
import DisplayClips from './display_clips';
import VideoIndex from './VideoIndex';
import MainNav from './mainNav';



class Root extends React.Component {

	constructor(props){
		super(props)

		this.makeCall = this.makeCall.bind(this);
		this.state = {
			data: null
		}
		this.renderContent = this.renderContent.bind(this);
	}

	makeCall(name){

		console.log(name)
		const httpRequest = new XMLHttpRequest();

		httpRequest.addEventListener('load', (res) => {
			this.setState({
				data: (JSON.parse(res.target.response).clips)
			})
		});
		httpRequest.open('GET', `https://api.twitch.tv/kraken/clips/top?limit=10&game=${name}&trending=true&autoplay=false`);
		httpRequest.setRequestHeader('Client-ID', 'k4dojj9d9vu0h1na9yhyonozdtyjvg');
		httpRequest.setRequestHeader('Accept', 'application/vnd.twitchtv.v5+json');
		httpRequest.send();
		
	}

	renderContent() {
		const { data } = this.state;

		if (data) {
			return <DisplayClips data={data} />
		} else {
			return <VideoIndex makeCall={this.makeCall}/>
		}
	}

	render(){
		return(
				<div> 
					<MainNav />
					{this.renderContent()}
				</div>
			)
	}
}

document.addEventListener("DOMContentLoaded", ()=>{
	ReactDom.render(<Root />, document.getElementById('root'))
})