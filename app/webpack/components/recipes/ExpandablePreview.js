import React, { Component } from 'react'
import Preview from './Preview'
import Details from './Details'

export default class ExpandablePreview extends Component {
  state = {
    isOpen: false
  }

  toggleDetails = () => this.setState((state) => ({ isOpen: !state.isOpen }))

  render() {
    const { isOpen } = this.state
    return (
      <div className='flex pa3 w-100 items-start'>
        <Preview {...this.props} onClick={this.toggleDetails} />
        <div className={`expandable flex-auto h5 ${isOpen ? 'open' : 'closed'}`} aria-hidden={!isOpen}>
          <Details {...this.props} />
        </div>
      </div>
    )
  }
}