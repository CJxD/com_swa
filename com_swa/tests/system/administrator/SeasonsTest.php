<?php

class SeasonsTest extends SwaTestCase {

	public function testAddMultipleSeasons() {
		$this->setUp();
		$this->gotoAdmin();
		$this->doAdminLogin();
		$this->clearAdminSeasons();

		$seasons = array( 2015, 2016, 2017 );

		foreach( $seasons as $season ) {
			$this->addAdminSeason( $season );
		}
		$this->open( '/j/administrator/index.php?option=com_swa&view=seasons' );
		foreach( $seasons as $season ) {
			$this->assertElementPresent( 'link=' . $season );
		}

	}

}