From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHv2] idr: always do slow path when hint is uninitialized
Date: Wed, 20 Feb 2013 09:32:56 -0800
Message-ID: <20130220173256.GC3570@htj.dyndns.org>
References: <1361381015-446-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:63884 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462Ab3BTRdI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Feb 2013 12:33:08 -0500
Received: by mail-pb0-f51.google.com with SMTP id un15so2972219pbc.38
        for <linux-next@vger.kernel.org>; Wed, 20 Feb 2013 09:33:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1361381015-446-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-next@vger.kernel.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>

Hello,

On Wed, Feb 20, 2013 at 07:23:35PM +0200, Andy Shevchenko wrote:
> The guilty commit is cc5b5f6 "events: convert to idr_alloc()" together with
> f49318a "idr: implement lookup hint". In our case the idr_alloc is never
> called, but idr_find is. The hint field is never initialized and therefore
> should not be dereferenced.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  include/linux/idr.h | 2 +-
>  lib/idr.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/idr.h b/include/linux/idr.h
> index aed2a0c..a6f38b5 100644
> --- a/include/linux/idr.h
> +++ b/include/linux/idr.h
> @@ -113,7 +113,7 @@ static inline void *idr_find(struct idr *idr, int id)
>  {
>  	struct idr_layer *hint = rcu_dereference_raw(idr->hint);
>  
> -	if ((id & ~IDR_MASK) == hint->prefix)
> +	if (hint && (id & ~IDR_MASK) == hint->prefix)
>  		return rcu_dereference_raw(hint->ary[id & IDR_MASK]);

I was thinking more along the line of creating a shared empty layer w/
bogus prefix and then updating free_layer to fallback to it so that we
can avoid the extra if but, yeah, let's do that later.  We're already
in merge window.

 Acked-by: Tejun Heo <tj@kernel.org>

Thanks!

-- 
tejun
