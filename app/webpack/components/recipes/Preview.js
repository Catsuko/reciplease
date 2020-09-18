import React from 'react'

export default function Preview(props) {
  const { title, photoUrl, onClick } = props
  return (
    <div className={`recipe-card-focus pointer ba bw2 b--dashed gray flex-none dib mb3 mb0-l`}>
      <button type='button' className='bg-transparent input-reset mw5 db pt3 bn outline-0' onClick={onClick}>
        <p className='p light-yellow h3 mt0 ph3 tc pointer'>
          {title}
        </p>
        <img alt='' className='db w-100 pointer' src={photoUrl} />
      </button>
    </div>
  )
}
