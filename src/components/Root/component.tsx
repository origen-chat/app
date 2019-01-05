import React, { StrictMode } from 'react';
import { hot } from 'react-hot-loader/root';

import apolloClient from '../../apolloClient';
import { createReduxStore } from '../../store';
import App from '../App';

const reduxStore = createReduxStore();

export const Root: React.FunctionComponent = () => (
  <StrictMode>
    <App apolloClient={apolloClient} reduxStore={reduxStore} />
  </StrictMode>
);

export default hot(Root);
