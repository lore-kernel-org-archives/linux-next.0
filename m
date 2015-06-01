From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Mon, 1 Jun 2015 21:19:37 +1000
Message-ID: <20150601211937.10a321b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1Ufnl_U8XAlXBP5qMEmRE=4"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40719 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751280AbbFALTo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 07:19:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Grover <agrover@redhat.com>, Christoph Hellwig <hch@lst.de>

--Sig_/1Ufnl_U8XAlXBP5qMEmRE=4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/target/target_core_user.c between commit 9c1cd1b68cd1
("target/user: Only support full command pass-through") from Linus'
tree and commit 1f44c7e00856 ("target: simplify backend driver
registration") and 1854440347ec ("target: consolidate backend attribute
implementations") from the target-updates tree.

I fixed it up (just this file - see below - I hope that the rest was
taken care of) and can carry the fix as necessary (no action is
required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/target/target_core_user.c
index edc955558250,6742e53f5f97..000000000000
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@@ -1050,30 -1115,57 +1099,10 @@@ tcmu_pass_op(struct se_cmd *se_cmd
  static sense_reason_t
  tcmu_parse_cdb(struct se_cmd *cmd)
  {
 -	unsigned char *cdb =3D cmd->t_task_cdb;
 -	struct tcmu_dev *udev =3D TCMU_DEV(cmd->se_dev);
 -	sense_reason_t ret;
 -
 -	switch (udev->pass_level) {
 -	case TCMU_PASS_ALL:
 -		/* We're just like pscsi, then */
 -		/*
 -		 * For REPORT LUNS we always need to emulate the response, for everythi=
ng
 -		 * else, pass it up.
 -		 */
 -		switch (cdb[0]) {
 -		case REPORT_LUNS:
 -			cmd->execute_cmd =3D spc_emulate_report_luns;
 -			break;
 -		case READ_6:
 -		case READ_10:
 -		case READ_12:
 -		case READ_16:
 -		case WRITE_6:
 -		case WRITE_10:
 -		case WRITE_12:
 -		case WRITE_16:
 -		case WRITE_VERIFY:
 -			cmd->se_cmd_flags |=3D SCF_SCSI_DATA_CDB;
 -			/* FALLTHROUGH */
 -		default:
 -			cmd->execute_cmd =3D tcmu_pass_op;
 -		}
 -		ret =3D TCM_NO_SENSE;
 -		break;
 -	case TCMU_PASS_IO:
 -		ret =3D sbc_parse_cdb(cmd, &tcmu_sbc_ops);
 -		break;
 -	default:
 -		pr_err("Unknown tcm-user pass level %d\n", udev->pass_level);
 -		ret =3D TCM_CHECK_CONDITION_ABORT_CMD;
 -	}
 -
 -	return ret;
 +	return passthrough_parse_cdb(cmd, tcmu_pass_op);
  }
 =20
- DEF_TB_DEV_ATTRIB_RO(tcmu, hw_pi_prot_type);
- TB_DEV_ATTR_RO(tcmu, hw_pi_prot_type);
-=20
- DEF_TB_DEV_ATTRIB_RO(tcmu, hw_block_size);
- TB_DEV_ATTR_RO(tcmu, hw_block_size);
-=20
- DEF_TB_DEV_ATTRIB_RO(tcmu, hw_max_sectors);
- TB_DEV_ATTR_RO(tcmu, hw_max_sectors);
-=20
- DEF_TB_DEV_ATTRIB_RO(tcmu, hw_queue_depth);
- TB_DEV_ATTR_RO(tcmu, hw_queue_depth);
-=20
- static struct configfs_attribute *tcmu_backend_dev_attrs[] =3D {
- 	&tcmu_dev_attrib_hw_pi_prot_type.attr,
- 	&tcmu_dev_attrib_hw_block_size.attr,
- 	&tcmu_dev_attrib_hw_max_sectors.attr,
- 	&tcmu_dev_attrib_hw_queue_depth.attr,
- 	NULL,
- };
-=20
- static struct se_subsystem_api tcmu_template =3D {
+ static const struct target_backend_ops tcmu_ops =3D {
  	.name			=3D "user",
  	.inquiry_prod		=3D "USER",
  	.inquiry_rev		=3D TCMU_VERSION,

--Sig_/1Ufnl_U8XAlXBP5qMEmRE=4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbD/OAAoJEMDTa8Ir7ZwVqnYP/i+RKJFk9UFnrrf270PAoiNM
zoaq7Q/EncUvDYLqp8UneiIdlMbMTe34QU1nsd5BaWWdqdubZDrJoUruOoKipCIO
GH2GyXz1hdLpz3FgY/UzYNuovWBMMCZViU/ZAh0J+dc48nmbnZf2aafKN/rz49Zz
VNRXMIgfyXrS4aqGBSoTBDbW6bE19cLLtHOWKZFWTfud9ARlrrxWRHW6HfjRbSiC
QRaKNFkoPyLRqNMhcLPKQRXIvgCrw0ju1ILGwKfcWO+L6qm8rnmC9GTrFg4Ro5uk
7URzOYZP01EpyK9MUohg8S2vcVPRC5PGbj+S5SIfRp3rAGVHDampHPNSk4fA/Vom
Jll2ySs3GWLinHQ4Qdu5Gn+gh6k2VVXsRd82Fq3SGbgunhG2gOQjpYmS4piKwJhW
8VUQxrcchbo2Og8VkTNGLfnut0FloHO0yH/RlcDqZz5bQLVOqjKlPHCd+DeDD8yX
/l5SoqXbAXVR4kAD7oYF5DE6J8uT4puryXQ7sas5tf1Hzz3KsQqLDQ7Rx7aeEjp9
cA0F7jWiu+wClr178OH9zdPt1ejJLVf8RWtJuiTZY13rnwpwzCOji1PnhLkwRnZG
xFYkSrzHrUgy+pf2SMpzrmj0wK3F5ZWIFENGrg7Zb2PrJ3buQU8hWo4Z0rgEcc3K
aWjmDG3XUDF+3aB6sK5K
=MM6k
-----END PGP SIGNATURE-----

--Sig_/1Ufnl_U8XAlXBP5qMEmRE=4--
