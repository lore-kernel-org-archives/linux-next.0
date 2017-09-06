From: Martin Wilck <mwilck@suse.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 06 Sep 2017 14:32:53 +0200
Message-ID: <1504701173.5057.10.camel@suse.com>
References: <20170831182101.0e4ad9a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:60597 "EHLO
        prv3-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753004AbdIFMdD (ORCPT
        <rfc822;groupwise-linux-next@vger.kernel.org:0:0>);
        Wed, 6 Sep 2017 08:33:03 -0400
In-Reply-To: <20170831182101.0e4ad9a2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>

Hello Stephen,

On Thu, 2017-08-31 at 18:21 +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from
> /home/sfr/next/next/include/uapi/linux/uuid.h:21:0,
>                  from /home/sfr/next/next/include/linux/uuid.h:19,
>                  from
> /home/sfr/next/next/include/linux/mod_devicetable.h:12,
>                  from /home/sfr/next/next/scripts/mod/devicetable-
> offsets.c:2:
> /home/sfr/next/next/include/linux/string.h: In function
> 'memcpy_and_pad':
> /home/sfr/next/next/include/linux/string.h:450:3: error: implicit
> declaration of function 'fortify_panic' [-Werror=implicit-function-
> declaration]
>    fortify_panic(__func__);
>    ^
> 
> Caused by commit
> 
>   9b04e51112ba ("fortify: use WARN instead of BUG for now")
> 
> interacting with commit
> 
>   01f33c336e2d ("string.h: add memcpy_and_pad()")
> 
> from the block tree.
> 
> I have applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 31 Aug 2017 18:13:43 +1000
> Subject: [PATCH] fortify: use WARN instead of BUG for now fix
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/string.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index edd2b6154b80..e3b713114732 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -447,7 +447,7 @@ __FORTIFY_INLINE void memcpy_and_pad(void *dest,
> size_t dest_len,
>  			__read_overflow3();
>  	}
>  	if (dest_size < dest_len)
> -		fortify_panic(__func__);
> +		fortify_overflow(__func__);
>  	if (dest_len > count) {
>  		memcpy(dest, src, count);
>  		memset(dest + count, pad,  dest_len - count);
> -- 
> 2.13.2

Arnd Bergmann spotted another problem with that patch. I decided to rip
out the "fortify" related code. I'll send a patch in a follow-up email.

Regards,
Martin

-- 
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
