Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09BC3BCD15
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550599; cv=none; b=mUFoZPU8i/5uJRnLtq+jzsY+OzDCTWAd1ehe7F+4snkAWeuTm5p+nMHYiLW+CqMkVjeoRj9r4l/PMRvirg0/nrPDQRNX16CC8hVNhVvqgLgIHt5dMQ9pGS7R94EUOnbg347omTFU8IMr8a8GpxOC94z+7Wdrrncsf9NkDwV5GTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550599; c=relaxed/simple;
	bh=nl46Ar9bhUwnH5fjEtRmAXo8yrkLFQjmrNNNQhBwioY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isvcPrqN62ZND0EthE5SFpgYxuVw67ZQZIubkgTzNL5dXu/EKudLv1I3jAQLSQwExn/UanjlK+vwOgflc1lJJlvXk00TBtsqpyqyMu5RDoowmpES/2iSMfzpoIFK8QZd/WiB/TtfB3Fd04cPLODIf0syc1gUW03cX+/pqvBi2oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TFoC3uG/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RVXhOdAL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TFoC3uG/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RVXhOdAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780550596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEwXEslPaqIe4nLA6/yUFLJfeGLG+7//kLoNGv1IS5Q=;
	b=TFoC3uG/1l+jSy4qctWESY+PtZqMUxdQhIEiv9moF5E9GWoY0n/ru5U3pGQZmfeUMatlGv
	m1AZY9j93msM3IEOlF04aihKXYiK3ObQpE2D0M9lLPXaVPbF4X7t5TP4J2IqvIiEnkBfZx
	7pzCrIc5Jcd8b/L7XXxzp6iH02utDdI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-MzzRrm3QPWqqLHRGzwLMkw-1; Thu, 04 Jun 2026 01:23:15 -0400
X-MC-Unique: MzzRrm3QPWqqLHRGzwLMkw-1
X-Mimecast-MFC-AGG-ID: MzzRrm3QPWqqLHRGzwLMkw_1780550594
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45ef616db45so171448f8f.2
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2026 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780550594; x=1781155394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eEwXEslPaqIe4nLA6/yUFLJfeGLG+7//kLoNGv1IS5Q=;
        b=RVXhOdALsHnHD5UNb8F2M0PFvSq37jxAbhjYH26/cs5Vrwr07qYpQI5Efee1QXUAHa
         4+LJl8u9GUnawSMciQF6bOSCA1LSR+mDyvT9IjKDF9MPlC5mTuXbAp4DsJFR723VJwJA
         uI94WRb1xVIaveruMzaX4NAVijIL5xXOFhjtyp0xcfoOYa/lMCKs+62WiSPRMvN2K0Mx
         St1NaJEtZEvEemw/wSlwtSAH9T3kAvhz4yYhoXAIBrNHeHTmql+Y+FYrYoBw56jcNPUh
         /V0KCK7S7aFH3nra5y8QdIqeIKOYQu93ZTCJw5NQ86yYg2xSGtqKjy4y9Uj15VpoZin3
         2ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550594; x=1781155394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEwXEslPaqIe4nLA6/yUFLJfeGLG+7//kLoNGv1IS5Q=;
        b=rztbMRVUTDvBK5SlsLMoDTXeKBrnDHhJwm+wkQ24EKMR6DOKQZIXkxi5hZSdpFvY6z
         W2kwShJDtiov06f3pz60ospCAEMtqkgxOzu0HWvqsGtvtq0BhrX7VUdBbmdfLYusUR4d
         KSFBfWI9+Hrn8CuDQaJyS8XMAqyeZgZkOTwuiDO2Nd61kdax55/IH4wX06cYN/9KmD3z
         m1CLwt2EPEk7M2IplmcY3HlmmWByHxl5U4mrZvMcFnJ45pxRrbNLKgOoht7pcv0Dj3o6
         N4jpLIZqeTYnpQa6kcL+I6Zmf66C7FpAH1QDnBzp0TNcAptHVti8rTPSTBct9MfacW1p
         AmzA==
X-Forwarded-Encrypted: i=1; AFNElJ/bF/5OKESbyq8udTMpVBx94ZZ4iXH+wBz+ON8oUQs5QmKSCOEywIYUH0lr+rsRVYOzutKwZZHQ8FkO@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3YTuSC09d9s/5S6aY3C7PGGSEXCbB53pfCiNR+T9AkF+ekn7
	SXyBAUVl+qCp0mtC1G/MNld/OA1E+0RuAgkxkSrVcwcWCEOgnvB02s5sLin9GYcfP1UitNmyQ97
	B1cR4Bhz2qdBgXou3//MgFEJEP3u95Rabsa08ChcTiCPmoy/hUufKgEtinFPGXqc=
