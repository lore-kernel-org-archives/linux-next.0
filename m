Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5F3E49E3;
	Tue, 21 Jul 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650471; cv=none; b=bZosst4aaLblQQJg5izqsCZrmFozvVBcxXAwHB00hwzBHtRAGjRp5/WvPyIfy3yXvsYs08MWHr3Ofr6SZGkhxHqh5MBWDvjYRV0SLDy25Jt/oZk/f+MTTyL7hg/0l/1jBIVHFia4MyTggumwMD+Ao7Mqj6+nLKzmjxecaR4sCVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650471; c=relaxed/simple;
	bh=qBPicWkm9ciSlnVFWaNogtwHZDACK/Pi+LZOYIsUL5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A06QcqE1D4xbRApw7wg6YfRvrx/uOlpm6S3UJ15jzVMKjfeCIyo2YyN7yD8gSQKGt3+6gp5RRCSzKmPiEST5Kykjq/rWHleGplk+7c2/P6G7a+d4k07piE20ywO1f7hFO4lddU2JMbSvIg1bijLYE310cKdVAR5d7xXm4OHeGjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjbbNMHu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjbbNMHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8851F000E9;
	Tue, 21 Jul 2026 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784650469;
	bh=7T/PFZhJx8XwrdQBVEHyD0U+DCVUyZe9gZIsFGUdZKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TjbbNMHuNs66MMLI+aL7nCwsbklZqMnRHO72a+1FDzvoAMnnzEstKaqwNcQPPquqa
	 q1BfERYQDKZsuBcpHmN7knNzdcJHGQfBK+sZTqNxXaDxXvOcI9wqZobwlt3Kevgc4o
	 79wMtg0uYyYczWPo+X2P5J2hjoAv+9LIcx9GxHOiqaPJS/Ft/UpHpTRJVGFfRhN4QS
	 HTQ4q4TAX7SqDRCayLPmO+RaBcdYS+4NZ8DpTCqZcKKxK8x2huLDRaEegAHqG/kT2S
	 d8d/fufSe1StnCcdM79oG71e4J8+3GfowCYXvbS2g0Axdf1fwwknUaJhBBBqSN1O9g
	 Cj4gkOsRHr+5w==
Date: Tue, 21 Jul 2026 17:14:13 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Mike Rapoport <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the
 mm-hotfixes-unstable tree
Message-ID: <al-Z08lGBdqUiTo2@lucifer>
References: <al94LynD19vVIqw6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al94LynD19vVIqw6@sirena.org.uk>

On Tue, Jul 21, 2026 at 02:46:23PM +0100, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   arch/x86/mm/pat/set_memory.c
>
> between commit:
>
>   b8228ddfd0586 ("x86/mm/pat: allocate split page tables as kernel page tables")
>
> from the mm-hotfixes-unstable tree and commit:
>
>   5fce67641a3ed ("x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the resolution looks correct! :)

There's some discussion on the patches themselves but that's by-the-by.

Cheers, Lorenzo

>
> diff --cc arch/x86/mm/pat/set_memory.c
> index a67ca33b9dd12,1f2a2ba9ce57d..0000000000000
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@@ -439,26 -441,12 +442,28 @@@ static void __cpa_collapse_large_pages(
>
>   	list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
>   		list_del(&ptdesc->pt_list);
>  -		pagetable_free(ptdesc);
>  +
>  +		if (folio_test_pgtable(ptdesc_folio(ptdesc)))
>  +			pagetable_dtor_free(ptdesc);
>  +		else
>  +			pagetable_free(ptdesc);
>   	}
> +
> + 	spin_unlock(&cpa_lock);
>   }
>
>  +static void cpa_collapse_large_pages(struct cpa_data *cpa)
>  +{
>  +	/*
>  +	 * Take the mmap write lock on init_mm to:
>  +	 * - Avoid a use-after-free if raced by ptdump (which takes its own
>  +	 *   write lock on init_mm).
>  +	 * - Serialise concurrent CPA walkers.
>  +	 */
>  +	scoped_guard(mmap_write_lock, &init_mm)
>  +		__cpa_collapse_large_pages(cpa);
>  +}
>  +
>   static void cpa_flush(struct cpa_data *cpa, int cache)
>   {
>   	unsigned int i;
> @@@ -1249,18 -1237,16 +1253,16 @@@ __split_large_page(struct cpa_data *cpa
>   static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
>   			    unsigned long address)
>   {
>  -	struct ptdesc *ptdesc;
>  +	pte_t *pte;
>
> - 	if (!debug_pagealloc_enabled())
> - 		spin_unlock(&cpa_lock);
> + 	spin_unlock(&cpa_lock);
>  -	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  +	pte = pte_alloc_one_kernel(&init_mm);
> - 	if (!debug_pagealloc_enabled())
> - 		spin_lock(&cpa_lock);
> + 	spin_lock(&cpa_lock);
>  -	if (!ptdesc)
>  +	if (!pte)
>   		return -ENOMEM;
>
>  -	if (__split_large_page(cpa, kpte, address, ptdesc))
>  -		pagetable_free(ptdesc);
>  +	if (__split_large_page(cpa, kpte, address, pte))
>  +		pte_free_kernel(&init_mm, pte);
>
>   	return 0;
>   }
