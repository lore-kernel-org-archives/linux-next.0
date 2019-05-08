From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the net tree
Date: Thu, 9 May 2019 07:43:08 +1000
Message-ID: <20190509074308.7c0ade7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zd_DhxPtPy7N5zeooSkhzkt"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vladimir Oltean <olteanv@gmail.com>, Hangbin Liu <liuhangbin@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/zd_DhxPtPy7N5zeooSkhzkt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3b2c4f4d63a5 ("net: dsa: sja1105: Don't return a negative in u8 sja1105_s=
tp_state_get")

Fixes tag

  Fixes: 640f763f98c2: ("net: dsa: sja1105: Add support for Spanning Tree P=
rotocol")

has these problem(s):

  - the ':' after the SHA1 is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

In commit

  e9919a24d302 ("fib_rules: return 0 directly if an exactly same rule exist=
s when NLM_F_EXCL not supplied")

Fixes tag

  Fixes: 153380ec4b9 ("fib_rules: Added NLM_F_EXCL support to fib_nl_newrul=
e")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/zd_DhxPtPy7N5zeooSkhzkt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzTTWwACgkQAVBC80lX
0GxlCgf/b5yD/Wnlo5qm4dcDRcTmKTnt9HgRU7xWAPTZto5fDLbiUsRkyx4+bZHb
Z+6+drXkIQxh68OIKmpyA/6NItK7GukC5AwaXwz3cwOu6FbWwjSqw2Jbmc3zr1P1
BWbiKZd9nZtCer+lobMox4aWMOqXjt8XQLaoXABNhsMSMe/NP4/B0YoyHyuVdBDy
d2IEdL19ReyQeAMGUjQTBE0QgSsfTP2R933BsoFaODw8ApGMBLIij42M74SuIWs+
eIt2a+Y0nAVjy2uBZ7sjQfVuhz5s36h5xeweaq70vbdteD0eC2u9tNQENjfblxwB
HsShBhEhqRPsiCGD0LyavIguYLrAeg==
=G0pe
-----END PGP SIGNATURE-----

--Sig_/zd_DhxPtPy7N5zeooSkhzkt--
