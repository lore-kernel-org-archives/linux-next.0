From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Wed, 4 Feb 2015 17:29:25 +1100
Message-ID: <20150204172925.728016bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ce+VIpGBTePIZqTT_nN3Msx"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49263 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751106AbbBDG3d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2015 01:29:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Joe Perches <joe@perches.com>

--Sig_/ce+VIpGBTePIZqTT_nN3Msx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/scsi/scsi_logging.c: In function 'sdev_prefix_printk':
drivers/scsi/scsi_logging.c:119:6: error: void value not ignored as it ough=
t to be
  ret =3D dev_printk(level, &sdev->sdev_gendev, "%s", logbuf);
      ^
drivers/scsi/scsi_logging.c: In function 'scmd_printk':
drivers/scsi/scsi_logging.c:146:6: error: void value not ignored as it ough=
t to be
  ret =3D dev_printk(level, &scmd->device->sdev_gendev, "%s", logbuf);
      ^

Caused by commit ded85c193a39 ("scsi: Implement per-cpu logging
buffer") interacting with commit d1f1052c5204 ("device: Change
dev_<level> logging functions to return void") from the driver-core
tree.

I added the following merge resolution patch.  Someone will have to
remember to tell Linus.  Also, the void return may be able to be
propagated further up the chain since these two new affected functions
now always return 0.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 4 Feb 2015 17:18:08 +1100
Subject: [PATCH] scsi: merge resolution for dev_printk API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/scsi_logging.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/scsi_logging.c b/drivers/scsi/scsi_logging.c
index ecc5918e372a..0810e92874d2 100644
--- a/drivers/scsi/scsi_logging.c
+++ b/drivers/scsi/scsi_logging.c
@@ -99,7 +99,6 @@ int sdev_prefix_printk(const char *level, const struct sc=
si_device *sdev,
 	va_list args;
 	char *logbuf;
 	size_t off =3D 0, logbuf_len;
-	int ret;
=20
 	if (!sdev)
 		return 0;
@@ -116,9 +115,9 @@ int sdev_prefix_printk(const char *level, const struct =
scsi_device *sdev,
 		off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt, args);
 		va_end(args);
 	}
-	ret =3D dev_printk(level, &sdev->sdev_gendev, "%s", logbuf);
+	dev_printk(level, &sdev->sdev_gendev, "%s", logbuf);
 	scsi_log_release_buffer(logbuf);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(sdev_prefix_printk);
=20
@@ -128,7 +127,6 @@ int scmd_printk(const char *level, const struct scsi_cm=
nd *scmd,
 	va_list args;
 	char *logbuf;
 	size_t off =3D 0, logbuf_len;
-	int ret;
=20
 	if (!scmd || !scmd->cmnd)
 		return 0;
@@ -143,9 +141,9 @@ int scmd_printk(const char *level, const struct scsi_cm=
nd *scmd,
 		off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt, args);
 		va_end(args);
 	}
-	ret =3D dev_printk(level, &scmd->device->sdev_gendev, "%s", logbuf);
+	dev_printk(level, &scmd->device->sdev_gendev, "%s", logbuf);
 	scsi_log_release_buffer(logbuf);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(scmd_printk);
=20
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ce+VIpGBTePIZqTT_nN3Msx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0bxKAAoJEMDTa8Ir7ZwVJd4P/RCn1fh1optSmpMTGe73ESCn
cvCuoN2NA0/uJ45pFymlz/RxFpjd+5+VBNRGLq/WXfQv3LSWU7yIw/I/KgVFeITQ
3pmETccEAbCUYD8ZelLhsjTcHVDgXCmrK8ew4YVmJHeHspm0W0U4vjARzOlnp8hJ
gK/3qvGlF06ijiEqcax0Pvrl3pHn32GSAPEcw/s5mr9gL+qzPDf/o/gPJOhhSNnd
Z7j8xBUxnoDof2erYwKPT5wFKH5ipLqxMEfj4SIr+B4l34L468zl9ZrzUJwqjZVL
ORntZGhWt+ZCQNJJtFRwp8WYs8O3cYzKd1IXOd0sy28nGxCeBjhPI3W/Q7RlrrKG
au9qY2+lTluFrTq1XVChI2biWysWJjEbDYqzE4zAJTZztwpDycz8z2je7nxZuvjB
ofdN+9p9sZTxxazqsIirChbKN88HZnQgpYwXhyju3V05VzYpHxZrIp6R14mh4BVQ
xXSmdofpoYhRKmJc9r2nz/bqzH/EsbhJ+JSok3HzL2yTJi1ywBZoehXnw6ssF0o1
68iwdPWeIfYAVx7qVfTOJn7LAljYxkVSShIyARM3x0Oj2to6K2/cBrZLYAqpK0J+
993QncrA5fs+2SKBK1xfMq85IHIQDcBMUpBGQIbhjZCJwyADgsxCOpKFH7pDun7l
i1q3pkMNTPjV9njnRxXB
=nzbW
-----END PGP SIGNATURE-----

--Sig_/ce+VIpGBTePIZqTT_nN3Msx--
