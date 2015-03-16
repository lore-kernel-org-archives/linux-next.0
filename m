From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kdbus tree with the arm-soc tree
Date: Mon, 16 Mar 2015 16:16:26 +1100
Message-ID: <20150316161626.32e838f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/twSAik4W7mIoEJ5Vn2Qztv9"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57642 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750844AbbCPFQe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2015 01:16:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, Daniel Mack <daniel@zonque.org>

--Sig_/twSAik4W7mIoEJ5Vn2Qztv9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the kdbus tree got a conflict in
Documentation/Makefile between commit c6535e1e0361 ("Documentation:
Remove ZBOOT MMC/SDHI utility and docs") from the arm-soc tree and
commit 48480f8c402c ("kdbus: add documentation") from the kdbus tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/Makefile
index bc0548201755,5e3fde632d03..000000000000
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@@ -1,4 -1,4 +1,4 @@@
 -subdir-y :=3D accounting arm auxdisplay blackfin connector \
 +subdir-y :=3D accounting auxdisplay blackfin connector \
- 	filesystems filesystems ia64 laptops mic misc-devices \
+ 	filesystems filesystems ia64 kdbus laptops mic misc-devices \
  	networking pcmcia prctl ptp spi timers vDSO video4linux \
  	watchdog

--Sig_/twSAik4W7mIoEJ5Vn2Qztv9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVBmcvAAoJEMDTa8Ir7ZwV8FAP/2aVwxxkWO7007AQPpUlWS1j
3fseCnSD33bW+34sv2l4G94LMnSBtywUz8QwKVMBLxRUSvRbRcIpFm2kylHL0JGs
F5gZJ/bnXEsgB19bDb1GfmvejJVmTJ6hKQXAmCNShFKVA1i6vlcUQPZwW67Aax7q
B+QCzRPSQJfOOlrjEL+pSbj5GQCT+R0yQz/akz8Tyln3BJtil0uBSsSYXy/I2o0F
i6rnxUT6D83k8Ecf7JH06aP1XBz6bVmVxv50OMt6r7/vlq8c2I3ELqk6A7RwUwov
qASZ1lNjO9/63kWPVG92m0ehAQIycKnInQC5nJ4+n5DfeQh10OFKjE8r60GTTq1y
jRmpNKFJf7CbGkyr87/L4DqUZCMbrAAEszHUl/G+pcSp2g3l88E2dA8vphBCidXA
qNrMDsVQD4UgJl8ZbRPhhn9aPZ7stOKga30v8PV1OEANDSGCt+Jux1YBf6MTSahv
imD+hFTRS8oql8ASIFYnLz5SF4mtd1c0hkzhlTaVdL4Hp/4bOqT6/Krfn8CFkPjJ
e7VfDYC8+aShC45ftQjIYxIFqJ5BiW3Jvkb6B7W6wZOsm4e2yFDkmXllV5z3HCS3
AoPO6sa4DfUqSaoY6ZyQFMCLeni6eFASSmZO8V484gMopa8MR+zBcwAJ/AtzTu0Y
lEU1rIJ3RRpLnGgeM/LO
=3K4n
-----END PGP SIGNATURE-----

--Sig_/twSAik4W7mIoEJ5Vn2Qztv9--
