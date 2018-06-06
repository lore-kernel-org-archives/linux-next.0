From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Date: Wed, 6 Jun 2018 14:37:41 +1000
Message-ID: <20180606143741.194a5a06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NP9I/APRKw/L5VIzJ6ESjQG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NP9I/APRKw/L5VIzJ6ESjQG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  MAINTAINERS

between commit:

  2562c011f897 ("MAINTAINERS: add Josh Poimboeuf as faddr2line maintainer")

from Linus' tree and commit:

  30c8bd5aa8b2 ("net: Introduce generic failover module")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 8ac49add2df7,884657f0be11..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -5430,11 -5413,14 +5430,19 @@@ S:	Maintaine
  F:	Documentation/hwmon/f71805f
  F:	drivers/hwmon/f71805f.c
 =20
 +FADDR2LINE
 +M:	Josh Poimboeuf <jpoimboe@redhat.com>
 +S:	Maintained
 +F:	scripts/faddr2line
 +
+ FAILOVER MODULE
+ M:	Sridhar Samudrala <sridhar.samudrala@intel.com>
+ L:	netdev@vger.kernel.org
+ S:	Supported
+ F:	net/core/failover.c
+ F:	include/net/failover.h
+ F:	Documentation/networking/failover.rst
+=20
  FANOTIFY
  M:	Jan Kara <jack@suse.cz>
  R:	Amir Goldstein <amir73il@gmail.com>

--Sig_/NP9I/APRKw/L5VIzJ6ESjQG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsXZRUACgkQAVBC80lX
0GxYEQgAgT50zctDkkCESwKSac3xKzMrnX/b/t2X5nwGGEtCi6x7LAWG9gwUkr/A
cHjYVVf+BBYOX/1QGJyH5gbmfheu1lhkApQAF6pO9By4C9/d72sktLGWyhmFxo8m
h72hoUNCrmcSdD8yKI+NudgXLM31r0Cdzzc/DiB+FtH6tZDkgAYcCTf1qSwFPkbS
K7woJgtlNMGzGvXqePUOJ50tNul07DIeuSEYIGpYyaT4n7wRNxDuiZwlygpvCIk3
CaxjllofLlecWe/+24g3y1Mh2O9jAr4VCEPaFmUeMcx3yW5a+zc82kV+TDD1eJEj
svZdT881xU/DwrhFrwnEhTqYxYcRVg==
=24o2
-----END PGP SIGNATURE-----

--Sig_/NP9I/APRKw/L5VIzJ6ESjQG--
