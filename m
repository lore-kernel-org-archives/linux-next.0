From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the jc_docs tree
Date: Mon, 24 Sep 2018 12:50:16 +1000
Message-ID: <20180924125016.0f813c15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Nax6AogWKQOopVOtT.+TSns"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Henrik Austad <henrik@austad.us>, Vladimir Zapolskiy <vz@mleia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Nax6AogWKQOopVOtT.+TSns
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  Documentation/filesystems/00-INDEX

between commit:

  a7ddcea58ae2 ("Drop all 00-INDEX files from Documentation/")

from the jc_docs tree and commit:

  a779df303b05 ("Documentation: filesystems: remove reminiscences of POHMEL=
FS")

from the staging tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nax6AogWKQOopVOtT.+TSns
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluoUOgACgkQAVBC80lX
0GxdwAf/eiDP/hlxrfhd0FbfGjuwZgVwSO1TwW0DEuDGSqzbA6pU5iocXGLVKd0I
66nGn57PSU74y4vVvVzJoISdLg0vKbp0DFzX5+NYhOMit7Q3DehEXPfuyJEUus/a
Z0FYFKR4qazpuxIfZrXEhLDyQGb5fDgLoRGD2Zm5EoBagr7//kU6vScae0MadqgB
WBHzeuK9lGhTikzJz4Zt8WWSZXPmNlB5CstQqfTzFd6OqW+8LyE7sLo4MxEXrudo
QQexcCPbYNWfIA62+/hoPYzSTEGC0ykQy3g76TBYn31+QcdWemOaqAcN4ymnV+BC
SOtyFu2JvIL3YW/l/gIB+aLQEoN2Qg==
=zv56
-----END PGP SIGNATURE-----

--Sig_/Nax6AogWKQOopVOtT.+TSns--
