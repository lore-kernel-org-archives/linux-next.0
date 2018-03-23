From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 23 Mar 2018 16:59:26 +1100
Message-ID: <20180323165926.2c24fe1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UnUKL2HpCovp0Fwrtkh0y7Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gang He <ghe@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/UnUKL2HpCovp0Fwrtkh0y7Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/ocfs2/filecheck.c

between commit:

  e24e960c7fe2 ("sched/wait, fs/ocfs2: Convert wait_on_atomic_t() usage to =
the new wait_var_event() API")

from the tip tree and commit:

  5a5b76d17dc4 ("ocfs2: add kobject for online file check")

from the akpm-current tree.

I fixed it up (the latter removed the code updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/UnUKL2HpCovp0Fwrtkh0y7Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlq0l74ACgkQAVBC80lX
0GzXxQf/bfMBLFj/qUb++egG1hYpqEVMevXa2b3x3iCRdzLyo0Z1PXJNfNhcqYJs
cDnHuUDpVkFhyGDhr8wMKS20QWY+pwe+rC/+nM0tvtnm8iMKWSBsWTyJ2xmrUc2g
saV1j0l1RTvriwPoYE3xFOKs90QTYivQqdsUlDBEXbX5y6VQ5LCm1pje7xuQQw9z
FxivVE7cU+5rvjQf/y6m+7g2v8icij3FLpH7vmI80y58VWxuXUcFG9+UmMzSRzl2
kLmB38+Pv+gzUZ9cupIJ25LQcxhdmk/UjqLPR/yq/fy7Wvun9dl6jyatuSRRjDg4
BGao1NsS7GrrQsQg/e/cXr2zwcN++Q==
=AXru
-----END PGP SIGNATURE-----

--Sig_/UnUKL2HpCovp0Fwrtkh0y7Q--
