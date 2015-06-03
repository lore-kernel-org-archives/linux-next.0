From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the target-updates tree
Date: Wed, 3 Jun 2015 18:16:07 +1000
Message-ID: <20150603181607.70cef830@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KOxL4lYJwVYx7UjPtVhNu9I"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48259 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753429AbbFCIQO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 04:16:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Bart Van Assche <bart.vanassche@sandisk.com>

--Sig_/KOxL4lYJwVYx7UjPtVhNu9I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

After merging the target-updates tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/target/target_core_fabric_lib.c: In function 'target_get_pr_transpo=
rt_id_len':
drivers/target/target_core_fabric_lib.c:364:7: error: 'SCSI_PROTOCOL_FCP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_FCP:
       ^
drivers/target/target_core_fabric_lib.c:364:7: note: each undeclared identi=
fier is reported only once for each function it appears in
drivers/target/target_core_fabric_lib.c:365:7: error: 'SCSI_PROTOCOL_SBP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SBP:
       ^
drivers/target/target_core_fabric_lib.c:366:7: error: 'SCSI_PROTOCOL_SRP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SRP:
       ^
drivers/target/target_core_fabric_lib.c:367:7: error: 'SCSI_PROTOCOL_SAS' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SAS:
       ^
drivers/target/target_core_fabric_lib.c:369:7: error: 'SCSI_PROTOCOL_ISCSI'=
 undeclared (first use in this function)
  case SCSI_PROTOCOL_ISCSI:
       ^
drivers/target/target_core_fabric_lib.c: In function 'target_get_pr_transpo=
rt_id':
drivers/target/target_core_fabric_lib.c:388:7: error: 'SCSI_PROTOCOL_SAS' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SAS:
       ^
drivers/target/target_core_fabric_lib.c:390:7: error: 'SCSI_PROTOCOL_SBP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SBP:
       ^
drivers/target/target_core_fabric_lib.c:392:7: error: 'SCSI_PROTOCOL_SRP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SRP:
       ^
drivers/target/target_core_fabric_lib.c:394:7: error: 'SCSI_PROTOCOL_FCP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_FCP:
       ^
drivers/target/target_core_fabric_lib.c:396:7: error: 'SCSI_PROTOCOL_ISCSI'=
 undeclared (first use in this function)
  case SCSI_PROTOCOL_ISCSI:
       ^
drivers/target/target_core_fabric_lib.c: In function 'target_parse_pr_out_t=
ransport_id':
drivers/target/target_core_fabric_lib.c:411:7: error: 'SCSI_PROTOCOL_SAS' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SAS:
       ^
drivers/target/target_core_fabric_lib.c:418:7: error: 'SCSI_PROTOCOL_SBP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SBP:
       ^
drivers/target/target_core_fabric_lib.c:419:7: error: 'SCSI_PROTOCOL_SRP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_SRP:
       ^
drivers/target/target_core_fabric_lib.c:420:7: error: 'SCSI_PROTOCOL_FCP' u=
ndeclared (first use in this function)
  case SCSI_PROTOCOL_FCP:
       ^
drivers/target/target_core_fabric_lib.c:423:7: error: 'SCSI_PROTOCOL_ISCSI'=
 undeclared (first use in this function)
  case SCSI_PROTOCOL_ISCSI:
       ^

Caused by commit 2650d71e244f ("target: move transport ID handling to
the core") interacting with commit ba929992522b ("target: Minimize SCSI
header #include directives") from the scsi tree.

I have added this merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Jun 2015 18:10:46 +1000
Subject: [PATCH] target: explicitly include scsi_proto.h in target_core_fab=
ric_lib.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/target/target_core_fabric_lib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/target/target_core_fabric_lib.c b/drivers/target/targe=
t_core_fabric_lib.c
index b05578b5b4a0..cb6497ce4b61 100644
--- a/drivers/target/target_core_fabric_lib.c
+++ b/drivers/target/target_core_fabric_lib.c
@@ -35,6 +35,8 @@
 #include <linux/spinlock.h>
 #include <linux/export.h>
=20
+#include <scsi/scsi_proto.h>
+
 #include <target/target_core_base.h>
 #include <target/target_core_fabric.h>
=20
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/KOxL4lYJwVYx7UjPtVhNu9I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbrfMAAoJEMDTa8Ir7ZwVCFoP/3C5XUluPRiLsz0WOeNKjC63
0Xnjd+Ia5W5im3HXdJaazmiNHNICDBIAW+Z1m+98yPwIAvP393tPo1gji8EpbpQ4
JZkAvdeWN4awNQJqTeHrHiTIl3fXiF2voTOm3w/0+XwZOBEi3NaZ34hLOFsHY7Cj
PIIclgjsU0gxg8cRcUKWzLr3oFLS8plv0NBzxEP+/sK/UuSu0ZF1aoKEKQNYn5ra
HBxO4r8rdDxWc449lyNoRP6NCJt6DmbH2cLul4YsjkF4TK9ovFgYKSmWwG47KKy7
K3ENXJbLSqzO02OQ67LVV7bM6s3z73P95TAT4kgot4Ac5p7y/cWF399sELkSFQm5
GdFnyiSfhM9cgklosftjffc8Siu1+lyTdSZmkqEUBZxzeMn5DRGGdbUlR5p1At44
IjOcIifyQem0BUIN1G2TK8gnw17+Cqd7wKCGOo4Z19kV+pgL4cDVaMlPMWzGT4WP
v9S1+uJ9yizJwIn/FHh0OBLy1WzVygaLRHPpEg13wjNsmoagG7Z+7xtcPKJCqePI
IFkoWZ3iZTJFzbKB5ZJuT+XF6fIXC9ieecbr/diqaIHTOqOzYFPYRVb+LF8St3zY
w/1BrQy6gm751caqJxnkEuCtpVVrcHWVKlniMbeCpn1hXTEJtKbptumTm+Bs55mt
uyROtaMNm/RTUiAH5cxF
=1uST
-----END PGP SIGNATURE-----

--Sig_/KOxL4lYJwVYx7UjPtVhNu9I--
