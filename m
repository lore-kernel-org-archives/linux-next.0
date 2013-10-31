From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH V2] printk/cache: Mark printk_once test variable __read_mostly
Date: Thu, 31 Oct 2013 13:35:49 +0000
Message-ID: <52725CB5.5090903@imgtec.com>
References: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>  <20131030134839.8bdf70cc68d1bf0beb1fb63a@linux-foundation.org> <1383174102.9435.54.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:33151 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752435Ab3JaNfw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Oct 2013 09:35:52 -0400
In-Reply-To: <1383174102.9435.54.camel@joe-AO722>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-metag@vger.kernel.org

On 30/10/13 23:01, Joe Perches wrote:
> Add #include <linux/cache.h> to define __read_mostly.
> 
> Convert cache.h to use uapi/linux/kernel.h instead
> of linux/kernel.h to avoid recursive #includes.
> 
> Convert the ALIGN macro to __KERNEL_ALIGN.
> 
> printk_once only sets the bool variable tested
> once so mark it __read_mostly.
> 
> Neaten the alignment so it matches the rest of the
> pr_<level>_once #defines too.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> V2: Add cache.h which was nearly always used
>     indirectly via #include <some_other_file.h>,
>     generally module.h
>     Update cache.h to avoid recursive #include
> 
>  include/linux/cache.h  |  4 ++--
>  include/linux/printk.h | 19 ++++++++++---------
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/cache.h b/include/linux/cache.h
> index 4c57065..63a1d97 100644
> --- a/include/linux/cache.h
> +++ b/include/linux/cache.h
> @@ -1,11 +1,11 @@
>  #ifndef __LINUX_CACHE_H
>  #define __LINUX_CACHE_H
>  
> -#include <linux/kernel.h>
> +#include <uapi/linux/kernel.h>
>  #include <asm/cache.h>
>  
>  #ifndef L1_CACHE_ALIGN
> -#define L1_CACHE_ALIGN(x) ALIGN(x, L1_CACHE_BYTES)
> +#define L1_CACHE_ALIGN(x) __KERNEL_ALIGN(x, L1_CACHE_BYTES)

I think that should be __ALIGN_KERNEL (same applies to commit message).

Otherwise this patch looks good to me and builds all Meta defconfigs fine.
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Thanks
James
