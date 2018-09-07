From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the tip tree
Date: Fri, 7 Sep 2018 13:05:33 +1000
Message-ID: <20180907130533.03ba3119@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ChvU3MaG=OK88FENH1qaAfo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jann Horn <jannh@google.com>, Alexander Popov <alex.popov@linux.com>, Tycho Andersen <tycho@tycho.ws>
List-Id: linux-next.vger.kernel.org

--Sig_/ChvU3MaG=OK88FENH1qaAfo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  drivers/misc/lkdtm/core.c

between commit:

  bef459026b16 ("lkdtm: Test copy_to_user() on bad kernel pointer under KER=
NEL_DS")

from the tip tree and commit:

  f90d1e0c7804 ("lkdtm: Add a test for STACKLEAK")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/lkdtm/core.c
index 5a755590d3dc,aca26d81e9b8..000000000000
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@@ -183,7 -183,7 +183,8 @@@ static const struct crashtype crashtype
  	CRASHTYPE(USERCOPY_STACK_FRAME_FROM),
  	CRASHTYPE(USERCOPY_STACK_BEYOND),
  	CRASHTYPE(USERCOPY_KERNEL),
 +	CRASHTYPE(USERCOPY_KERNEL_DS),
+ 	CRASHTYPE(STACKLEAK_ERASING),
  };
 =20
 =20

--Sig_/ChvU3MaG=OK88FENH1qaAfo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluR6v0ACgkQAVBC80lX
0GwklAf/eZ1gx5K7IRC8oX8WYl4rP1kN6Y+2thbamwW0mfuQMzwlPlYrU6dgSFbG
jXQdqt2NhZ3q9h/jnpQhJD0HbPm8rQa18Ir298iqfwN8qP+K5H/Yoj7g0gQmYnVM
KKTu23JDZMMrpSKAl2RzF92o0cHoSkPhz0EzZksmuwqXPkvX0VuW8s0VBOi5eS3W
xwXy8my1g245KYcun5pCDI/uqlKXKYnwjMRYepEkML0jsgw3x+GwslDNkuEE9kZz
g0S4KL0nKmWBWdPFKMqohAv50YieFS+IcI9P5gA7CFHBcm5SBz/rFQDoWW6P+nss
SA85stTSGWnljxSgFR3ylPaDw59r8g==
=dNGN
-----END PGP SIGNATURE-----

--Sig_/ChvU3MaG=OK88FENH1qaAfo--
