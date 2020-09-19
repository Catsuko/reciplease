import React from 'react'

export default function Details (props) {
  const { description, chef, tags } = props
  return (
    <div className='h-100 ph3-l flex flex-column gray'>
      <div className='colourful-children mb1'>
        {tags.map((tag) => <span key={tag}>[{tag.toUpperCase()}]</span>)}
      </div>
      <p className='mv0 flex-auto' dangerouslySetInnerHTML={{ __html: description}} />
      {chef && 
        <p className='mt2 mb0 self-end'>
          Cooked by <span className='light-yellow'>{chef}</span>
        </p>
      }
    </div>
  )
}
