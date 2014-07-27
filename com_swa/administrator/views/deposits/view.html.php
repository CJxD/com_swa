<?php

// No direct access
defined( '_JEXEC' ) or die;

jimport( 'joomla.application.component.view' );

/**
 * View class for a list of Swa.
 */
class SwaViewDeposits extends JViewLegacy {

	protected $items;
	protected $pagination;
	protected $state;

	protected $universities;

	/**
	 * Display the view
	 */
	public function display( $tpl = null ) {
		$this->state = $this->get( 'State' );
		$this->items = $this->get( 'Items' );
		$this->pagination = $this->get( 'Pagination' );

		$this->universities = $this->getUniversities();

		// Check for errors.
		if ( count( $errors = $this->get( 'Errors' ) ) ) {
			throw new Exception( implode( "\n", $errors ) );
		}

		SwaHelper::addSubmenu( 'deposits' );

		$this->addToolbar();

		$this->sidebar = JHtmlSidebar::render();
		parent::display( $tpl );
	}

	/**
	 * @todo code reuse
	 */
	private function getUniversities() {
		$db = JFactory::getDBO();
		$query = $db->getQuery( true );
		$query->select( 'id,name' );
		$query->from( '#__swa_university' );
		$db->setQuery( (string)$query );
		$unis = $db->loadObjectList( 'id' );
		return $unis;
	}

	/**
	 * Add the page title and toolbar.
	 *
	 * @since    1.6
	 */
	protected function addToolbar() {
		require_once JPATH_COMPONENT . '/helpers/swa.php';

		$state = $this->get( 'State' );
		$canDo = SwaHelper::getActions( $state->get( 'filter.category_id' ) );

		JToolBarHelper::title( JText::_( 'COM_SWA_TITLE_DEPOSITS' ), 'deposits.png' );

		//Check if the form exists before showing the add/edit buttons
		$formPath = JPATH_COMPONENT_ADMINISTRATOR . '/views/deposit';
		if ( file_exists( $formPath ) ) {

			if ( $canDo->get( 'core.create' ) ) {
				JToolBarHelper::addNew( 'deposit.add', 'JTOOLBAR_NEW' );
			}

			if ( $canDo->get( 'core.edit' ) && isset( $this->items[0] ) ) {
				JToolBarHelper::editList( 'deposit.edit', 'JTOOLBAR_EDIT' );
			}
		}

		if ( $canDo->get( 'core.edit.state' ) ) {

			if ( isset( $this->items[0]->state ) ) {
				JToolBarHelper::divider();
				JToolBarHelper::custom( 'deposits.publish', 'publish.png', 'publish_f2.png', 'JTOOLBAR_PUBLISH', true );
				JToolBarHelper::custom( 'deposits.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true );
			} else if ( isset( $this->items[0] ) ) {
				//If this component does not use state then show a direct delete button as we can not trash
				JToolBarHelper::deleteList( '', 'deposits.delete', 'JTOOLBAR_DELETE' );
			}

			if ( isset( $this->items[0]->state ) ) {
				JToolBarHelper::divider();
				JToolBarHelper::archiveList( 'deposits.archive', 'JTOOLBAR_ARCHIVE' );
			}
			if ( isset( $this->items[0]->checked_out ) ) {
				JToolBarHelper::custom( 'deposits.checkin', 'checkin.png', 'checkin_f2.png', 'JTOOLBAR_CHECKIN', true );
			}
		}

		//Show trash and delete for components that uses the state field
		if ( isset( $this->items[0]->state ) ) {
			if ( $state->get( 'filter.state' ) == -2 && $canDo->get( 'core.delete' ) ) {
				JToolBarHelper::deleteList( '', 'deposits.delete', 'JTOOLBAR_EMPTY_TRASH' );
				JToolBarHelper::divider();
			} else if ( $canDo->get( 'core.edit.state' ) ) {
				JToolBarHelper::trash( 'deposits.trash', 'JTOOLBAR_TRASH' );
				JToolBarHelper::divider();
			}
		}

		if ( $canDo->get( 'core.admin' ) ) {
			JToolBarHelper::preferences( 'com_swa' );
		}

		//Set sidebar action - New in 3.0
		JHtmlSidebar::setAction( 'index.php?option=com_swa&view=deposits' );

		$this->extra_sidebar = '';

		JHtmlSidebar::addFilter(

			JText::_( 'JOPTION_SELECT_PUBLISHED' ),

			'filter_published',

			JHtml::_( 'select.options', JHtml::_( 'jgrid.publishedOptions' ), "value", "text", $this->state->get( 'filter.state' ), true )

		);

	}

	protected function getSortFields() {
		return array(
			'a.id' => JText::_( 'JGRID_HEADING_ID' ),
			'a.ordering' => JText::_( 'JGRID_HEADING_ORDERING' ),
			'a.state' => JText::_( 'JSTATUS' ),
			'a.checked_out' => JText::_( 'COM_SWA_DEPOSITS_CHECKED_OUT' ),
			'a.checked_out_time' => JText::_( 'COM_SWA_DEPOSITS_CHECKED_OUT_TIME' ),
			'a.time' => JText::_( 'COM_SWA_DEPOSITS_TIME' ),
			'a.amount' => JText::_( 'COM_SWA_DEPOSITS_AMOUNT' ),
		);
	}

}