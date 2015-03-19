From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the y2038 tree with the staging tree
Date: Thu, 19 Mar 2015 17:29:29 +1100
Message-ID: <20150319172929.51872f9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3pYcrV/A.EQ6mDEeKHQTjcb"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55283 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750799AbbCSG3h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2015 02:29:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tapasweni Pathak <tapaswenipathak@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>

--Sig_/3pYcrV/A.EQ6mDEeKHQTjcb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Today's linux-next merge of the y2038 tree got a conflict in
drivers/staging/media/lirc/lirc_parallel.c between commit 8126e17f8925
("Staging: media: Remove parentheses around right side an assignment")
from the staging tree and commit 77f0cbce579d ("staging: media: lirc:
Replace timeval with ktime_t in lirc_parallel.c") from the y2038 tree.

I fixed it up (I used the y2038 tree version as that also removed the
extra parentheses) and can carry the fix as necessary (no action is
required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/3pYcrV/A.EQ6mDEeKHQTjcb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCmzNAAoJEMDTa8Ir7ZwVnB0P/2yVT0RzE2JtZOldxFRKRSeH
2uj0dc+28qsL43dOoBzJwkSJJiI4Xq8Ww/bVY/hoA8N0qZoxOvH3eN5iUAq4O8bh
vAEfS9katFF1RvhBDwN7JHxaLMspxHueYtrjoDcxiWGqXSqfh+VDjsSushMXOAHH
BLq/GKsXqWEDIGxI3BLvTZGjFNHv0Gtlvbw7NT1q3xYARCJpeUrzqJDbam6oRyNL
bTNLRfpexhEHBAbxHJgnbPdYY/M6CGUNpGQEGEMWbxNdpaQZESOWYLiaEV3eVkAP
hig0fNq+sibv4D0pcf1FJgHTo1KlKh4envUDGQhvwwXWEldLiJeRv0AvllovJlrQ
63bVu9vacM/bkAz1ROZoCGzKXoe7W+RA7FsvOt7/gX9/1Z09SGLplw3LGUas90Pr
MPKSZuQo033SacQKMSxLhR7lNTnIjcQvTYwctGuUtKShYipigMP0iaV/pvPH0SrC
W7qhyAsJt0ubTzTcBOnrHpmLFHoins8HCPbiuzXvtovtTp2V7q3oD3bIwiVK0lh/
tLvi3zQmIciiOwoDW0Ehh7IqFXbPONiGyxPjI5aeO8N4YtbbiAY0ztQPLONQCFgQ
OsdtOKXFrz4uO5J7p5cnwPHIfOgxSXUR1FbmRlQcsm9AXp5w7f3deVYqSoyBuTL1
Pr9QvTmv2Sh2BSmxhJ9B
=JYzS
-----END PGP SIGNATURE-----

--Sig_/3pYcrV/A.EQ6mDEeKHQTjcb--
