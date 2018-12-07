From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with the fscrypt tree
Date: Fri, 7 Dec 2018 11:53:40 +1100
Message-ID: <20181207115340.2465a854@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CEPcu3FO.paRPuD/SljvRJQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/CEPcu3FO.paRPuD/SljvRJQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/filesystems/index.rst

between commit:

  1b71a6809f96 ("fs-verity: add a documentation file")

from the fscrypt tree and commit:

  7bbfd9ad8eb2 ("Documentation: convert path-lookup from markdown to restur=
ctured text")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/index.rst
index 818390c32be6,ba921bdd5b06..000000000000
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@@ -360,13 -360,13 +360,24 @@@ encryption of files and directories
 =20
      fscrypt
 =20
 +Verity API
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +
 +A library which filesystems can hook into to support transparent
 +authentication of read-only files.
 +
 +.. toctree::
 +    :maxdepth: 2
 +
 +    fsverity
++
+ Pathname lookup
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+ Pathname lookup in Linux is a complex beast; the document linked below
+ provides a comprehensive summary for those looking for the details.
+=20
+ .. toctree::
+    :maxdepth: 2
+=20
+    path-lookup.rst

--Sig_/CEPcu3FO.paRPuD/SljvRJQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJxJQACgkQAVBC80lX
0GzszQf/YlYmIDVssO51Wa23m+eBSQb4K3ioft83i1KeNuVzYK4KPa4dYKWFQ2jG
FSLkpr1Ae9cqCggR381K/L/ufDavlEnK7QZlsWX/PbLRzeiHMrxCUwkAeOwDEf4r
12B4SZLghQ80m5yIdJUh1MToeDLfRVhlv2nBdFL0iTIaYlc2hBuc+sJoKMUxm0mU
cY9s3By5/JNHIrS0ftB/PKNKFXGToACjvENw/L8xLbVS04Q1MmiI18EGWB3l1Q4S
AqVWPfBz3qrsQa70lSIjzQ13OpilV775JsegvQKOcOWBT3DlMd1qk+16hNySUbcS
Y1b0uuLi6kJMwR4cde71W3j3rLMS8Q==
=V6dG
-----END PGP SIGNATURE-----

--Sig_/CEPcu3FO.paRPuD/SljvRJQ--
