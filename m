From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arc-current tree with Linus' tree
Date: Wed, 15 Aug 2018 08:11:41 +1000
Message-ID: <20180815081141.3f1b1059@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HuV4cFL1C_RG_66=8oYm9h0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/HuV4cFL1C_RG_66=8oYm9h0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

Today's linux-next merge of the arc-current tree got a conflict in:

  arch/arc/include/asm/atomic.h

between commit:

  ab0b910490fe ("atomics/arc: Define atomic64_fetch_add_unless()")

from Linus' tree and commit:

  39456148db74 ("ARC: atomic64: fix atomic64_add_unless function")

from the arc-current tree.

I fixed it up (I just used the version from Linus' tree for now) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/HuV4cFL1C_RG_66=8oYm9h0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzU50ACgkQAVBC80lX
0GySTwf8DAHF4ma7U5UF2mh0VZL0dnJkNS/Km4kXAt/Pit3MWCzuvdoRU3KP8NCy
bbVJGZgpp8qbRexpguQ8Zz/h4c0RPwi2eGpiu3Jlwelt0L4No6GXfYeC6M8BaHDR
MOZP01OgS9wqu4zHbRlfcoadWFY+Nyzv98lwcB40AuQ9Sr7zeKIYetnyBy0KZi85
l6qtKPrgMu3oBQ24J2wuutJGTutCLkToet9sCBhRIrNR4RXd4HUa4/07WCWhV8A5
MR2minmy8dmBBMkzxt1lHajve/7QJK7iDWq32+C9iL3zAu2KDfeCJWDeAVO3kXmo
cARkwkutwRGEtvsEfbTyhMieUDBW+g==
=YYlw
-----END PGP SIGNATURE-----

--Sig_/HuV4cFL1C_RG_66=8oYm9h0--
