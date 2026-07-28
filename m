Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5F6379C38;
	Tue, 28 Jul 2026 16:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256031; cv=none; b=O8NZ6eBZXNS68F5iSjiUhejZrTKMjWnFB9+3mbtfmnyQTikzoIQ2YrVyFgcXGW0kpuOEmZZd7rf98rpGz0hQLQdw9dYTYv7/lsW0p3ZIeldd6a3OlXXdNwQAmDe31E0Hw8ZG7U7Zc0deyZwDZRIfUJhxG51em/c4L2zN5ZvFaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256031; c=relaxed/simple;
	bh=WipnVh67R7+4I0J9zS4FVV40cxtLNiiT87VsvezENr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1xKhxh5PmzyUXqGUNGWdD1/wMCgHYEzWjj3+WnXnbq6oMukb38ePILed8Oj/YtWBfWw6KzdGyDwuQfVWS1c+Gih3jpJL9yGLEHYtFqW6E1rBqs/6lCAAkTlqdTeo6VbMk27XDO6d4j33/dXgrZbE1hQF6UeTltzOnscKA4OhHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afEIR2AY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afEIR2AY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463C21F000E9;
	Tue, 28 Jul 2026 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785256029;
	bh=bFHqUakdwqsmUbK7SpLnjkzpKf1SQpqsA97hdXwd608=;
	h=Date:From:To:Cc:Subject;
	b=afEIR2AY9+7ugj9c9102hk6eQ/oOkE+J4lUHffXLt9rMWE8CDn4ExGX+BkZCBweqw
	 L7/7AFT/GFZxh7DE51po6kFZ5BBWatNvFn0RcTBYaf2lZLBhmpRGb8njwqfh45Ez9f
	 lav8/ZgJTF/VnP7ZuYW4LH8tFFWdKzBr8Fg4PE7ouSUc4zDerHgbOJRRXBuKffz4B2
	 Dpg6IfAJsLtGEx7hq8PYDCu+rNBL+gi46UWGxAmPdoITj79lAWMPTaFm3lF6YNSbrd
	 s6yo2PncDDQfpln80wY8f6K4y3bBg4xmfC3T41s9NCNeTDztkcZRXjCe8XFNR1atIf
	 rgZKRKMFaVVHw==
Date: Tue, 28 Jul 2026 17:27:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: linux-next: manual merge of the liveupdate tree with the mm-unstable
 tree
Message-ID: <amjYWetl6_WVyumg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y/ip9ol29UpFPYmh"
Content-Disposition: inline


--y/ip9ol29UpFPYmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the liveupdate tree got a conflict in:

  mm/hugetlb.c
  mm/mm_init.c

