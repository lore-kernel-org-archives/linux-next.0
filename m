From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the xarray
 tree
Date: Tue, 2 Oct 2018 17:27:21 +1000
Message-ID: <20181002172721.03cdde07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LnQj7meKz4IQTVXZ5Msa8Fg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, zhong jiang <zhongjiang@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/LnQj7meKz4IQTVXZ5Msa8Fg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/radix-tree.h

between commit:

  be18dc56ed20 ("xarray: Define struct xa_node")

from the xarray tree and commit:

  e4618700a039 ("include/linux/radix-tree.h: use DIV_ROUND_UP instead of re=
implementing its function")

from the akpm-current tree.

I fixed it up (I just used ther former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/LnQj7meKz4IQTVXZ5Msa8Fg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzHdkACgkQAVBC80lX
0GxaGwf/ZUxDOfpjqrqU96V1xONo/ok/wDY20Ousdm7h6TdRLN9zlbkDNJgIwtKf
BZ46dmoS1wGSIq7k4SSDcqZUMKmwUz5TDAksW1gMngLrYUb5XjEkpBwOoN26k0nM
FsCDBO2IMfefFHzNqluQ6FSTzEpD7LYlhX2jT77jzSLunq58n4L7FOkIEdWPtd70
n2OcDwjgJwbjWQ9EihOWYsjsW+ZNNaYtxIlgkBW25h3IwynjM1mUi71iCYcbIds0
5Gvbo7iAX7f9DIdxtasGcU5soRuCKlGOBstgTApHoys4brwH74QvUnGK/N69bHq5
hADAketrv1eWJfTiwJudnhRplAMREw==
=iQno
-----END PGP SIGNATURE-----

--Sig_/LnQj7meKz4IQTVXZ5Msa8Fg--
