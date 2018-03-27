import React from 'react';


class MainNav extends React.Component {
	constructor(props){
		super(props);
	}

	render(){
		return(
				<nav className="main_nav">
					<a className="logo" href="">
					<svg width="94px" height="32px" version="1.1" viewBox="0 0 94 32" x="0px" y="0px"><path clip-rule="evenodd" d="M88,5h-6V0h-9l-6,5h-5.5L59,7.5V5h-5V0H36v5H16l-5-5H0v22l5,5.25L14,32h6v-1.5l3,1.5h12l2-3l1,3h7v-3l3,3h8l0.5-3l2.5,3h10l3-3v3h4l3-3v3h7l7-6V10L88,5z M13,13H8v6h5v6H6l-4-4V2h6v5h5V13z M36,21.5L32.5,25H15V7h6v12h2V7h6v12h2V7h5V21.5z M44,25h-6V7h6V25z M44,5h-6V2h6V5z M57,13h-5v6h5v6h-7l-4-4V2h6v5h5V13z M72,13h-7v6h7v6h-9l-4-4V11l4-4h9V13z M91,25h-6V13h-5v12h-6V2h6v5h7l4,4V25z" fill-rule="evenodd"></path></svg>
					</a>
					<div className="nav-links">
						<a href="">Following</a>
						<a href="">Browse</a>
						<a href="">Get Desktop</a>
						<a href="">Try Prime</a>
					</div>
					<div className="nav-search">
						<i id="search-icon" class="fas fa-search"></i>
						<input className="search-bar" type="search" />
					</div>
					<div></div>
					<div></div>
				</nav>
			)
	}
}

export default MainNav;