between at least commit:

  7b558c2570017 ("mm/hugetlb: refactor early boot gigantic hugepage allocat=
ion")

=66rom the mm-unstable tree and commit:

  7c967e2d549dc ("memblock: make HugeTLB bootmem allocation work with KHO")
  f476132a8999e ("mm/mm_init: don't rely on memblock to get KHO scratch mig=
ratetype")

=66rom the liveupdate tree.

I stared at the conflict for a bit but with my minimal familiarity with
this code I have absolutely no confidence in my ability to do a working
resolution for this in a timely fashion so instead I merged the version
of liveupdate from next-20260727, I'll have another look tomorrow but
would really appreciate it if someone could help out here.

diff --cc mm/hugetlb.c
index a77c3c1cb8943,ab4afc818e8cb..0000000000000
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@@ -3076,23 -3027,51 +3076,60 @@@ out_end_reservation
 =20
  static __init void *alloc_bootmem(struct hstate *h, int nid, bool node_ex=
act)
  {
 -	struct huge_bootmem_page *m;
 -	int listnode =3D nid;
 -
  	if (hugetlb_early_cma(h))
++<<<<<<< HEAD
 +		return hugetlb_cma_alloc_bootmem(h, nid, node_exact);
 +
 +	if (node_exact)
 +		return memblock_alloc_exact_nid_raw(huge_page_size(h),
 +				huge_page_size(h), 0,
 +				MEMBLOCK_ALLOC_ACCESSIBLE, nid);
 +
 +	return memblock_alloc_try_nid_raw(huge_page_size(h),
 +				huge_page_size(h), 0,
 +				MEMBLOCK_ALLOC_ACCESSIBLE, nid);
++=3D=3D=3D=3D=3D=3D=3D
+ 		m =3D hugetlb_cma_alloc_bootmem(h, &listnode, node_exact);
+ 	else {
+ 		m =3D memblock_alloc_hugetlb(huge_page_size(h), nid, node_exact);
+ 		if (m) {
+ 			m->flags =3D 0;
+ 			m->cma =3D NULL;
+=20
+ 			/*
+ 			 * For pre-HVO to work correctly, pages need to be on
+ 			 * the list for the node they were actually allocated
+ 			 * from. That node may be different in the case of
+ 			 * fallback by memblock_alloc_hugetlb_bootmem. So,
+ 			 * extract the actual node first.
+ 			 */
+ 			if (!node_exact)
+ 				listnode =3D early_pfn_to_nid(PHYS_PFN(__pa(m)));
+ 		}
+ 	}
+=20
+ 	if (m) {
+ 		/*
+ 		 * Use the beginning of the huge page to store the
+ 		 * huge_bootmem_page struct (until gather_bootmem
+ 		 * puts them into the mem_map).
+ 		 *
+ 		 * Put them into a private list first because mem_map
+ 		 * is not up yet.
+ 		 */
+ 		INIT_LIST_HEAD(&m->list);
+ 		list_add(&m->list, &huge_boot_pages[listnode]);
+ 		m->hstate =3D h;
+ 	}
+=20
+ 	return m;
++>>>>>>> liveupdate/next
  }
 =20
 -int alloc_bootmem_huge_page(struct hstate *h, int nid)
 +void *__init arch_alloc_bootmem_huge_page(struct hstate *h, int nid)
  	__attribute__ ((weak, alias("__alloc_bootmem_huge_page")));
 -int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 +void *__init __alloc_bootmem_huge_page(struct hstate *h, int nid)
  {
 -	struct huge_bootmem_page *m =3D NULL; /* initialize for clang */
  	int nr_nodes, node =3D nid;
 =20
  	/* do node specific alloc */
diff --cc mm/mm_init.c
index 18befe5759310,dc20d6814e48b..0000000000000
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@@ -685,7 -681,9 +685,13 @@@ static __meminit void pageblock_migrate
  	const unsigned long end =3D pfn + nr_pages;
 =20
  	for (pfn =3D pageblock_align(pfn); pfn < end; pfn +=3D pageblock_nr_page=
s) {
++<<<<<<< HEAD
 +		init_pageblock_migratetype(pfn_to_page(pfn), migratetype, false);
++=3D=3D=3D=3D=3D=3D=3D
+ 		enum migratetype mt =3D kho_scratch_migratetype(pfn, migratetype);
+=20
+ 		init_pageblock_migratetype(pfn_to_page(pfn), mt, false);
++>>>>>>> liveupdate/next
  		if (!atomic && IS_ALIGNED(pfn, PAGES_PER_SECTION))
  			cond_resched();
  	}
@@@ -1978,7 -1982,7 +1983,11 @@@ static void __init deferred_free_pages(
  	if (!nr_pages)
  		return;
 =20
++<<<<<<< HEAD
 +	pageblock_migratetype_init_range(pfn, nr_pages, mt, true);
++=3D=3D=3D=3D=3D=3D=3D
+ 	pageblock_migratetype_init_range(pfn, nr_pages, MIGRATE_MOVABLE, true);
++>>>>>>> liveupdate/next
 =20
  	page =3D pfn_to_page(pfn);
 =20
@@@ -2682,8 -2683,7 +2689,12 @@@ void __init __weak mem_init(void
 =20
  void __init mm_core_init_early(void)
  {
++<<<<<<< HEAD
 +	free_area_init();
 +
++=3D=3D=3D=3D=3D=3D=3D
+ 	kho_memory_init_early();
++>>>>>>> liveupdate/next
  	hugetlb_cma_reserve();
  	hugetlb_bootmem_alloc();

--y/ip9ol29UpFPYmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo2FkACgkQJNaLcl1U
h9BsFQgAgsyqkUVsiampkZyRQvNRTSe3sXF5A6nJczmkMHFhHFHGGuQznnA2JR+5
Rq+ip5CRQ/rs0aw9BC/UEVV1WmQLFrgJU366izBuOptZcsdkfdGrGyLZ44BU1+0/
dR/8EWmKbWKiJnkAea5Y2JJuoVZ5EnOyUmxEuy4I/R/7xL1IY492JWky5G13Mqv+
3ttAa5Ga+9jsEqJ4ZY4xCqhNXa9w06pWiIjlwN1jsCrGw5AYvEQqb9OOnPjnPp5B
cGJS5LDnNBYMMcTz9sUoGzF6qf3X95dyx5c348uwOilINNJMYbp8Z1mZ1xjW+9Tr
Lnr/bRpp1k7Nf/hTJk6+0f6tSJHZHQ==
=Lav/
-----END PGP SIGNATURE-----

--y/ip9ol29UpFPYmh--
