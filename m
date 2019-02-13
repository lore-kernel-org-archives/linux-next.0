From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 13 Feb 2019 17:49:28 +1100
Message-ID: <20190213174928.18128be0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/46bUxRtCSLx_u3UBCkH3naR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/46bUxRtCSLx_u3UBCkH3naR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  scripts/atomic/check-atomics.sh

between commit:

  4ad119545d78 ("locking/atomics: Check atomic headers with sha1sum")

from the tip tree and patch:

  "scripts/atomic/check-atomics.sh: don't assume that scripts are executabl=
e"

from the akpm tree.

I fixed it up (this latter patch is now needed against the new
scripts/atomic/gen-atomics.sh instead) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/46bUxRtCSLx_u3UBCkH3naR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjvfgACgkQAVBC80lX
0GxhPQf/WZPKKMkkBisXpXhIIF+AQilxcK4XmHrYowxx1ih4uoPYys+Y9eRvfvk4
eXSeyTcUovEWn8BmMKtGNNLSAEa9tdweE1NfPQ5TDRUqW8xTEeKShK9JFLYXoQMd
/GU4DtWNfXVPkC/HWSclSV00G+Gz4Z+zqVbVehkYgs0x4X8lxo4GXUuqO11797Ib
1sZtHKLpmDlXnOOYySDkkRuuTY7sTwmAC4D/Y/m8agSpHXpBxeXGlTVY5XYNMFpF
YGrD5Xk2fGiHyzmcHRyYh2NBF3ukk1SdmR1WQmetcTggnw8IH9W5UNBc6t0qhEVi
MDy1gBe+xlRo4LbsSN9cuIYefIAjxw==
=ZAbZ
-----END PGP SIGNATURE-----

--Sig_/46bUxRtCSLx_u3UBCkH3naR--
