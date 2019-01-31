From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Thu, 31 Jan 2019 15:31:56 +1100
Message-ID: <20190131153156.0a26ebda@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uV77eKg_jxRiBeGkLI2d+7k"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/uV77eKg_jxRiBeGkLI2d+7k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/sched.h

between commit:

  15917dc02841 ("sched: Remove stale PF_MUTEX_TESTER bit")

from the tip tree and commit:

  ca299cb98649 ("mm/cma: add PF flag to force non cma alloc")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/sched.h
index bb68abafac29,1ef3995b7564..000000000000
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@@ -1409,6 -1423,8 +1423,7 @@@ extern struct pid *cad_pid
  #define PF_UMH			0x02000000	/* I'm an Usermodehelper process */
  #define PF_NO_SETAFFINITY	0x04000000	/* Userland is not allowed to meddle=
 with cpus_allowed */
  #define PF_MCE_EARLY		0x08000000      /* Early kill for mce process polic=
y */
+ #define PF_MEMALLOC_NOCMA	0x10000000	/* All allocation request will have =
_GFP_MOVABLE cleared */
 -#define PF_MUTEX_TESTER		0x20000000	/* Thread belongs to the rt mutex tes=
ter */
  #define PF_FREEZER_SKIP		0x40000000	/* Freezer should not count it as fre=
ezable */
  #define PF_SUSPEND_TASK		0x80000000      /* This thread called freeze_pro=
cesses() and should not be frozen */
 =20

--Sig_/uV77eKg_jxRiBeGkLI2d+7k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSejwACgkQAVBC80lX
0GzOoAf+KDBwyeSs/d8iF/S41DQNfnvzywvMh8u5753oJcadOiYq1C6rTPok5Ifz
V6S6t0/BczKL0+uzTQhi1nrXvtp07zNq3qZ7+Nl0HVu7LDqoItlLnoURv7rB3YiD
LukcRQSHosFYCs3cgPp9368CXiQEQPjoa5sPbtzyOBl91jyeXA/tWS+2/QSW0UOG
Q1Hpqj6bRl2MZEJ2kflbx3bz+/sjFChG5Ok9uYJ/CJJrECzESNVkp7EtmatLbrCw
mf97z0wp9pEwHJyB1frquvreucWU8YryFg7SFmfiewRez59xzXeJ0cIygy9UXR78
5iKuynV256girUI2zqmjpCWvi3Obgw==
=kQ70
-----END PGP SIGNATURE-----

--Sig_/uV77eKg_jxRiBeGkLI2d+7k--
