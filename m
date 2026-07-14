Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FA372B58;
	Tue, 14 Jul 2026 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029683; cv=none; b=fEPf3XoCoIMvPu/3dkdyCRbfkCDMegjiXABjQscfaGsDe6y6SBLhry3eK7xcpHmV7/tIE9Oo8iLhTsguw2pHcHsFYK8RWtu152wJhc3xDbcaC+sNH40NDkJcIl0V5ChQWjqX93XZKYeYD0nwOSz9yFXpJvPFgh1UGrdjBDNPxh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029683; c=relaxed/simple;
	bh=xn+R/y0JmOpVNPxP0obPii1IZhdEr6e41ZuJZGBYluA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGV3VYEt+7Gfz2QysGaRqzxy46CvzTRuuGThC/4OqrOWVbvFDPNDJ9HyyVjAcS0H3mKJPBEXXzw9C6786gjloSY7zUOZSth7VMhCxbrPEhQKrJdyrpUsJJQWhwu1q6Ocgbi5Vsr3uVoMWD4VLF6p+Si9K50+LCEfoHeHx8msE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTHlu++D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTHlu++D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01B61F00A3A;
	Tue, 14 Jul 2026 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784029682;
	bh=JZfo8kOksv91lCAwDmR1gBlLsnLzRquGI6I0g3rccSQ=;
	h=Date:From:To:Cc:Subject;
	b=OTHlu++Dg19xPrdryD/Qg5h6KDiiOuCAsogAK6offoQqCdGZLd9Jc3Pu5WSrrGmyy
	 tFuYIrKwHuvO39gRvJfPPMRfcb6bGxFJWTL5cAmKGUPRVme+bGUXxy9Scw0BMLiWBa
	 nSJX4b1c+97yqGISritccuD4OFx4wAnn39Y95wwWvYDhDI7wJeGGsQgN4DQMaIkxVV
	 5EQd36Gx/Ng1k2ywckslxWcahhcUJkdb+HB8SOjbtUbctF+A3HgJANlln0PrJUNVRt
	 SC6Qm57Dei6n3ViqxjMchFSc1b1mHaLp/0sHm6zpZTUXxZ/7N4pc5skQn7V9dCJ388
	 RHPU8zNPuXO1A==
Date: Tue, 14 Jul 2026 12:47:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 risc-v-fixes tree
Message-ID: <alYh7S9n9qE8-Hc_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dCdGraLgyJjaZZVp"
Content-Disposition: inline


--dCdGraLgyJjaZZVp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  mm/sparse-vmemmap.c

between commit:

  4edd70ee6a7d0 ("mm/sparse-vmemmap: flush_cache_vmap() after hotplugging v=
memmap")

=66rom the risc-v-fixes tree and commit:

  7605044cea4d2 ("riscv: mm: avoid spurious fault after hotplugging vmemmap=
")

=66rom the mm-nonmm-unstable tree.  These appear to be two versions of the
same fix, it looks like one needs to be chosen - I did the conflict
resolution picking based on taste but left the non-conflicting bits of
both changes.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined mm/sparse-vmemmap.c
index 5a2469fb1838c,290cafcfd7230..0000000000000
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@@ -41,8 -41,6 +41,8 @@@
  #define VMEMMAP_POPULATE_PAGEREF	0x0001
 =20
  #include "internal.h"
 +#include "mm_init.h"
 +#include "sparse.h"
 =20
  /*
   * Allocate a block of memory to be used to back the virtual memory map
@@@ -344,8 -342,8 +344,8 @@@ static __meminit struct page *vmemmap_g
  	 *
  	 * Any initialization done here will be overwritten by memmap_init().
  	 *
 -	 * hugetlb_vmemmap_init() will take care of initialization after
 -	 * memmap_init().
 +	 * hugetlb_bootmem_struct_page_init() will take care of initialization
 +	 * after memmap_init().
  	 */
 =20
  	p =3D vmemmap_alloc_block_zero(PAGE_SIZE, node);
@@@ -546,6 -544,12 +546,12 @@@ static int __meminit vmemmap_populate_c
 =20
  #endif
 =20
+ #ifndef vmemmap_populate_finalize
+ static void __meminit vmemmap_populate_finalize(void)
+ {
+ }
+ #endif
+=20
  struct page * __meminit __populate_section_memmap(unsigned long pfn,
  		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
  		struct dev_pagemap *pgmap)
@@@ -566,7 -570,7 +572,7 @@@
  	if (r < 0)
  		return NULL;
 =20
- 	flush_cache_vmap(start, end);
+ 	vmemmap_populate_finalize();
 =20
  	return pfn_to_page(pfn);
  }
@@@ -583,6 -587,17 +589,6 @@@ void __init sparse_vmemmap_init_nid_ear
  {
  	hugetlb_vmemmap_init_early(nid);
  }
 -
 -/*
 - * This is called just before the initialization of page structures
 - * through memmap_init. Zones are now initialized, so any work that
 - * needs to be done that needs zone information can be done from
 - * here.
 - */
 -void __init sparse_vmemmap_init_nid_late(int nid)
 -{
 -	hugetlb_vmemmap_init_late(nid);
 -}
  #endif
 =20
  static void subsection_mask_set(unsigned long *map, unsigned long pfn,
@@@ -594,7 -609,7 +600,7 @@@
  	bitmap_set(map, idx, end - idx + 1);
  }
 =20
 -void __init sparse_init_subsection_map(unsigned long pfn, unsigned long n=
r_pages)
 +static void __init sparse_init_subsection_map_range(unsigned long pfn, un=
signed long nr_pages)
  {
  	int end_sec_nr =3D pfn_to_section_nr(pfn + nr_pages - 1);
  	unsigned long nr, start_sec_nr =3D pfn_to_section_nr(pfn);
@@@ -617,15 -632,6 +623,15 @@@
  	}
  }
 =20
 +void __init sparse_init_subsection_map(void)
 +{
 +	int i, nid;
 +	unsigned long start, end;
 +
 +	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid)
 +		sparse_init_subsection_map_range(start, end - start);
 +}
 +
  #ifdef CONFIG_MEMORY_HOTPLUG
 =20
  /* Mark all memory sections within the pfn range as online */

--dCdGraLgyJjaZZVp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWIe0ACgkQJNaLcl1U
h9DhJAf/QCz+KicFiZpDpx2sxmh0uGutpwzQ2T75q1O7HrL7rejmpOfRTdX5OlUE
WmU5UJJjyp5IMWcRF++O6Q3v1aN/0Y85yNF8XFpSmmBm0f5Q9MRkGgiGwnKsFOho
Xk0VLFiknBwdwplySv/tcMve4v/1o8fAaQtYZWAnWs6jVS4g+RhbXlEyfift1tkn
cuKUgVIGi6TYKbBkXSLKSQ5eRu6fzPqnkQ038iTamxoCwsTgFypSJIaqZ42IASNl
cfEPcpNjZ1+BWjeWbJhkZuw/Ra/GW9Y3Y6ZSKCdoiMw9EAzpLqoUfOFvhddTjUD2
VWy1tVFz62X+nkRwm18Ozg+eB0gr5A==
=lDx2
-----END PGP SIGNATURE-----

--dCdGraLgyJjaZZVp--
