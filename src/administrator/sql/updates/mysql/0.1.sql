-- member
--
-- Table representing a user that has at least started becoming an SWA member
-- The user may not actually be a member yet as they may not have paid (see paid col)
CREATE TABLE IF NOT EXISTS `#__swa_member` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(11)  NOT NULL ,
  `lifetime_member` TINYINT(1)  NOT NULL DEFAULT 0,
  `gender` VARCHAR(255)  NOT NULL DEFAULT 'None',
  `pronouns` VARCHAR(30)  NOT NULL ,
  `ethnicity` VARCHAR(70) NOT NULL DEFAULT 'Default',
  `dob` DATE NOT NULL DEFAULT '0000-00-00',
  `university_id` INT(11)  NOT NULL ,
  `level` VARCHAR(20)  NOT NULL DEFAULT 'Beginner',
  `race` VARCHAR(255)  NOT NULL DEFAULT 'None',
  `econtact` VARCHAR(255)  NOT NULL ,
  `enumber` VARCHAR(255)  NOT NULL ,
  `dietary` VARCHAR(30) NOT NULL DEFAULT 'None',
  `medical` TEXT DEFAULT NULL,
  `tel` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  INDEX `fk_member_user_idx` (`user_id` ASC),
  INDEX `fk_member_university_idx` (`university_id` ASC)
)
DEFAULT COLLATE=utf8_general_ci;

-- membership
--
-- Table holding members that have paid their SWA membership for a season
CREATE TABLE IF NOT EXISTS `#__swa_membership` (
  `member_id` INT NOT NULL ,
  `season_id` INT NOT NULL ,
  PRIMARY KEY (`member_id`, `season_id`),
  INDEX `fk_membership_member_idx` (`member_id` ASC),
  INDEX `fk_membership_season_idx` (`season_id` ASC)
)
DEFAULT COLLATE=utf8_general_ci;

-- committee
--
-- Table holding members that are on the SWA / org committee
CREATE  TABLE IF NOT EXISTS `#__swa_committee` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `member_id` INT(11)  NOT NULL ,
  `position` VARCHAR(50)  NOT NULL ,
  `blurb` VARCHAR(2000)  NOT NULL ,
  `image` VARCHAR(100)  NOT NULL ,
  `ordering` INT(11) NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`),
  INDEX `fk_committee_member_idx` (`member_id` ASC)
)
DEFAULT COLLATE=utf8_general_ci;

-- qualification
--
-- Table holding qualifications that members hold
CREATE  TABLE IF NOT EXISTS `#__swa_qualification` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `member_id` INT(11)  NOT NULL ,
  `type` VARCHAR(50)  NOT NULL ,
  `expiry_date` DATE NOT NULL ,
  `file` MEDIUMBLOB NOT NULL ,
  `file_type` VARCHAR(50) NOT NULL ,
  `approved` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`id`),
  INDEX `fk_qualification_member_idx` (`member_id` ASC)
)
DEFAULT COLLATE=utf8_general_ci;

-- university
--
-- Table holding universities that members can be a part of
CREATE  TABLE IF NOT EXISTS `#__swa_university` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(200) NOT NULL ,
  `url` VARCHAR(200) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
DEFAULT COLLATE=utf8_general_ci;

-- university member
--
-- Table holding confirmed univiersity members
-- Note the committee files for makring members are university committee members
CREATE  TABLE IF NOT EXISTS `#__swa_university_member` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `member_id` INT(11)  NOT NULL ,
  `university_id` INT(11)  NOT NULL ,
  `committee` VARCHAR(15) NOT NULL DEFAULT 0,
  `graduated` TINYINT(1)  NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_university_member_member_idx` (`member_id` ASC),
  INDEX `fk_university_member_university_idx` (`member_id` ASC),
  CONSTRAINT unique_member_id_university_id UNIQUE(member_id, university_id)
)
DEFAULT COLLATE=utf8_general_ci;

-- season
--
-- Table holding seasons
CREATE  TABLE IF NOT EXISTS `#__swa_season` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `year` VARCHAR(4) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `year_UNIQUE` (`year` ASC)
)
DEFAULT COLLATE=utf8_general_ci;

-- event
--
-- Table holding event information
CREATE  TABLE IF NOT EXISTS `#__swa_event` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `season_id` INT NOT NULL ,
  `capacity` INT NOT NULL ,
  `date_open` DATE NOT NULL ,
  `date_close` DATE NOT NULL ,
  `date` DATE NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_event_season1_idx` (`season_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- event host
