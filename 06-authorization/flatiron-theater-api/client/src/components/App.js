import { Route, Switch } from "react-router-dom";

import {useEffect, useState} from 'react'
import ProductionContainer from './ProductionContainer'
import ProductionForm from './ProductionForm'
import Navigation from './Navigation'
import ProductionDetail from './ProductionDetail'
import Auth from './Auth'
import Login from './LogIn'

function App() {
  const [productions, setProductions] = useState([])
  const [errors, setErrors] = useState(false)
  const [cart, setCart] = useState([])

  useEffect(() => {
    fetch('/productions')
    .then(res => res.json())
    .then(setProductions)
  },[])

  function handlePost(obj){
      fetch('/productions',{
        method:'POST',
        headers: {'Content-Type': 'application/json'},
        body:JSON.stringify(obj)
      })
      .then(res => res.json())
      .then(data => {
        console.log(data)
        if(data.errors){
          setErrors(data.errors)
        } else {
          setProductions([...productions,data])
        }
      })
  }

  return (
    <>
    <Navigation cart={cart}/>
    <Switch>
    <Route exact path="/">
      <ProductionContainer productions={productions}/>
    </Route>
    <Route exact path="/productions/new">
      <ProductionForm handlePost={handlePost} errors={errors} />
    </Route>
    <Route exact path="/productions/:id">
        <ProductionDetail cart={cart} setCart={setCart}/>
    </Route>
    <Route path="/sign_up">
          <Auth />
    </Route>
    <Route path="/login">
          <Login />
    </Route>
    </Switch>
    </>
  );
}

export default App;
