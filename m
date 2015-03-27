From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the livepatching tree with the s390
 tree
Date: Fri, 27 Mar 2015 18:30:35 +1100
Message-ID: <20150327183035.29e1bcec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Dk55MVtf3pJtdxj_stq8IRj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>
List-Id: linux-next.vger.kernel.org

--Sig_/Dk55MVtf3pJtdxj_stq8IRj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the livepatching tree got a conflict in
arch/s390/Kconfig between commit 5a79859ae0f3 ("s390: remove 31 bit
support") from the s390 tree and commit b8887ad66c1c ("livepatch: add
support on s390") from the livepatching tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/s390/Kconfig
index 1de26e1c48ac,eba9c1d0dab5..000000000000
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@@ -132,7 -132,8 +132,8 @@@ config S39
  	select HAVE_KERNEL_XZ
  	select HAVE_KPROBES
  	select HAVE_KRETPROBES
 -	select HAVE_KVM if 64BIT
 +	select HAVE_KVM
+ 	select HAVE_LIVEPATCH
  	select HAVE_MEMBLOCK
  	select HAVE_MEMBLOCK_NODE_MAP
  	select HAVE_MEMBLOCK_PHYS_MAP

--Sig_/Dk55MVtf3pJtdxj_stq8IRj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVFQcgAAoJEMDTa8Ir7ZwVHYUP/0P7KCeD2uSObkXY3d7hknZI
/krw7Jy4hPWlyLgz++XB97AnM2zYaT4VWjUhNpKu2m1+fmpjwFOp2j5oCFjmizAr
UszpdRFBhEkB8zgumAA/U2D5HBPqR05Y0Y17SeOxKDxxrl3J9ovBveInbYgni9uB
i/+WW2iDOi8kK1HeC2CGmOjK78IAc3yIz0EnXJA6GF2kn9WiMoDlNjMZ1MBtaw6o
mYFhVQQgTOJtQ8LogqJAv2hwjn8Te3R9kd0YyWOsqiPlnv+oX8FzPqZDGLJKKrgQ
YMJfPJ6e5/aDpr0oFzke1FmbpP6pbnTv9UGaVCxXRjXbuM4Xege3jDVlOP3Vjqpp
r0m2t1SE3XOzqv1JZpjaQgHDeeuApmDCNTwkUmsWFJq0WnjvLXnJBYyBApghQBvG
NNigs4Yv7vg6HQ5FiMnuPyTkoF9s4/YY3WUEf+9NgcLHBC7cj5xS035rvz3OeCuq
FVECQo+fiV83Do+dUP4JQEWl6XMuFiTb5VkUH4esnz5gdPGxioA50ZtF7MPu/Jln
a2456+Og6XM1Ou0gl76VsJZnBqt6GO03LRzAjcRzVQEuoPJuVhtYyARxrSBKl3vE
cqg/zgMee0EEZ59n0XN9GquSwHJscfWD244qGhDgt/vP4fHMQarjFbUbWrBI3blD
FTYdl9Z6Im6GrrT1SaJV
=aVoy
-----END PGP SIGNATURE-----

--Sig_/Dk55MVtf3pJtdxj_stq8IRj--
