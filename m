Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6131F986;
	Wed,  3 Jun 2026 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513347; cv=none; b=GL0uGWDsNVUtMmVWigL/QRA1ls2rcmRQZJDphmkb8nVV4wgqi14tz+t4aIykkSVvMYNQ7m/zEBmEerJnxeTwnzvZghDTec/r3HN3faWMQ1AWrUshxggsmKRHs1ixIw2C87cYW8Pfx9xL6ub/mf0Hs8KYJd6tMshso/aY3X3Q7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513347; c=relaxed/simple;
	bh=1NLteCByV70T52z29D8fjc/KHpD3C1BzAXLciM66kXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUi4zOFAefni2hvy9kWzPtYZutQ9zK7a8aHKq8SEZndVWniaV/5LrqdN57TMLSq0NQk68KB15eKkbBkuLFBMYsl3wwPlTKbKo+gjsRWFI+mZJqZoX/EKLPsTBGSfKn7aMiyUbLGlqYOztm4zoeBiVRBATuYZ49jrSMACUcxhaV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtbdm0rR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtbdm0rR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9DD1F00893;
	Wed,  3 Jun 2026 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780513346;
	bh=vIEl+LQGKaksPQtk6Vl+xd82kwa4xpIIRmSo1FcZatQ=;
	h=Date:From:To:Cc:Subject;
	b=jtbdm0rRPXsQkmKgybW5dQzpvKrtPetDDfygsS0z9RLIgd4s9JmWIftk0FUsyLSfE
	 45FRyXClEvCrQXgb8iubOi3IU/1JefhE4dpTXIUf+4kaBoHnXxlkFpW2N7EaDlz86S
	 NQrm8O+VCqcSYCWQirpKqnMxYites+QeOdUOo8Cn6CiOP5j8Jmn6aatB0K2adpVJ4e
	 rafv/I+L5aFtjavxZePI4x6j4EjqOiCav4kFQwMHJv53jE5Gh0cgFovwldD6n/Fdg9
	 qi2iy06WDUtBTrdsX/zDqU3ZVlpDcL7cyICdtPEAg17t3GNrE9HsLG9Ilhlo7s3A0r
	 tvNomX2W+XKtw==
Date: Wed, 3 Jun 2026 20:02:22 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Simon Schippers <simon.schippers@tu-dortmund.de>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>
Subject: linux-next: manual merge of the vhost tree with the mm-unstable tree
Message-ID: <aiB6PlZxn19NobF0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DxwRXdyVuBs9VTNA"
Content-Disposition: inline


--DxwRXdyVuBs9VTNA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got conflicts in:

  include/linux/mm.h
  include/linux/ptr_ring.h
  mm/memory.c
  mm/page_alloc.c

between at least commits:

  c0ea52c18c78c ("mm/huge_memory: simplify vma_is_specal_huge()")
  fba362c17d9d9 ("ptr_ring: move free-space check into separate helper")
  aa812f234b6c8 ("mm: memory: flatten alloc_anon_folio() retry loop")

=66rom the mm-unstable tree and commits:

  dd3984b3bce9d ("ptr_ring: disable KCSAN warnings")
  fba362c17d9d9 ("ptr_ring: move free-space check into separate helper")
  f7a2566ae0c03 ("mm: move user page zeroing into the allocator")

=66rom the vhost tree.  I note that the vhost tree does not appear to have
anything from Linus' tree beyond v7.0-rc2, are you sure this is
sensible?

I am really not convinced about my fixups below.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/mm.h
index 485df9c2dbddb,f600c0428aad9..0000000000000
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -5088,6 -4714,25 +5100,9 @@@ long copy_folio_from_user(struct folio=20
  			   const void __user *usr_src,
  			   bool allow_pagefault);
 =20
 -/**
 - * vma_is_special_huge - Are transhuge page-table entries considered spec=
ial?
 - * @vma: Pointer to the struct vm_area_struct to consider
 - *
 - * Whether transhuge page-table entries are considered "special" following
 - * the definition in vm_normal_page().
 - *
 - * Return: true if transhuge page-table entries should be considered spec=
ial,
 - * false otherwise.
 - */
 -static inline bool vma_is_special_huge(const struct vm_area_struct *vma)
 -{
 -	return vma_is_dax(vma) || (vma->vm_file &&
 -				   (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP)));
 -}
 -
+ #else /* !CONFIG_TRANSPARENT_HUGEPAGE && !CONFIG_HUGETLBFS */
+ #define folio_zero_user(folio, addr_hint) \
+ 	clear_user_highpages(&(folio)->page, (addr_hint), folio_nr_pages(folio))
  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_HUGETLBFS */
 =20
  #if MAX_NUMNODES > 1
diff --cc include/linux/ptr_ring.h
index c95e891903f05,d2c3629bbe451..0000000000000
--- a/include/linux/ptr_ring.h
+++ b/include/linux/ptr_ring.h
diff --cc mm/memory.c
index 56be920c56d74,beb6ce312dec6..0000000000000
--- a/mm/memory.c
+++ b/mm/memory.c
diff --cc mm/page_alloc.c
index 81a9d4d1e6c0a,cb72dd6e0efb3..0000000000000
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@@ -90,8 -90,12 +90,14 @@@ typedef int __bitwise fpi_t
  /* Free the page without taking locks. Rely on trylock only. */
  #define FPI_TRYLOCK		((__force fpi_t)BIT(2))
 =20
 +/* free_pages_prepare() has already been called for page(s) being freed. =
*/
 +#define FPI_PREPARED		((__force fpi_t)BIT(3))
