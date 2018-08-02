From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xarray tree with the ext4 tree
Date: Thu, 2 Aug 2018 17:48:55 +1000
Message-ID: <20180802174855.4edeba34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/77PPRZipcHuIHOFwjMzZXOK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ross Zwisler <ross.zwisler@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/77PPRZipcHuIHOFwjMzZXOK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xarray tree got a conflict in:

  fs/dax.c

between commit:

  cdbf8897cb09 ("dax: dax_layout_busy_page() warn on !exceptional")

from the ext4 tree and commits:

  49520d317715 ("xarray: Replace exceptional entries")
  cc9f1fb1672f ("dax: Convert dax_layout_busy_page to XArray")

from the xarray tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/dax.c
index f32d7125ad0f,1914e4e24615..000000000000
--- a/fs/dax.c
+++ b/fs/dax.c
@@@ -662,44 -556,26 +556,26 @@@ struct page *dax_layout_busy_page(struc
  	 */
  	unmap_mapping_range(mapping, 0, 0, 1);
 =20
- 	while (index < end && pagevec_lookup_entries(&pvec, mapping, index,
- 				min(end - index, (pgoff_t)PAGEVEC_SIZE),
- 				indices)) {
- 		for (i =3D 0; i < pagevec_count(&pvec); i++) {
- 			struct page *pvec_ent =3D pvec.pages[i];
- 			void *entry;
-=20
- 			index =3D indices[i];
- 			if (index >=3D end)
- 				break;
-=20
- 			if (WARN_ON_ONCE(
- 			     !radix_tree_exceptional_entry(pvec_ent)))
- 				continue;
-=20
- 			xa_lock_irq(&mapping->i_pages);
- 			entry =3D get_unlocked_mapping_entry(mapping, index, NULL);
- 			if (entry)
- 				page =3D dax_busy_page(entry);
- 			put_unlocked_mapping_entry(mapping, index, entry);
- 			xa_unlock_irq(&mapping->i_pages);
- 			if (page)
- 				break;
- 		}
-=20
- 		/*
- 		 * We don't expect normal struct page entries to exist in our
- 		 * tree, but we keep these pagevec calls so that this code is
- 		 * consistent with the common pattern for handling pagevecs
- 		 * throughout the kernel.
- 		 */
- 		pagevec_remove_exceptionals(&pvec);
- 		pagevec_release(&pvec);
- 		index++;
-=20
+ 	xas_lock_irq(&xas);
+ 	xas_for_each(&xas, entry, ULONG_MAX) {
 -		if (!xa_is_value(entry))
++		if (WARN_ON_ONCE(!xa_is_value(entry)))
+ 			continue;
+ 		if (unlikely(dax_is_locked(entry)))
+ 			entry =3D get_unlocked_entry(&xas);
+ 		if (entry)
+ 			page =3D dax_busy_page(entry);
+ 		put_unlocked_entry(&xas, entry);
  		if (page)
  			break;
+ 		if (++scanned % XA_CHECK_SCHED)
+ 			continue;
+=20
+ 		xas_pause(&xas);
+ 		xas_unlock_irq(&xas);
+ 		cond_resched();
+ 		xas_lock_irq(&xas);
  	}
+ 	xas_unlock_irq(&xas);
  	return page;
  }
  EXPORT_SYMBOL_GPL(dax_layout_busy_page);

--Sig_/77PPRZipcHuIHOFwjMzZXOK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltit2cACgkQAVBC80lX
0GzQzQf7BdM89FtI6KLmCbbykC8IWxt4zP3u4pxz0ErdgZ4cpQF6/TiLHpOfTBFt
XTT7HRkRuZG35zJ9zbUE00J7IaMFZ3/TBZBXrHly3KDCnMahrefFgJLKEZwbKwcU
y9lTwroGav8WNqPfrW/2rdaDFB4ewlXPQJ9AIy+Udx1xwahnmHF7lpJMB1wR0ofJ
SiSb6dzFak/BzRCp1mjex7uI1F8hGEFNzV+jXEs3sQ4a2yAreLp+4bE7BX8CsXb1
8+Xy+hQyxqVG/EI4aUNhRARHpeeIMNi66hDHen6G4XL1PSK+N5dMlGzdT9kkwZUa
o04GXBZx3VbTF+ic9qt5i4d4ItFqlg==
=/wi1
-----END PGP SIGNATURE-----

--Sig_/77PPRZipcHuIHOFwjMzZXOK--
