import { render, screen } from '@testing-library/react';
import Test from './Test';

describe('Test', () => {
  it('should render without crashing', () => {
    render(<Test name={''} />);
  });
});