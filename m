From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Fri, 11 Jan 2019 13:51:00 +1100
Message-ID: <20190111135100.487a1896@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/37tx.=JDpnn5.I9hB2NQekn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Christopherson <sean.j.christopherson@intel.com>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/37tx.=JDpnn5.I9hB2NQekn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/rmap.c

between commit:

  ba422731316d ("mm/mmu_notifier: mm/rmap.c: Fix a mmu_notifier range bug i=
n try_to_unmap_one")

from Linus' tree and commit:

  f955d5dda846 ("mm/mmu_notifier: contextual information for event triggeri=
ng invalidation v2")

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

diff --cc mm/rmap.c
index 0454ecc29537,62e47f3462cf..000000000000
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@@ -1371,9 -1372,10 +1372,10 @@@ static bool try_to_unmap_one(struct pag
  	 * Note that the page can not be free in this function as call of
  	 * try_to_unmap() must hold a reference on the page.
  	 */
 -	mmu_notifier_range_init(&range, vma->vm_mm, vma->vm_start,
 -				min(vma->vm_end, vma->vm_start +
 +	mmu_notifier_range_init(&range, vma->vm_mm, address,
 +				min(vma->vm_end, address +
- 				    (PAGE_SIZE << compound_order(page))));
+ 				    (PAGE_SIZE << compound_order(page))),
+ 				MMU_NOTIFY_CLEAR);
  	if (PageHuge(page)) {
  		/*
  		 * If sharing is possible, start and end will be adjusted

--Sig_/37tx.=JDpnn5.I9hB2NQekn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw4BJQACgkQAVBC80lX
0GyPlgf/Yh8zBzAujNlUYDUeZ4bR7J1ZUTjd+Oyllguhq+Hb3ABbGXNvfc4EGY0W
aGVgPXLu7p4urRpYo6PITIQQY6YwUjNXWMWdNekXhmpr5i4UKWo+d4l/mSDfVuB+
yu2s47/XUml1oXvtMgasSTmL1svOVWYn+2m2L0jO05l78GYUGZ4UmW3O6d6l572f
ReGhuKHYthtaFEW4pX9gh55gDdTlt6qy76nVcDCWXHn0hn5a3HTC9JX9w5FogLM0
Sf3MVG4dLbGJ1TUDNpcntX6ojAHy4CI52/7PZFSIaOnIHwO66JISXk57pL7mEsV0
AaWfQuUca9sB2Z9qM0GwL+K2NjpiJg==
=yDvH
-----END PGP SIGNATURE-----

--Sig_/37tx.=JDpnn5.I9hB2NQekn--
