import React from 'react'

export default function Details (props) {
  const { description, chef, tags } = props
  return (
    <div className='h-100 ph3 flex flex-column gray'>
      <p className='mv0 flex-auto'>
        {description}
      </p>
      <p className='mt2 mb0 self-end'>
        Cooked by <span className='light-yellow'>{chef}</span>
      </p>
    </div>
  )
}
