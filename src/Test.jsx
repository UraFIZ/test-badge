import { useState } from "react";

const Test = ({ name }) => {
  const [isVisible, setIsVisible] = useState(false);

  const handleClick = () => {
    setIsVisible(!isVisible);
  }

  return (
    <div onClick={handleClick}>
      {isVisible && <h2>Hi, {name}!</h2>}
       {!isVisible && <h2>Click me!</h2>}
      <h1>Hello, {name}!</h1>
    </div>
  );
};

export default Test;