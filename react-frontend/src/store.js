// import thunk from 'redux-thunk'
// import { composeWithDevTools } from 'redux-devtools-extension'
import { createStore, applyMiddleware } from 'redux'
import rootReducer from './reducers/root-reducer'

// composeWithDevTools(
//   applyMiddleware(thunk)

export const store = createStore(rootReducer)