X-Gm-Gg: Acq92OG18PO5Twk61JN7dKPDuOIWCG5GNy+7H9lithk5NdWn/jI9MjGJ60twnn+zVWa
	ZSuucDGAUPmZyJ6ktp5MZSN8bJa/J0/quk1ogW4qh9UKCLWMhLT+QV+5cIdE6n3qNJb7ZZ6hd4t
	sI8l5zLtsor35Uujxx4GQnOjf86IUGzlzMTgbeSY+E0zFtly6dLmT1KdkZAy5nb1oTbPNyiUuuj
	bpib1Kkv2iH+jtWOTZxNY/kUhu2awAJ0YbFsAsDx6Cb2DQGxoaVdwPHdhCMwneceM9KXs1mq2nE
	jpKOAgq95u39XpGrBgraw9psoO0DIZZ1ltPlG0kYHj47o8LwtehJKzg8JqtqdnWaQ4BPm2sRvD6
	znYvImzL6awCmf2kvjpucA6T/Y/IQ2ih38GFteSdTeXEiiaVpEgDURg==
X-Received: by 2002:a05:600c:4e87:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-490b60e2309mr98333605e9.27.1780550594033;
        Wed, 03 Jun 2026 22:23:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4e87:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-490b60e2309mr98333035e9.27.1780550593489;
        Wed, 03 Jun 2026 22:23:13 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm38953695e9.10.2026.06.03.22.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:23:12 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:23:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Simon Schippers <simon.schippers@tu-dortmund.de>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>
Subject: Re: linux-next: manual merge of the vhost tree with the mm-unstable
 tree
Message-ID: <20260604012124-mutt-send-email-mst@kernel.org>
References: <aiB6PlZxn19NobF0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiB6PlZxn19NobF0@sirena.org.uk>

On Wed, Jun 03, 2026 at 08:02:22PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the vhost tree got conflicts in:
> 
>   include/linux/mm.h
>   include/linux/ptr_ring.h
>   mm/memory.c
>   mm/page_alloc.c
> 
> between at least commits:
> 
>   c0ea52c18c78c ("mm/huge_memory: simplify vma_is_specal_huge()")
>   fba362c17d9d9 ("ptr_ring: move free-space check into separate helper")
>   aa812f234b6c8 ("mm: memory: flatten alloc_anon_folio() retry loop")
> 
> from the mm-unstable tree and commits:
> 
>   dd3984b3bce9d ("ptr_ring: disable KCSAN warnings")
>   fba362c17d9d9 ("ptr_ring: move free-space check into separate helper")
>   f7a2566ae0c03 ("mm: move user page zeroing into the allocator")
> 
> from the vhost tree.  I note that the vhost tree does not appear to have
> anything from Linus' tree beyond v7.0-rc2, are you sure this is
> sensible?