--
-- Table holding event hosts
-- Note: An event can exist with no hosts
CREATE  TABLE IF NOT EXISTS `#__swa_event_host` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `event_id` INT NOT NULL ,
  `university_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_event_host_event1_idx` (`event_id` ASC) ,
  INDEX `fk_event_host_university1_idx` (`university_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- event ticket
--
-- Table holding event ticket information.
-- These are types of ticket that can be purchased for an event rather than individual tickets.
-- The need_* fields are ugly and we may want to think og a nicer solution here
CREATE  TABLE IF NOT EXISTS `#__swa_event_ticket` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `event_id` INT NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `quantity` INT NOT NULL ,
  `price` DECIMAL(6,2) NOT NULL ,
  `notes` TEXT DEFAULT NULL ,
  `need_level` VARCHAR(20) DEFAULT NULL ,
  `need_swa` TINYINT(1)  NOT NULL DEFAULT 0 ,
  `need_xswa` TINYINT(1)  NOT NULL DEFAULT 0 ,
  `need_host` TINYINT(1)  NOT NULL DEFAULT 0 ,
  `need_qualification` TINYINT(1)  NOT NULL DEFAULT 0 ,
  `details` TEXT,
  PRIMARY KEY (`id`) ,
  INDEX `fk_event_ticket_event1_idx` (`event_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- ticket
--
-- Table holding event ticket information.
-- Each record here represents an individual ticket
CREATE  TABLE IF NOT EXISTS `#__swa_ticket` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `member_id` INT NOT NULL ,
  `event_ticket_id` INT NOT NULL ,
  `paid` DECIMAL(6,2) NOT NULL ,
  `details` TEXT,
  PRIMARY KEY (`id`) ,
  INDEX `fk_ticket_event_ticket1_idx` (`event_ticket_id` ASC) ,
  INDEX `fk_ticket_member1_idx` (`member_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- event registration
--
-- Table holding event registration information
-- This table exists to maintain the concept of event registration from the old site
-- University members should be registered for an event in order to buy a ticket...
CREATE  TABLE IF NOT EXISTS `#__swa_event_registration` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `event_id` INT NOT NULL ,
  `member_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_event_registration_event1_idx` (`event_id` ASC) ,
  INDEX `fk_event_registration_member1_idx` (`member_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- competition type
--
-- Table holding types of competitions that can be held at events
CREATE  TABLE IF NOT EXISTS `#__swa_competition_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `series` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id`) )
DEFAULT COLLATE=utf8_general_ci;

-- competition
--
-- Table holding competitions that have been / are going to be held at events
CREATE  TABLE IF NOT EXISTS `#__swa_competition` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `event_id` INT NOT NULL ,
  `competition_type_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_competition_event1_idx` (`event_id` ASC) ,
  INDEX `fk_competition_competition_type1_idx` (`competition_type_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- indi result
--
-- Individual member results in competitions
CREATE  TABLE IF NOT EXISTS `#__swa_indi_result` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `member_id` INT NOT NULL ,
  `competition_id` INT NOT NULL ,
  `result` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_indi_result_competition1_idx` (`competition_id` ASC) ,
  INDEX `fk_indi_result_member1_idx` (`member_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- team result
--
-- University team results in competitions
CREATE  TABLE IF NOT EXISTS `#__swa_team_result` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `competition_id` INT NOT NULL ,
  `university_id` INT NOT NULL ,
  `team_number` INT NOT NULL DEFAULT 1 ,
  `result` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_team_result_competition1_idx` (`competition_id` ASC) ,
  INDEX `fk_team_result_university1_idx` (`university_id` ASC) )
DEFAULT COLLATE=utf8_general_ci;

-- viewlevels
--
-- Add 2 view level if they do not already exist
-- These are used to control the availability of menus for Org / Club committee members
INSERT INTO `#__viewlevels` (title, ordering, rules)
SELECT 'Club Committee', 0, '[]'
FROM dual
 WHERE NOT EXISTS (SELECT 1
                     FROM `#__viewlevels`
                    WHERE title = 'Club Committee');

INSERT INTO `#__viewlevels` (title, ordering, rules)
SELECT 'Org Committee', 0, '[]'
FROM dual
 WHERE NOT EXISTS (SELECT 1
                     FROM `#__viewlevels`
                    WHERE title = 'Org Committee');
