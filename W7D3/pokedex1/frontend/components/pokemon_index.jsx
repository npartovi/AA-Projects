import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){

    const { pokemon } = this.props;

    return(
      <ul className='pokemonList'>
        {pokemon.map(poke =>
          <li className="pokemon-index-item" key={poke.id}>
            <a href="">
              <span>{poke.id}</span>
              <img src={poke.imageUrl} />
              <span>{poke.name}</span>
            </a>
          </li>)}
      </ul>
  );

  }
}


export default PokemonIndex;
