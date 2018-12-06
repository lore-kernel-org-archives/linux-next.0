From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 btrfs-kdave tree
Date: Thu, 6 Dec 2018 18:29:38 +1100
Message-ID: <20181206182938.3b153d04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Iv7HK=v6yOLt0qJmRnJoNSC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, David Sterba <dsterba@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Iv7HK=v6yOLt0qJmRnJoNSC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/btrfs/extent_io.c

between commit:

  e42c38c80535 ("btrfs: Refactor main loop in extent_readpages")

from the btrfs-kdave tree and commit:

  "fs: don't open code lru_to_page()"

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

diff --cc fs/btrfs/extent_io.c
index 5104714212b4,3707c95a6598..000000000000
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -4103,24 -4103,28 +4103,24 @@@ int extent_readpages(struct address_spa
  	int nr =3D 0;
  	u64 prev_em_start =3D (u64)-1;
 =20
 -	for (page_idx =3D 0; page_idx < nr_pages; page_idx++) {
 -		page =3D lru_to_page(pages);
 +	while (!list_empty(pages)) {
 +		for (nr =3D 0; nr < BTRFS_PAGES_BATCH && !list_empty(pages);) {
- 			struct page *page =3D list_entry(pages->prev, struct page, lru);
++			struct page *page =3D lru_to_page(pages);
 =20
 -		prefetchw(&page->flags);
 -		list_del(&page->lru);
 -		if (add_to_page_cache_lru(page, mapping,
 -					page->index,
 -					readahead_gfp_mask(mapping))) {
 -			put_page(page);
 -			continue;
 +			prefetchw(&page->flags);
 +			list_del(&page->lru);
 +			if (add_to_page_cache_lru(page, mapping, page->index,
 +						readahead_gfp_mask(mapping))) {
 +				put_page(page);
 +				continue;
 +			}
 +
 +			pagepool[nr++] =3D page;
  		}
 =20
 -		pagepool[nr++] =3D page;
 -		if (nr < ARRAY_SIZE(pagepool))
 -			continue;
  		__extent_readpages(tree, pagepool, nr, &em_cached, &bio,
 -				&bio_flags, &prev_em_start);
 -		nr =3D 0;
 +				   &bio_flags, &prev_em_start);
  	}
 -	if (nr)
 -		__extent_readpages(tree, pagepool, nr, &em_cached, &bio,
 -				&bio_flags, &prev_em_start);
 =20
  	if (em_cached)
  		free_extent_map(em_cached);

--Sig_/Iv7HK=v6yOLt0qJmRnJoNSC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwIz+IACgkQAVBC80lX
0GwhEQf8CcgSw40AqORCOSFn30nqJIiClLVz6z3OFB9XgB0+gCKFf6OJOT+jxRPB
tHBKV5/SuaKqYb4MRVtbrtPlnLqmMFwSGMWWqhKWVRHLOW/D/jAdJcpojF6AWkq+
Lfm7N2+rdYfFhcCU5LHaudjUIW2OE3O4magQcud5zDjQQOVqKMjH5q+uZMPVQxGu
wexMEL8WCUMzfo3aMfoD4go/pwL3NQx9MO2kE2SHzTIIgQLnL+TBAL3Ekpknc2ho
ME/gN760CHv/kZjVsmls2ZzgC5yZ4T2jpmCSKHH2m2NX+ULiw+IdDiYx1VgRPzkj
GZzdEw0GIQpXHeUFNm0GYFAurixtpg==
=yC2B
-----END PGP SIGNATURE-----

--Sig_/Iv7HK=v6yOLt0qJmRnJoNSC--