Not at all, somehow I pushed a wrong hash I was experimenting with (
It was never intended for next.


> I am really not convinced about my fixups below.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc include/linux/mm.h
> index 485df9c2dbddb,f600c0428aad9..0000000000000
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@@ -5088,6 -4714,25 +5100,9 @@@ long copy_folio_from_user(struct folio 
>   			   const void __user *usr_src,
>   			   bool allow_pagefault);
>   
>  -/**
>  - * vma_is_special_huge - Are transhuge page-table entries considered special?
>  - * @vma: Pointer to the struct vm_area_struct to consider
>  - *
>  - * Whether transhuge page-table entries are considered "special" following
>  - * the definition in vm_normal_page().
>  - *
>  - * Return: true if transhuge page-table entries should be considered special,
>  - * false otherwise.
>  - */
>  -static inline bool vma_is_special_huge(const struct vm_area_struct *vma)
>  -{
>  -	return vma_is_dax(vma) || (vma->vm_file &&
>  -				   (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP)));
>  -}
>  -
> + #else /* !CONFIG_TRANSPARENT_HUGEPAGE && !CONFIG_HUGETLBFS */
> + #define folio_zero_user(folio, addr_hint) \
> + 	clear_user_highpages(&(folio)->page, (addr_hint), folio_nr_pages(folio))
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_HUGETLBFS */
>   
>   #if MAX_NUMNODES > 1
> diff --cc include/linux/ptr_ring.h
> index c95e891903f05,d2c3629bbe451..0000000000000
> --- a/include/linux/ptr_ring.h
> +++ b/include/linux/ptr_ring.h
> diff --cc mm/memory.c
> index 56be920c56d74,beb6ce312dec6..0000000000000
> --- a/mm/memory.c
> +++ b/mm/memory.c
> diff --cc mm/page_alloc.c
> index 81a9d4d1e6c0a,cb72dd6e0efb3..0000000000000
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@@ -90,8 -90,12 +90,14 @@@ typedef int __bitwise fpi_t
>   /* Free the page without taking locks. Rely on trylock only. */
>   #define FPI_TRYLOCK		((__force fpi_t)BIT(2))
>   
>  +/* free_pages_prepare() has already been called for page(s) being freed. */
>  +#define FPI_PREPARED		((__force fpi_t)BIT(3))
> + /*
> +  * The page contents are known to be zero (e.g., the host zeroed them
> +  * during balloon deflate).  Set PagePrezeroed after free so the next
> +  * allocation can skip redundant zeroing.
> +  */
>  -#define FPI_PREZEROED		((__force fpi_t)BIT(3))
> ++#define FPI_PREZEROED		((__force fpi_t)BIT(4))
>   
>   /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
>   static DEFINE_MUTEX(pcp_batch_high_lock);
> @@@ -1806,15 -1881,25 +1850,25 @@@ static inline bool should_skip_init(gfp
>   	return (flags & __GFP_SKIP_ZERO);
>   }
>   
> + 
>   inline void post_alloc_hook(struct page *page, unsigned int order,
> - 				gfp_t gfp_flags)
> + 				gfp_t gfp_flags, bool prezeroed,
> + 				unsigned long user_addr)
>   {
>  +	const bool zero_tags = gfp_flags & __GFP_ZEROTAGS;
>   	bool init = !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
>   			!should_skip_init(gfp_flags);
>  -	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS);
>   	int i;
>   
> - 	set_page_private(page, 0);
> + 	__ClearPagePrezeroed(page);
> + 
> + 	/*
> + 	 * If the page is pre-zeroed, skip memory initialization.
> + 	 * We still need to handle tag zeroing separately since the host
> + 	 * does not know about memory tags.
> + 	 */
> + 	if (prezeroed && init && !zero_tags)
> + 		init = false;
>   
>   	arch_alloc_page(page, order);
>   	debug_pagealloc_map_pages(page, 1 << order);
> @@@ -3244,15 -3347,9 +3309,16 @@@ struct page *rmqueue_buddy(struct zone 
>   			}
>   		}
>   		spin_unlock_irqrestore(&zone->lock, flags);
> + 		*prezeroed = __page_test_clear_prezeroed(page);
>   	} while (check_new_pages(page, order));
>   
>  +	/*
>  +	 * If this is a high-order atomic allocation then check
>  +	 * if the pageblock should be reserved for the future
>  +	 */
>  +	if (unlikely(alloc_flags & ALLOC_HIGHATOMIC))
>  +		reserve_highatomic_pageblock(page, order, zone);
>  +
>   	__count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
>   	zone_statistics(preferred_zone, zone, 1);
>   
> @@@ -3376,8 -3461,9 +3443,8 @@@ static struct page *rmqueue_pcplist(str
>   	 */
>   	pcp->free_count >>= 1;
>   	list = &pcp->lists[order_to_pindex(migratetype, order)];
> - 	page = __rmqueue_pcplist(zone, order, migratetype, alloc_flags, pcp, list);
>  -	page = __rmqueue_pcplist(zone, order, migratetype, alloc_flags,
>  -				 pcp, list, prezeroed);
>  -	pcp_spin_unlock(pcp, UP_flags);
> ++	page = __rmqueue_pcplist(zone, order, migratetype, alloc_flags, pcp, list, prezeroed);
>  +	pcp_spin_unlock(pcp);
>   	if (page) {
>   		__count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
>   		zone_statistics(preferred_zone, zone, 1);
> @@@ -3941,10 -4035,19 +4009,12 @@@ check_alloc_wmark
>   
>   try_this_zone:
>   		page = rmqueue(zonelist_zone(ac->preferred_zoneref), zone, order,
> - 				gfp_mask, alloc_flags, ac->migratetype);
> + 					gfp_mask, alloc_flags, ac->migratetype,
> + 					&prezeroed);
>   		if (page) {
> - 			prep_new_page(page, order, gfp_mask, alloc_flags);
> + 			prep_new_page(page, order, gfp_mask, alloc_flags,
> + 				      prezeroed, ac->user_addr);
>   
>  -			/*
>  -			 * If this is a high-order atomic allocation then check
>  -			 * if the pageblock should be reserved for the future
>  -			 */
>  -			if (unlikely(alloc_flags & ALLOC_HIGHATOMIC))
>  -				reserve_highatomic_pageblock(page, order, zone);
>  -
>   			return page;
>   		} else {
>   			if (cond_accept_memory(zone, order, alloc_flags))


