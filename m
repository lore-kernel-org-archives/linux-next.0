From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the tip tree
Date: Thu, 15 Mar 2018 19:06:06 +1100
Message-ID: <20180315190606.27ce1f4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_vnPT/XHZkwvJNm+Q9XcCCF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_vnPT/XHZkwvJNm+Q9XcCCF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got a conflict in:

  arch/x86/mm/init_64.c

between commit:

  91f606a8fa68 ("x86/mm: Replace compile-time checks for 5-level paging wit=
h runtime-time checks")

from the tip tree and commit:

  a7e6c7015bf3 ("x86, memremap: fix altmap accounting at free")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/mm/init_64.c
index 9bbc51ae54a6,af11a2890235..000000000000
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@@ -1099,8 -1089,8 +1095,8 @@@ remove_p4d_table(p4d_t *p4d_start, unsi
  		 * 5-level case we should free them. This code will have to change
  		 * to adapt for boot-time switching between 4 and 5 level page tables.
  		 */
 -		if (CONFIG_PGTABLE_LEVELS =3D=3D 5)
 +		if (pgtable_l5_enabled)
- 			free_pud_table(pud_base, p4d, altmap);
+ 			free_pud_table(pud_base, p4d);
  	}
 =20
  	if (direct)

--Sig_/_vnPT/XHZkwvJNm+Q9XcCCF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqqKW4ACgkQAVBC80lX
0Gz+iQgAi0jowIjNC+CKNgjBdEIcE0nUpLAynjOX+FauGP03BzvfsOIimBRBvXIy
b5Frvgbpz/AFsob0nDOeLKYPgS8CN7+4Ci/NeFUERLQupWcXTC3qa1lSG7/iz+4X
S5Tk+NAeM1FuA3Uwn4KKORy1q/GprSsMsglB1/p6LSO763jcwWPkzTyl99APHf4f
7dd/1RWEBZy5ARMC0u1s/YdtqPBLu2gmFJYKe4aMsDYxMTt6orFN/vr9Yz6/V4vD
S00dLxLSY+x13mXOOyY3hQ7Lq7shBkXPKmBh7vStwSqoZE3esDQBcM72qxMeAuxo
ue7DOQeQQWpUqLCmCnXNU1Kwg+ueOA==
=mCbu
-----END PGP SIGNATURE-----

--Sig_/_vnPT/XHZkwvJNm+Q9XcCCF--
