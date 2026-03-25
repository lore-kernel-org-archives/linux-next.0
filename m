Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ABE2940D;
	Wed, 25 Mar 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451637; cv=none; b=ooIJFy+pXy/16YkOvy8KeeGUHG91D/jBk3kaFsmYpYo8aoLNjhnIZPlXcEASlu0A7f2sDH6PsupzhTpVIOwNJ4lyN0FSDoMiG1GGg4NoXsPnZjLuf/SXQrn32SiuRpe4x49oQ/JWyjm7u6E1LEczAVtEly/dJb6/8MYFmplahIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451637; c=relaxed/simple;
	bh=C3+M7PDCpWB+x/0un3kq6Jna4pDCO+Y885n8Sexy4oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZ+TCa5yCOwFepfHDM1mRxNDVWFLj46AHMD187FafKbkOaOjMcMBChmkVGFkZtV/6taXHmiTHHVg5j8trwORSoAJDp03xLWbdwpbnKuIgST4H8JmRALRy4p8CC2dokfzbjAZ+0kurDD66sAJwc3n8Wdb0soJG+HnlYzoZ16Omtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlOxDFkH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlOxDFkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548B0C4CEF7;
	Wed, 25 Mar 2026 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774451637;
	bh=C3+M7PDCpWB+x/0un3kq6Jna4pDCO+Y885n8Sexy4oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlOxDFkH4dkM3gP8d1aGrNR23Mb/jyheqbnk/5mO3dw4SzvovvqYYA3bFqLZVjziX
	 i7lyvPlMII8ma2VWS15cfSGar/N6sTNedeBHWTONOJ+XVp/47UjTu8fnmydRyxV68Q
	 PckLCW6m8bhx4SyQhDUDPvoEPBBraC3XM/U1wZ5+nPCJd9r9tCiTInocY+W9qKosCr
	 YiZDGAQ4A3mjsJdOjT+Tu3lyP+1QaSdLZR5uzzLfcVmvLYwNwvfMZuI4kYkrgXmtbQ
	 BWO9QVXlqIryPh+ATVN++NvnTfkmgEXwkNJGWOd2dmFW+Z6FTR+iozUOlllyFaAFWB
	 nn3j2v6L5kV/g==
Date: Wed, 25 Mar 2026 08:13:56 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <20260325151356.GF6212@frogsfrogsfrogs>
References: <acPjQfoS-k2oDp3i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acPjQfoS-k2oDp3i@sirena.org.uk>

On Wed, Mar 25, 2026 at 01:29:37PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
> 
>   fs/iomap/bio.c
> 
> between commit:
> 
>   f621324dfb3d6 ("iomap: fix lockdep complaint when reads fail")
> 
> from the vfs-brauner-fixes tree and commit:
> 
>   e8f9cf03c9dc9 ("iomap: support ioends for buffered reads")
> 
> from the vfs-brauner tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

That looks correct to me, thanks for pointing out the merge conflict. :)

--D

> diff --cc fs/iomap/bio.c
> index edd908183058f,f989ffcaac96d..0000000000000
> --- a/fs/iomap/bio.c
> +++ b/fs/iomap/bio.c
> @@@ -8,66 -9,33 +9,78 @@@
>   #include "internal.h"
>   #include "trace.h"
>   
>  +static DEFINE_SPINLOCK(failed_read_lock);
>  +static struct bio_list failed_read_list = BIO_EMPTY_LIST;
>  +
> - static void __iomap_read_end_io(struct bio *bio)
> + static u32 __iomap_read_end_io(struct bio *bio, int error)
>   {
> - 	int error = blk_status_to_errno(bio->bi_status);
>   	struct folio_iter fi;
> + 	u32 folio_count = 0;
>   
> - 	bio_for_each_folio_all(fi, bio)
> + 	bio_for_each_folio_all(fi, bio) {
>   		iomap_finish_folio_read(fi.folio, fi.offset, fi.length, error);
> + 		folio_count++;
> + 	}
> + 	if (bio_integrity(bio))
> + 		fs_bio_integrity_free(bio);
>   	bio_put(bio);
> + 	return folio_count;
>   }
>   
>  +static void
>  +iomap_fail_reads(
>  +	struct work_struct	*work)
>  +{
>  +	struct bio		*bio;
>  +	struct bio_list		tmp = BIO_EMPTY_LIST;
>  +	unsigned long		flags;
>  +
>  +	spin_lock_irqsave(&failed_read_lock, flags);
>  +	bio_list_merge_init(&tmp, &failed_read_list);
>  +	spin_unlock_irqrestore(&failed_read_lock, flags);
>  +
>  +	while ((bio = bio_list_pop(&tmp)) != NULL) {
> - 		__iomap_read_end_io(bio);
> ++		__iomap_read_end_io(bio, blk_status_to_errno(bio->bi_status));
>  +		cond_resched();
>  +	}
>  +}
>  +
>  +static DECLARE_WORK(failed_read_work, iomap_fail_reads);
>  +
>  +static void iomap_fail_buffered_read(struct bio *bio)
>  +{
>  +	unsigned long flags;
>  +
>  +	/*
>  +	 * Bounce I/O errors to a workqueue to avoid nested i_lock acquisitions
>  +	 * in the fserror code.  The caller no longer owns the bio reference
>  +	 * after the spinlock drops.
>  +	 */
>  +	spin_lock_irqsave(&failed_read_lock, flags);
>  +	if (bio_list_empty(&failed_read_list))
>  +		WARN_ON_ONCE(!schedule_work(&failed_read_work));
>  +	bio_list_add(&failed_read_list, bio);
>  +	spin_unlock_irqrestore(&failed_read_lock, flags);
>  +}
>  +
>   static void iomap_read_end_io(struct bio *bio)
>   {
>  -	__iomap_read_end_io(bio, blk_status_to_errno(bio->bi_status));
>  +	if (bio->bi_status) {
>  +		iomap_fail_buffered_read(bio);
>  +		return;
>  +	}
>  +
> - 	__iomap_read_end_io(bio);
> ++	__iomap_read_end_io(bio, 0);
>   }
>   
> - static void iomap_bio_submit_read(struct iomap_read_folio_ctx *ctx)
> ++
> + u32 iomap_finish_ioend_buffered_read(struct iomap_ioend *ioend)
> + {
> + 	return __iomap_read_end_io(&ioend->io_bio, ioend->io_error);
> + }
> + 
> + static void iomap_bio_submit_read(const struct iomap_iter *iter,
> + 		struct iomap_read_folio_ctx *ctx)
>   {
>   	struct bio *bio = ctx->read_ctx;
>   


