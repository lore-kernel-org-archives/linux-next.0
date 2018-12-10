From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ubifs tree with the fscrypt tree
Date: Tue, 11 Dec 2018 10:24:25 +1100
Message-ID: <20181211102425.7019f0a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qQcqP08b_uPJnFcH_vmeX+6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chandan Rajendra <chandan@linux.vnet.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

--Sig_/qQcqP08b_uPJnFcH_vmeX+6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ubifs tree got a conflict in:

  fs/ubifs/Kconfig

between commit:

  6956097c429a ("fscrypt: remove filesystem specific build config option")

from the fscrypt tree and commit:

  1341551f1e2a ("ubifs: CONFIG_UBIFS_FS_AUTHENTICATION should depend on UBI=
FS_FS")

from the ubifs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ubifs/Kconfig
index ff7ea6f04555,bc1e082d921d..000000000000
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@@ -65,9 -60,20 +62,9 @@@ config UBIFS_FS_XATT
 =20
  	  If unsure, say Y.
 =20
 -config UBIFS_FS_ENCRYPTION
 -	bool "UBIFS Encryption"
 -	depends on UBIFS_FS_XATTR && BLOCK
 -	select FS_ENCRYPTION
 -	default n
 -	help
 -	  Enable encryption of UBIFS files and directories. This
 -	  feature is similar to ecryptfs, but it is more memory
 -	  efficient since it avoids caching the encrypted and
 -	  decrypted pages in the page cache.
 -
  config UBIFS_FS_SECURITY
  	bool "UBIFS Security Labels"
- 	depends on UBIFS_FS && UBIFS_FS_XATTR
+ 	depends on UBIFS_FS_XATTR
  	default y
  	help
  	  Security labels provide an access control facility to support Linux

--Sig_/qQcqP08b_uPJnFcH_vmeX+6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwO9akACgkQAVBC80lX
0GyGbgf8CLWZGlV8J9ZBbK1QuRaPR7q2rzhrIiTbo6KelMCuYJo0mhzCDceAOTQA
LqndlGl6i3lBL4NAuH76RBbUWsvmTHrXR2Mhvb/o/fodQX0u7nYuuETmY3pKwB9d
98DIW3BpFOoLN3tqaf7QxFiESKXlprHEbQ+2nBcPEjXMnGYkdbQJRQ9Io6dt5z/C
j8b6L/c/2LMQO/AMY9+ErkpG1+FJURYASbsYaR4Jash6/VBnenFHMfDWojRSq8M8
laKNdN0ci5o/aEOopFHFAca+xS7yOK8SQlgZI6bzwrTsS7YgWIrwD+7JA+GowT86
7F1Th4PjRVWsSaaYv1r0y4N8ClPW/w==
=xNnl
-----END PGP SIGNATURE-----

--Sig_/qQcqP08b_uPJnFcH_vmeX+6--
