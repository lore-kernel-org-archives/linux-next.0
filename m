Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8CF2F9D89;
	Mon, 27 Jul 2026 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152028; cv=none; b=BgV4KAaW5esp4f5L7PBFqYVTFaAg91nH7kyoW9wmKGbydZvnSk6Li6bqbF+Mmcjb1QcfLiypQM/BfDFxAvI5sFpdd6HVVjjmSMqE0pLZnUPHMNN7jcf0/XM20k3ZjsZNuVNJJvAWak9ANHcrNmfErOOTYCJyHdt8FFfSlawAiOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152028; c=relaxed/simple;
	bh=xBSk8iAkLi4jEdQ/iPmyMpVkKLA/CQhWfMa6q94Dv6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry38VbN7n4k+4ZcuSoc48CQmniqJ3VdRl7vq1Q0io1FSggOufzCxGBj3sJ2HFKKav+pLyjmtIaWUfe/9NUE0CUOoanN3BveyOOkvpuXrlAvdP8clrKik6OAL/aBhtkgqBF3V4mHsZGoOWC/jkv8cIP9M3tYiTRs4NhfHGFRDGuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhxhrwCq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhxhrwCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E381F000E9;
	Mon, 27 Jul 2026 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785152026;
	bh=udf0uf+gI7j/a4Z+KinhKKMo17ZU+BfnS1wD9upaWyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KhxhrwCqRpsrg+dH7z+mt/RSXSvIQVWDb3g3I1yh2bUW/NLlydCIglK3PI2he2rZL
	 Qsz2gbV4QH1G0KSnsc0zNJ8iXfH3TO8hqQrGaVt1YXDcBYa6CmMYmPu6p2KAumpXsZ
	 RF9WntpopqqDk3ynoIde2v+aPJXLOjSgPxYItmXKel43ToDCh4XFeGqeivCT5HhCRF
	 hWXqGtCBWL8Hq461DB8SgppXGxtromJ7NGAvyGGpr12eKWTt+OdvIlXe0lZBH7vVGX
	 dyNsKmT5Q/AVFIkk8MZZsJHV26SupezW3z13Lks8VxRGcNgrfPuQQFkNjcPBUZoHTe
	 hmJbyosR/yHVQ==
Date: Mon, 27 Jul 2026 12:33:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the
 mm-hotfixes-unstable tree
Message-ID: <amdA05gNFyzg4Uwc@lucifer>
References: <amZ9QR_9NYqq6JMy@sirena.org.uk>
 <ambxL-NxiYZ3vmpu@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ambxL-NxiYZ3vmpu@kernel.org>

On Mon, Jul 27, 2026 at 08:48:31AM +0300, Mike Rapoport wrote:
> Hi Mark,
>
> On Sun, Jul 26, 2026 at 10:33:53PM +0100, Mark Brown wrote:
> > Hi all,
> >
> > Today's linux-next merge of the tip tree got a conflict in:
> >
> >   arch/x86/mm/pat/set_memory.c
> >
> > between commits:
> >
> >   7a7c16a2d2b4d ("x86/mm/pat: acquire init_mm read lock on attribute change to avoid UAF")
> >   25a54f65ccbaf ("x86/mm/pat: allocate split page tables as kernel page tables")
> >
> > from the mm-hotfixes-unstable tree and commit:
> >
> >   5fce67641a3ed ("x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()")
> >
> > from the tip tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > diff --cc arch/x86/mm/pat/set_memory.c
> > index 422ce7fba00c6,1f2a2ba9ce57d..0000000000000
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@@ -440,30 -441,12 +443,32 @@@ static void __cpa_collapse_large_pages(
> >
> >   	list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
> >   		list_del(&ptdesc->pt_list);
> >  -		pagetable_free(ptdesc);
> >  +		/*
> >  +		 * Only early alloc'd direct map should not be flagged PG_table
> >  +		 * here and those shouldn't be collapsed. However be abundantly
> >  +		 * cautious and handle the !PG_table case too.
> >  +		 */
> >  +		if (PageTable((ptdesc_page(ptdesc))))
> >  +			pagetable_dtor_free(ptdesc);
> >  +		else
> >  +			pagetable_free(ptdesc);
> >   	}
> > +
> > + 	spin_unlock(&cpa_lock);
> >   }
> >
> >  +static void cpa_collapse_large_pages(struct cpa_data *cpa)
> >  +{
> >  +	/*
> >  +	 * Take the mmap write lock on init_mm to:
> >  +	 * - Avoid a use-after-free if raced by ptdump (which takes its own
> >  +	 *   write lock on init_mm).
> >  +	 * - Serialise concurrent CPA walkers.
> >  +	 */
> >  +	scoped_guard(mmap_write_lock, &init_mm)
> >  +		__cpa_collapse_large_pages(cpa);
> >  +}
> >  +
> >   static void cpa_flush(struct cpa_data *cpa, int cache)
> >   {
> >   	unsigned int i;
> > @@@ -1254,22 -1237,16 +1258,20 @@@ __split_large_page(struct cpa_data *cpa
> >   static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
> >   			    unsigned long address)
> >   {
> >  -	struct ptdesc *ptdesc;
> >  +	pte_t *pte;
> >
> > - 	if (!debug_pagealloc_enabled())
> > - 		spin_unlock(&cpa_lock);
> > + 	spin_unlock(&cpa_lock);
>
> This should be
>
>  	if (!debug_pagealloc_enabled())
>  		spin_unlock(&cpa_lock);
>
> >  -	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
> >  +	if (cpa->init_mm_read_locked)
> >  +		mmap_read_unlock(&init_mm);
> >  +	pte = pte_alloc_one_kernel(&init_mm);
> >  +	if (cpa->init_mm_read_locked)
> >  +		mmap_read_lock(&init_mm);
> > - 	if (!debug_pagealloc_enabled())
> > - 		spin_lock(&cpa_lock);
> > + 	spin_lock(&cpa_lock);
>
> And this
>
> 	if (!debug_pagealloc_enabled())
>  		spin_lock(&cpa_lock);
>
> >  -	if (!ptdesc)
> >  +	if (!pte)
> >   		return -ENOMEM;
> >
> >  -	if (__split_large_page(cpa, kpte, address, ptdesc))
> >  -		pagetable_free(ptdesc);
> >  +	if (__split_large_page(cpa, kpte, address, pte))
> >  +		pte_free_kernel(&init_mm, pte);
> >
> >   	return 0;
> >   }
>
>
>
> --
> Sincerely yours,
> Mike.

Hmm, what's the status of the x86/mm trees on this though? AFAICT Denis's
patch is still as-is and the spin_lock() vs. spin_[un]lock_irq*() issue
raised in [0] is unaddressed?

So is this fixup actually representative of what's going upstream?

Thanks, Lorenzo

[0]:https://lore.kernel.org/all/al-MrKyIafA8QR_8@lucifer/
