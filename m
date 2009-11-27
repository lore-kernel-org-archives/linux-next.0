From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the osd tree with the scsi tree
Date: Fri, 27 Nov 2009 14:32:29 +1100
Message-ID: <20091127143229.108298c6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Nov_2009_14_32_29_+1100_VlSYb3JpKbT5cCe4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52693 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753834AbZK0Dc2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 22:32:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

--Signature=_Fri__27_Nov_2009_14_32_29_+1100_VlSYb3JpKbT5cCe4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boaz,

Today's linux-next merge of the osd tree got a conflict in
drivers/scsi/osd/osd_uld.c between commit
f89b9ee4a722721ed205b8c29555ac75fbe8c2cc ("[SCSI] osduld: Use
device->release instead of internal kref") from the scsi tree and commit
9b579fe8588b861dcf0c9b620757729643db4557 ("osduld: Use device->release
instead of internal kref") from the osd tree.

These are slightly different versions of the same patch ...

And commit 01e4c32c668251e74eb179ee1207c075466c4ef8 ("osduld: No need to
use dev_set_drvdata on embedded devices") from the osd also contributes
to the conflict.

I fixed it up (the obvious way) and can carry the fix for a while.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Nov_2009_14_32_29_+1100_VlSYb3JpKbT5cCe4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksPSE0ACgkQjjKRsyhoI8yflQCgk98CnGC+zEHVxAoBvfxscAKj
7uEAoLaTF/9L3KngPZywu8gAE+cNOPQJ
=vHmO
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Nov_2009_14_32_29_+1100_VlSYb3JpKbT5cCe4--
