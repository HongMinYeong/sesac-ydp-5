import { useRef } from 'react';

export default function RefSample1() {
  // 1.ref 객체 만들기
  const inputRef = useRef();

  const handleFocus = () => {
    // 3. useRef()를 이용해서 만든 객체의 current 값에 focus() DOM API 사용
    console.log(inputRef.current); //<input type="text">

    // *focus() : 지정된 html 요소에 포커싱
    inputRef.current.focus();
  };
  return (
    <>
      <p>(함수형 컴포넌트) 버튼 클릭시 input에 focus 처리</p>
      {/* 2. 직접 접근하고 싶은 DOM 요소에 ref props 설정 */}
      <input type="text" ref={inputRef} />
      <button onClick={handleFocus}>버튼</button>
    </>
  );
}
