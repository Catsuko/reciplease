import React from 'react'

export default function Details (props) {
  const { description } = props
  return (
    <div className='flex-auto ph3'>
      <p className='gray mv0'>
        {description}
      </p>
    </div>
  )
}