+ /*
+  * The page contents are known to be zero (e.g., the host zeroed them
+  * during balloon deflate).  Set PagePrezeroed after free so the next
+  * allocation can skip redundant zeroing.
+  */
 -#define FPI_PREZEROED		((__force fpi_t)BIT(3))
++#define FPI_PREZEROED		((__force fpi_t)BIT(4))
 =20
  /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields =
*/
  static DEFINE_MUTEX(pcp_batch_high_lock);
@@@ -1806,15 -1881,25 +1850,25 @@@ static inline bool should_skip_init(gfp
  	return (flags & __GFP_SKIP_ZERO);
  }
 =20
+=20
  inline void post_alloc_hook(struct page *page, unsigned int order,
- 				gfp_t gfp_flags)
+ 				gfp_t gfp_flags, bool prezeroed,
+ 				unsigned long user_addr)
  {
 +	const bool zero_tags =3D gfp_flags & __GFP_ZEROTAGS;
  	bool init =3D !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
  			!should_skip_init(gfp_flags);
 -	bool zero_tags =3D init && (gfp_flags & __GFP_ZEROTAGS);
  	int i;
 =20
- 	set_page_private(page, 0);
+ 	__ClearPagePrezeroed(page);
+=20
+ 	/*
+ 	 * If the page is pre-zeroed, skip memory initialization.
+ 	 * We still need to handle tag zeroing separately since the host
+ 	 * does not know about memory tags.
+ 	 */
+ 	if (prezeroed && init && !zero_tags)
+ 		init =3D false;
 =20
  	arch_alloc_page(page, order);
  	debug_pagealloc_map_pages(page, 1 << order);
@@@ -3244,15 -3347,9 +3309,16 @@@ struct page *rmqueue_buddy(struct zone=20
  			}
  		}
  		spin_unlock_irqrestore(&zone->lock, flags);
+ 		*prezeroed =3D __page_test_clear_prezeroed(page);
  	} while (check_new_pages(page, order));
 =20
 +	/*
 +	 * If this is a high-order atomic allocation then check
 +	 * if the pageblock should be reserved for the future
 +	 */
 +	if (unlikely(alloc_flags & ALLOC_HIGHATOMIC))
 +		reserve_highatomic_pageblock(page, order, zone);
 +
  	__count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
  	zone_statistics(preferred_zone, zone, 1);
 =20
@@@ -3376,8 -3461,9 +3443,8 @@@ static struct page *rmqueue_pcplist(str
  	 */
  	pcp->free_count >>=3D 1;
  	list =3D &pcp->lists[order_to_pindex(migratetype, order)];
- 	page =3D __rmqueue_pcplist(zone, order, migratetype, alloc_flags, pcp, l=
ist);
 -	page =3D __rmqueue_pcplist(zone, order, migratetype, alloc_flags,
 -				 pcp, list, prezeroed);
 -	pcp_spin_unlock(pcp, UP_flags);
++	page =3D __rmqueue_pcplist(zone, order, migratetype, alloc_flags, pcp, l=
ist, prezeroed);
 +	pcp_spin_unlock(pcp);
  	if (page) {
  		__count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
  		zone_statistics(preferred_zone, zone, 1);
@@@ -3941,10 -4035,19 +4009,12 @@@ check_alloc_wmark
 =20
  try_this_zone:
  		page =3D rmqueue(zonelist_zone(ac->preferred_zoneref), zone, order,
- 				gfp_mask, alloc_flags, ac->migratetype);
+ 					gfp_mask, alloc_flags, ac->migratetype,
+ 					&prezeroed);
  		if (page) {
- 			prep_new_page(page, order, gfp_mask, alloc_flags);
+ 			prep_new_page(page, order, gfp_mask, alloc_flags,
+ 				      prezeroed, ac->user_addr);
 =20
 -			/*
 -			 * If this is a high-order atomic allocation then check
 -			 * if the pageblock should be reserved for the future
 -			 */
 -			if (unlikely(alloc_flags & ALLOC_HIGHATOMIC))
 -				reserve_highatomic_pageblock(page, order, zone);
 -
  			return page;
  		} else {
  			if (cond_accept_memory(zone, order, alloc_flags))

--DxwRXdyVuBs9VTNA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogej0ACgkQJNaLcl1U
h9Cldgf/T3vhesejnkbyBao3XqNjQUs0sjJ014LkjuuPxkOTaFCQj7eNWWuN3WKg
+Zb8x4jzUbqqz88C4LRrb4nA8Z9zZYoNJINgSbA4VZ/YS9osU+RU32EeOkx9XpLk
ZMGN2OHYW44++aAi1w9+seJfZCn+7H7EbyFNrrWSMq/Hv655zTyjNRxEr8HbMLQt
ZkNHHbFq1UmgF4I/WlGH7kT8dNDRf0bETZhsspnXtCC4VorkAkUya19S4HXmeTZt
Gci2NE8ec5L11RN0EeEbALOslfiOVJZLWkm3mjEJIlvqg6ElpDqJNTC5140P9HVY
DYRrU6XmQ3wsZMmw+0dKhr/OJwV4Ug==
=8kEt
-----END PGP SIGNATURE-----

--DxwRXdyVuBs9VTNA--
