From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with Linus' tree
Date: Mon, 29 Oct 2018 13:01:24 +1100
Message-ID: <20181029130124.290346e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/X_/swfdki+BZTJ8afk_lQqW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/X_/swfdki+BZTJ8afk_lQqW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/cpuidle/governors/menu.c

between commit:

  8508cf3ffad4 ("sched: loadavg: consolidate LOAD_INT, LOAD_FRAC, CALC_LOAD=
")

from Linus' tree and commit:

  a7fe5190c03f ("cpuidle: menu: Remove get_loadavg() from the performance m=
ultiplier")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/cpuidle/governors/menu.c
index 71979605246e,76df4f947f07..000000000000
--- a/drivers/cpuidle/governors/menu.c
+++ b/drivers/cpuidle/governors/menu.c
@@@ -130,11 -130,10 +130,6 @@@ struct menu_device=20
  	int		interval_ptr;
  };
 =20
- static inline int get_loadavg(unsigned long load)
- {
- 	return LOAD_INT(load) * 10 + LOAD_FRAC(load) / 10;
- }
 -
 -#define LOAD_INT(x) ((x) >> FSHIFT)
 -#define LOAD_FRAC(x) LOAD_INT(((x) & (FIXED_1-1)) * 100)
--
  static inline int which_bucket(unsigned int duration, unsigned long nr_io=
waiters)
  {
  	int bucket =3D 0;

--Sig_/X_/swfdki+BZTJ8afk_lQqW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWafQACgkQAVBC80lX
0Gz/ygf9F78MzY9YDkx3+GE4g9YtmmyWE+ngodELWEa9NqzFSdczjjuBdXWw7jXV
93YDuYQF6jljE+p/dSnyfL+V5NQ77TQBDXscUp76iaFqqBAaCnpEX+amZH8WN85C
LtT43ieMnpS9UL/kQOCnvW8/BGFEaD4/fNSjmEkyDyZ7c9Qake6ZiV4Ig7lqnHPJ
tDWEu13AGEg/I4Oi3Rp4AzgVG+0D8pt+DYKk1XLbqQ+qGXlg/yYm4oGDpxmKZFcr
StBRamwapag9OCBlt6Ml7hWT2Hf3auDOmG1cRg6jTQJj9+nMb4jqpfhjfD/vXgHf
JkzWmCw+k1I8WKp8ryrJOKMWRYgGgg==
=MBnX
-----END PGP SIGNATURE-----

--Sig_/X_/swfdki+BZTJ8afk_lQqW--
