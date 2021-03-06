CREATE TABLE if not exists n_cube (
  n_cube_id bigint(20) NOT NULL,
  n_cube_nm varchar(250) NOT NULL,
  tenant_cd varchar(10) CHARACTER SET ascii NOT NULL DEFAULT 'NONE',
  cube_value_bin longblob,
  create_dt timestamp NOT NULL,
  create_hid varchar(20) DEFAULT NULL,
  version_no_cd varchar(16) NOT NULL,
  status_cd varchar(16) NOT NULL DEFAULT 'SNAPSHOT',
  app_cd varchar(20) NOT NULL,
  test_data_bin longblob,
  notes_bin longblob,
  revision_number bigint(20) DEFAULT '0',
  branch_id varchar(80) NOT NULL DEFAULT 'HEAD',
  sha1 varchar(40) DEFAULT NULL,
  head_sha1 varchar(40) DEFAULT NULL,
  changed int DEFAULT NULL,
  PRIMARY KEY (n_cube_id),
  UNIQUE KEY n_cube_unique (n_cube_nm, tenant_cd, app_cd, version_no_cd, branch_id, revision_number),
  KEY fourIdx (tenant_cd, app_cd, version_no_cd, branch_id),
  KEY versionIdx (version_no_cd),
  KEY revIdx (revision_number),
  KEY branchIdx (branch_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;