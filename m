Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786939021E;
	Tue, 28 Jul 2026 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260342; cv=none; b=TESZHKLJoZMl6GeecNiuFtLrniS/lSXgZdWYy6re4/tX1y4KjBavG3pCKtTBy2+sOTnZzNtbYc4bby78lh4et1rQ7d5Ovtw6CN5WHVEvytqmShvnmlZ+j1VwyQZtFeZNNFBy1EXiAb1G9fqgKs9zqbkvz4BQeoQ8nBqzbqJ7Ll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260342; c=relaxed/simple;
	bh=oFabc/LYcEj0pGNlK8IWB0WE0l4CoDuX+Z5kE5GKpMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6tTE8ml6UZdLSbTEF+dTne/EfP8Ec2/Jf3xnLdWHRK4+tFSChD10tuluzBkkMl037tXUQnfktL5JIpbIIJPM3gvhOcFMjRewIAyhIZ/ti3R5yl8DfmWJoT6poy2xisXU+hhfBovRG1neeGQ8p7+TaXgjdGPTQw2r05L8zKy6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoiAWTm6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoiAWTm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A201F00A3A;
	Tue, 28 Jul 2026 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785260340;
	bh=2FcXUn1Af3n12QMugKSG/9avzLBWionOZvy+8+Yif6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UoiAWTm6KxT+Yw5DQusMMiwdr03MGIx6eCrh/O1K78tORNU5rR57TvmOHocoBwxZQ
	 qleaCXPyXJgyFIc1HbLBRg5xaGFaf+p/phPXgqqvV4Vefzs41tAm2tvEqHvwurauu/
	 /2a2OJcIhozYGPNNcLkJGxQqQf9UktDCG63w77hs3pOYvAEvKC8K3AMCIttukzgfww
	 E1AN466Gm2AxrBWoIRTUV5ps25iCDhwOLGZuy3CpyKfbjXKh8oh0U8GQVlE/YWTzl3
	 m4vCj8MIIUsjkmUuHMJ7rIMZdkmpxSBUMrNmYtCU/H+vTTWgMT1NLe29qE+mmpANV9
	 rltGZxpblOBuQ==
Date: Tue, 28 Jul 2026 20:38:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 mm-unstable tree
Message-ID: <amjpLoJbHsqIAqJO@kernel.org>
References: <amjYWetl6_WVyumg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjYWetl6_WVyumg@sirena.org.uk>

On Tue, Jul 28, 2026 at 05:27:05PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the liveupdate tree got a conflict in:
> 
>   mm/hugetlb.c
>   mm/mm_init.c
> 
> between at least commit:
> 
>   7b558c2570017 ("mm/hugetlb: refactor early boot gigantic hugepage allocation")
> 
> from the mm-unstable tree and commit:
> 
>   7c967e2d549dc ("memblock: make HugeTLB bootmem allocation work with KHO")
>   f476132a8999e ("mm/mm_init: don't rely on memblock to get KHO scratch migratetype")
> 
> from the liveupdate tree.
> 
> I stared at the conflict for a bit but with my minimal familiarity with
> this code I have absolutely no confidence in my ability to do a working
> resolution for this in a timely fashion so instead I merged the version
> of liveupdate from next-20260727, I'll have another look tomorrow but
> would really appreciate it if someone could help out here.

I've got this for merging mm-unstable into liveupdate/next:

diff --cc mm/hugetlb.c
index ab4afc818e8cb,a77c3c1cb8943..0000000000000
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@@ -3027,51 -3076,23 +3076,16 @@@ out_end_reservation
  
  static __init void *alloc_bootmem(struct hstate *h, int nid, bool node_exact)
  {
- 	struct huge_bootmem_page *m;
- 	int listnode = nid;
- 
  	if (hugetlb_early_cma(h))
- 		m = hugetlb_cma_alloc_bootmem(h, &listnode, node_exact);
- 	else {
- 		m = memblock_alloc_hugetlb(huge_page_size(h), nid, node_exact);
- 		if (m) {
- 			m->flags = 0;
- 			m->cma = NULL;
+ 		return hugetlb_cma_alloc_bootmem(h, nid, node_exact);
  
- 			/*
- 			 * For pre-HVO to work correctly, pages need to be on
- 			 * the list for the node they were actually allocated
- 			 * from. That node may be different in the case of
- 			 * fallback by memblock_alloc_hugetlb_bootmem. So,
- 			 * extract the actual node first.
- 			 */
- 			if (!node_exact)
- 				listnode = early_pfn_to_nid(PHYS_PFN(__pa(m)));
- 		}
- 	}
- 
- 	if (m) {
- 		/*
- 		 * Use the beginning of the huge page to store the
- 		 * huge_bootmem_page struct (until gather_bootmem
- 		 * puts them into the mem_map).
- 		 *
- 		 * Put them into a private list first because mem_map
- 		 * is not up yet.
- 		 */
- 		INIT_LIST_HEAD(&m->list);
- 		list_add(&m->list, &huge_boot_pages[listnode]);
- 		m->hstate = h;
- 	}
 -	if (node_exact)
 -		return memblock_alloc_exact_nid_raw(huge_page_size(h),
 -				huge_page_size(h), 0,
 -				MEMBLOCK_ALLOC_ACCESSIBLE, nid);
--
- 	return m;
 -	return memblock_alloc_try_nid_raw(huge_page_size(h),
 -				huge_page_size(h), 0,
 -				MEMBLOCK_ALLOC_ACCESSIBLE, nid);
++	return memblock_alloc_hugetlb(huge_page_size(h), nid, node_exact);
  }
  
- int alloc_bootmem_huge_page(struct hstate *h, int nid)
+ void *__init arch_alloc_bootmem_huge_page(struct hstate *h, int nid)
  	__attribute__ ((weak, alias("__alloc_bootmem_huge_page")));
- int __alloc_bootmem_huge_page(struct hstate *h, int nid)
+ void *__init __alloc_bootmem_huge_page(struct hstate *h, int nid)
  {
- 	struct huge_bootmem_page *m = NULL; /* initialize for clang */
  	int nr_nodes, node = nid;
  
  	/* do node specific alloc */
diff --cc mm/mm_init.c
index dc20d6814e48b,711f821f7b3c7..0000000000000
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@@ -2683,7 -2683,8 +2682,9 @@@ void __init __weak mem_init(void
  
  void __init mm_core_init_early(void)
  {
 +	kho_memory_init_early();
+ 	free_area_init();
+ 
  	hugetlb_cma_reserve();
  	hugetlb_bootmem_alloc();



-- 
Sincerely yours,
Mike.
