Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D58431E43;
	Mon, 20 Jul 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558511; cv=none; b=G0H84env9J1frbvT2IfWZH4mGbvEejiuBjXxvPy78ieAl3l2ddgLP4ZPISEYeDb7zR9M467lcSv+qkhf8TkvBV+JEgHO6hcErz26uTit6W8g+O+toyNibfPyuHoghPelUqHwmW++dFCR0E6qzUQlKU5Z01gPNHee5vsjBKukxGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558511; c=relaxed/simple;
	bh=oJfujzCtMKrxNILgudZSHedCBI4VmL+Wifsa/DxjPZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6UukREWt+KWu3CDW/JuDkB4Vj2B7/1abWc3+KB0lLMRHxY8CtPqXa4sgR8WnVHxbxJ4kQt1nhdMdL5/5Cu3w6kfQOakDH+bB9+mpsUh2cEYZnDeiSnGy8KmxiYCj+g5Gqj5YplqE1Rfb43bAz1O0IPDYSCmadtqnGsczOR3pr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id EEEC468C4E; Mon, 20 Jul 2026 16:41:41 +0200 (CEST)
Date: Mon, 20 Jul 2026 16:41:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Message-ID: <20260720144141.GA16699@lst.de>
References: <al4jGBGNG_QACaNL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4jGBGNG_QACaNL@sirena.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jul 20, 2026 at 02:31:04PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the mm-unstable tree got a conflict in:
> 
>   drivers/gpu/drm/ttm/ttm_backup.c
> 
> between commit:
> 
>   a3fdf74ffa596 ("drm/ttm/pool: back up at native page order")
> 
> from the drm-misc-fixes tree and commit:
> 
>   c6bfdcf16f131 ("shmem: provide a shmem_write_folio wrapper")
> 
> from the mm-unstable tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Much of the code here really should sit in shmem.c instead of having
random drivers/subsystems poke into the internals of shmem mappings
and folios.  But I feel like a broken record for saying that again
and again without any action :(

> 
> diff --combined drivers/gpu/drm/ttm/ttm_backup.c
> index 3c067aadc52de,c5b813a563e7f..0000000000000
> --- a/drivers/gpu/drm/ttm/ttm_backup.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@@ -6,10 -6,9 +6,10 @@@
>   #include <drm/ttm/ttm_backup.h>
>   
>   #include <linux/export.h>
>  -#include <linux/page-flags.h>
>   #include <linux/swap.h>
>   
>  +#include "ttm_pool_internal.h"
>  +
>   /*
>    * Need to map shmem indices to handle since a handle value
>    * of 0 means error, following the swp_entry_t convention.
> @@@ -69,23 -68,17 +69,23 @@@ int ttm_backup_copy_page(struct file *b
>   }
>   
>   /**
>  - * ttm_backup_backup_page() - Backup a page
>  + * ttm_backup_backup_folio() - Backup a folio
>    * @backup: The struct backup pointer to use.
>  - * @page: The page to back up.
>  - * @writeback: Whether to perform immediate writeback of the page.
>  + * @folio: The folio to back up.
>  + * @order: The allocation order of @folio.  Since TTM allocates higher-order
>  + *         pages without __GFP_COMP, folio_nr_pages(@folio) would always
>  + *         return 1; the caller must pass the true order explicitly.
>  + * @writeback: Whether to perform immediate writeback of the folio's pages.
>    * This may have performance implications.
>  - * @idx: A unique integer for each page and each struct backup.
>  + * @idx: A unique integer for the first page of the folio and each struct backup.
>    * This allows the backup implementation to avoid managing
>    * its address space separately.
>  - * @page_gfp: The gfp value used when the page was allocated.
>  - * This is used for accounting purposes.
>  + * @folio_gfp: The gfp value used when the folio was allocated.
>  + * Currently unused.
>    * @alloc_gfp: The gfp to be used when allocating memory.
>  + * @nr_pages_backed: Output. On a successful return, set to the number of
>  + * pages actually backed up, which may be less than (1 << @order)
>  + * if an -ENOMEM was encountered mid-folio.
>    *
>    * Context: If called from reclaim context, the caller needs to
>    * assert that the shrinker gfp has __GFP_FS set, to avoid
> @@@ -94,87 -87,53 +94,87 @@@
>    * that the shrinker gfp has __GFP_IO set, since without it,
>    * we're not allowed to start backup IO.
>    *
>  - * Return: A handle on success. Negative error code on failure.
>  - *
>  - * Note: This function could be extended to back up a folio and
>  - * implementations would then split the folio internally if needed.
>  - * Drawback is that the caller would then have to keep track of
>  - * the folio size- and usage.
>  + * Return: A handle for the first backed-up page on success (handles for
>  + * subsequent pages follow sequentially). -ENOMEM if no pages could be backed
>  + * up. Any other negative error code if a non-ENOMEM failure occurred; in that
>  + * case any pages backed up so far are truncated before returning.
>    */
>   s64
>  -ttm_backup_backup_page(struct file *backup, struct page *page,
>  -		       bool writeback, pgoff_t idx, gfp_t page_gfp,
>  -		       gfp_t alloc_gfp)
>  +ttm_backup_backup_folio(struct file *backup, struct folio *folio,
>  +			unsigned int order, bool writeback, pgoff_t idx,
>  +			gfp_t folio_gfp, gfp_t alloc_gfp,
>  +			pgoff_t *nr_pages_backed)
>   {
>   	struct address_space *mapping = backup->f_mapping;
>  -	unsigned long handle = 0;
>  +	int nr_pages = 1 << order;
>   	struct folio *to_folio;
>  -	int ret;
>  +	int ret, i;
>   
>  -	to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
>  -	if (IS_ERR(to_folio))
>  -		return PTR_ERR(to_folio);
>  +	*nr_pages_backed = 0;
>   
>  -	folio_mark_accessed(to_folio);
>  -	folio_lock(to_folio);
>  -	folio_mark_dirty(to_folio);
>  -	copy_highpage(folio_file_page(to_folio, idx), page);
>  -	handle = ttm_backup_shmem_idx_to_handle(idx);
>  +	for (i = 0; i < nr_pages; ) {
>  +		int to_nr, j;
>   
>  -	if (writeback && !folio_mapped(to_folio) &&
>  -	    folio_clear_dirty_for_io(to_folio)) {
>  -		folio_set_reclaim(to_folio);
>  -		ret = shmem_write_folio(to_folio);
>  -		if (!folio_test_writeback(to_folio))
>  -			folio_clear_reclaim(to_folio);
>   		/*
>  -		 * If writeout succeeds, it unlocks the folio.	errors
>  -		 * are otherwise dropped, since writeout is only best
>  -		 * effort here.
>  +		 * Only inject past the first subpage so *nr_pages_backed is
>  +		 * always > 0 here, matching a genuine mid-compound -ENOMEM
>  +		 * and driving the caller's reactive split fallback instead
>  +		 * of an early, no-progress failure.
>   		 */
>  -		if (ret)
>  +		if (IS_ENABLED(CONFIG_FAULT_INJECTION) && i &&
>  +		    ttm_backup_fault_inject_folio())
>  +			to_folio = ERR_PTR(-ENOMEM);
>  +		else
>  +			to_folio = shmem_read_folio_gfp(mapping, idx + i, alloc_gfp);
>  +		if (IS_ERR(to_folio)) {
>  +			int err = PTR_ERR(to_folio);
>  +
>  +			if (err == -ENOMEM && *nr_pages_backed)
>  +				return ttm_backup_shmem_idx_to_handle(idx);
>  +
>  +			if (*nr_pages_backed) {
>  +				shmem_truncate_range(file_inode(backup),
>  +						     (loff_t)idx << PAGE_SHIFT,
>  +						     ((loff_t)(idx + i) << PAGE_SHIFT) - 1);
>  +				/*
>  +				 * The pages just truncated are no longer
>  +				 * backed up; don't let the caller mistake
>  +				 * them for valid handles.
>  +				 */
>  +				*nr_pages_backed = 0;
>  +			}
>  +			return err;
>  +		}
>  +
>  +		to_nr = min_t(int, nr_pages - i,
>  +			      folio_next_index(to_folio) - (idx + i));
>  +
>  +		folio_mark_accessed(to_folio);
>  +		folio_lock(to_folio);
>  +		folio_mark_dirty(to_folio);
>  +
>  +		for (j = 0; j < to_nr; j++)
>  +			copy_highpage(folio_file_page(to_folio, idx + i + j),
>  +				      folio_page(folio, i + j));
>  +
>  +		if (writeback && !folio_mapped(to_folio) &&
>  +		    folio_clear_dirty_for_io(to_folio)) {
>  +			folio_set_reclaim(to_folio);
> ++			ret = shmem_write_folio(to_folio);
>  +			if (!folio_test_writeback(to_folio))
>  +				folio_clear_reclaim(to_folio);
>  +			if (ret == AOP_WRITEPAGE_ACTIVATE)
>  +				folio_unlock(to_folio);
>  +		} else {
>   			folio_unlock(to_folio);
>  -	} else {
>  -		folio_unlock(to_folio);
>  +		}
>  +
>  +		folio_put(to_folio);
>  +		i += to_nr;
>  +		*nr_pages_backed = i;
>   	}
>   
>  -	folio_put(to_folio);
>  -
>  -	return handle;
>  +	return ttm_backup_shmem_idx_to_handle(idx);
>   }
>   
>   /**


---end quoted text---
