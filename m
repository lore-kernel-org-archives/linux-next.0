From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30
Date: Mon, 30 Jun 2008 23:51:00 +0530
Message-ID: <4869240C.9060503@linux.vnet.ibm.com>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <48690385.7030500@linux.vnet.ibm.com> <20080630175925.GQ20826@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from E23SMTP06.au.ibm.com ([202.81.18.175]:44536 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763661AbYF3SVF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 14:21:05 -0400
In-Reply-To: <20080630175925.GQ20826@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>

Jens Axboe wrote:
> On Mon, Jun 30 2008, Kamalesh Babulal wrote:
>> Hi Stephen,
>>
>> next-20080630 kernel build fails x86 box 
>>
>> fs/bio-integrity.c: In function `bio_integrity_add_page':
>> include/linux/bio.h:368: sorry, unimplemented: inlining failed in call to 'bvec_nr_vecs': function body not available
>> fs/bio-integrity.c:135: sorry, unimplemented: called from here
>> make[1]: *** [fs/bio-integrity.o] Error 1
>> make: *** [fs] Error 2
> 
> Gah, I can't believe gcc errors on that. This should fix it, I'll
> integrate with the patchset.

Hi Jens,

Thanks, the patch fixes the build failure.

> 
> diff --git a/fs/bio.c b/fs/bio.c
> index bc865b1..7761c84 100644
> --- a/fs/bio.c
> +++ b/fs/bio.c
> @@ -50,7 +50,7 @@ static struct biovec_slab bvec_slabs[BIOVEC_NR_POOLS] __read_mostly = {
>   */
>  struct bio_set *fs_bio_set;
> 
> -inline unsigned int bvec_nr_vecs(unsigned short idx)
> +unsigned int bvec_nr_vecs(unsigned short idx)
>  {
>  	return bvec_slabs[idx].nr_vecs;
>  }
> diff --git a/include/linux/bio.h b/include/linux/bio.h
> index 62f0be9..0933a14 100644
> --- a/include/linux/bio.h
> +++ b/include/linux/bio.h
> @@ -365,7 +365,7 @@ extern struct bio *bio_copy_user_iov(struct request_queue *, struct sg_iovec *,
>  extern int bio_uncopy_user(struct bio *);
>  void zero_fill_bio(struct bio *bio);
>  extern struct bio_vec *bvec_alloc_bs(gfp_t, int, unsigned long *, struct bio_set *);
> -extern inline unsigned int bvec_nr_vecs(unsigned short idx);
> +extern unsigned int bvec_nr_vecs(unsigned short idx);
> 
>  /*
>   * bio_set is used to allow other portions of the IO system to
> 


-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
