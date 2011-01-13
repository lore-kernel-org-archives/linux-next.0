From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Fri, 14 Jan 2011 10:43:10 +1100
Message-ID: <20110114104310.d975c69c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Jan_2011_10_43_10_+1100_otONrIGegB+hn8P1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58838 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752291Ab1AMXnU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Jan 2011 18:43:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>, Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__14_Jan_2011_10_43_10_+1100_otONrIGegB+hn8P1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

While building Linus' tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/ecryptfs/main.c:144: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before '*' token
fs/ecryptfs/main.c: In function 'ecryptfs_interpose':
fs/ecryptfs/main.c:204: error: implicit declaration of function 'ecryptfs_g=
et_inode'
fs/ecryptfs/main.c:204: warning: initialization makes pointer from integer =
without a cast
fs/ecryptfs/main.c:206: error: expected ')' before 'return'
fs/ecryptfs/main.c:212: error: expected expression before '}' token
fs/ecryptfs/main.c: In function 'ecryptfs_mount':
fs/ecryptfs/main.c:569: warning: assignment makes pointer from integer with=
out a cast

Caused by commit 66cb76666d69502fe982990b2cff5b6d607fd3b1 ("sanitize
ecryptfs ->mount()") which was obviously not even build tested.  :-(

I have just reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Jan_2011_10_43_10_+1100_otONrIGegB+hn8P1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNL44OAAoJEDMEi1NhKgbsIvQH/1GJlJ6noxVQaQs8BDamHJ+c
g/EXdOmGW37AKkr0x4cX433NQA5KY/J0NNicl8Wz6MgN6B6adQYOZcN+0i/EMjkQ
YaTZyZBJK0WjhuUEMb3wvMPHxCwORGpNnIS4ofZvH7FVHZWgnPRoG3vUDIVJ0Bdj
aEbl4LBmRH0RQtSw7ys1aKwgVIR+DKX17eDowLugBbHqpipJYh5dUx3rSTd77yWF
IA5BfR3uU9IWHFL61gWSL3CVDpHKZx0RaO6rtv08YyCUUWQhFJJsRkxKXB6vB8cy
f4KoT5N2V0ExddJZDN3ZfW7bBEbmybtkQoI6rSVph9FjDR9rBQr0tNWqoMtUo9g=
=kPhm
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Jan_2011_10_43_10_+1100_otONrIGegB+hn8P1--
