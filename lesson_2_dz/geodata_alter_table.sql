ALTER TABLE `_countries`

  CHANGE COLUMN `country_id` `id` INT NOT NULL AUTO_INCREMENT,
  CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL,

  ADD PRIMARY KEY (`id`),
  ADD INDEX `title`(`title`),

  MODIFY COLUMN `title_ua` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_be` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_en` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_es` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_pt` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_de` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_fr` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_it` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_pl` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_ja` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_lt` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_lv` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_cz` VARCHAR(150) NOT NULL;

/*  
ALTER TABLE `_countries`
  DROP COLUMN `title_ua`,
  DROP COLUMN `title_be`,
  DROP COLUMN `title_en`,
  DROP COLUMN `title_es`,
  DROP COLUMN `title_pt`,
  DROP COLUMN `title_de`,
  DROP COLUMN `title_fr`,
  DROP COLUMN `title_it`,
  DROP COLUMN `title_pl`,
  DROP COLUMN `title_ja`,
  DROP COLUMN `title_lt`,
  DROP COLUMN `title_lv`,
  DROP COLUMN `title_cz`;
*/


ALTER TABLE `_regions`
  CHANGE COLUMN `region_id` `id` INT NOT NULL AUTO_INCREMENT,
  MODIFY COLUMN `country_id` INT NOT NULL,
  CHANGE COLUMN `title_ru` `title` VARCHAR(150) NOT NULL,

  ADD PRIMARY KEY (`id`),
  ADD FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`),
  ADD INDEX `title`(`title`),

  MODIFY COLUMN `title_ua` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_be` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_en` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_es` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_pt` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_de` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_fr` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_it` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_pl` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_ja` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_lt` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_lv` VARCHAR(150) NOT NULL,
  MODIFY COLUMN `title_cz` VARCHAR(150) NOT NULL;

/*
ALTER TABLE `_regions`
  DROP COLUMN `title_ua`,
  DROP COLUMN `title_be`,
  DROP COLUMN `title_en`,
  DROP COLUMN `title_es`,
  DROP COLUMN `title_pt`,
  DROP COLUMN `title_de`,
  DROP COLUMN `title_fr`,
  DROP COLUMN `title_it`,
  DROP COLUMN `title_pl`,
  DROP COLUMN `title_ja`,
  DROP COLUMN `title_lt`,
  DROP COLUMN `title_lv`,
  DROP COLUMN `title_cz`;
*/




ALTER TABLE `_cities`
  CHANGE COLUMN `city_id` `id` INT NULL AUTO_INCREMENT,
  MODIFY COLUMN `country_id` INT NULL,
  MODIFY COLUMN `important` TINYINT(1) NULL,
  MODIFY COLUMN `region_id` INT NULL,
  CHANGE COLUMN `title_ru` `title` VARCHAR(150) NULL,

  ADD PRIMARY KEY (`id`),
  ADD FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`),
  ADD FOREIGN KEY (`region_id`) REFERENCES `_regions` (`id`),
  ADD INDEX `title`(`title`);

/*
ALTER TABLE `_cities`
  DROP COLUMN `area_ru`,
  DROP COLUMN `region_ru`,
  DROP COLUMN `title_ua`,
  DROP COLUMN `area_ua`,
  DROP COLUMN `region_ua`,
  DROP COLUMN `title_be`,
  DROP COLUMN `area_be`,
  DROP COLUMN `region_be`,
  DROP COLUMN `title_en`,
  DROP COLUMN `area_en`,
  DROP COLUMN `region_en`,
  DROP COLUMN `title_es`,
  DROP COLUMN `area_es`,
  DROP COLUMN `region_es`,
  DROP COLUMN `title_pt`,
  DROP COLUMN `area_pt`,
  DROP COLUMN `region_pt`,
  DROP COLUMN `title_de`,
  DROP COLUMN `area_de`,
  DROP COLUMN `region_de`,
  DROP COLUMN `title_fr`,
  DROP COLUMN `area_fr`,
  DROP COLUMN `region_fr`,
  DROP COLUMN `title_it`,
  DROP COLUMN `area_it`,
  DROP COLUMN `region_it`,
  DROP COLUMN `title_pl`,
  DROP COLUMN `area_pl`,
  DROP COLUMN `region_pl`,
  DROP COLUMN `title_ja`,
  DROP COLUMN `area_ja`,
  DROP COLUMN `region_ja`,
  DROP COLUMN `title_lt`,
  DROP COLUMN `area_lt`,
  DROP COLUMN `region_lt`,
  DROP COLUMN `title_lv`,
  DROP COLUMN `area_lv`,
  DROP COLUMN `region_lv`,
  DROP COLUMN `title_cz`,
  DROP COLUMN `area_cz`,
  DROP COLUMN `region_cz`;
*/