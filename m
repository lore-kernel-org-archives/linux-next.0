From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the uml tree
Date: Mon, 1 Jun 2015 14:45:43 +1000
Message-ID: <20150601144543.118bbda2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kL5=WTbon=ChpX_4KPPAZ_R"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33333 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750936AbbFAEpq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 00:45:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>, Christoph Hellwig <hch@lst.de>

--Sig_/kL5=WTbon=ChpX_4KPPAZ_R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
arch/um/include/asm/Kbuild between commit d5f20be7cab8 ("um: Create
asm/sections.h") from the uml tree and commit c546d5db75b4 ("remove
scatterlist.h generation from arch Kbuild files") from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/um/include/asm/Kbuild
index ea9ec2e34384,b7df3ae9be51..000000000000
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@@ -21,7 -21,7 +21,6 @@@ generic-y +=3D param.
  generic-y +=3D pci.h
  generic-y +=3D percpu.h
  generic-y +=3D preempt.h
- generic-y +=3D scatterlist.h
 -generic-y +=3D sections.h
  generic-y +=3D switch_to.h
  generic-y +=3D topology.h
  generic-y +=3D trace_clock.h

--Sig_/kL5=WTbon=ChpX_4KPPAZ_R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa+N3AAoJEMDTa8Ir7ZwVAWcP/2aJLZak9CdmVFv4yPnny+PJ
begxKx8Ub8GfCYrv8yRqXsUznXMBNQuMYTwRCziGIdYgI/kSj56BftJawDeYRE3h
7JDB2XXX9PzTtWNu7X1KgLn/2H5YwMLphvN+IKvVJYH6zqt5N94UWdVoldFUP0pw
oEu7DYfNs1pyx232Jtv6hIDkolo2+fu1t7K29zDBa1GnGOuY+1pVyZDvcmbDz9gU
nZ5Y8uCI6xuM3SOZod8mCGeDnkEtdCQ13a5FtElMUgGS/vOa4WgRSNWUAdMsp7l+
RFycZOJN+gr4LTAXCqmrUBbGv39EYmz9J99bHTd1ZkV4Tc/J2qjZB0GnCP4QEBqp
IOVvqmsw/M4E3HTQ4G5fD+hVQeh2cKxZtMOaOp9Lv5j1hk6IJ0z4ev0ag7b99BO1
13Gqzp6yd8VQSxulf+90lW2EqE7ZiMNu4m2ugfItkia/80ortpMTv/i6oQyRfJfr
qTxgrsyGzFgDJqbw1tDFxYl1hVeyn7Cz43UX7xdxi2QdbhY7jpnuubX7WTPiWKYy
TzdvB7gMSe2Ik3/A0K2Mgkg9bDkmBnCBKXTubq/Mr3GgJ3nMTnFSdt90LR1B5tUK
ThtK9e9RlW5KSI802NV8bSedZbpC0InGaxXZBIJxgeqjFfiZD3rpQcgGp+70rYo2
4jbALU0hE5Nu7XWw63lu
=CcnW
-----END PGP SIGNATURE-----

--Sig_/kL5=WTbon=ChpX_4KPPAZ_R--
