From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the crypto tree
Date: Thu, 25 Aug 2016 21:14:11 +1000
Message-ID: <20160825211411.08858397@canb.auug.org.au>
References: <20160825113824.61ca7364@canb.auug.org.au>
        <20160825082010.5523ae6f@mschwide>
        <20160825074701.GA11175@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160825074701.GA11175@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Herbert,

On Thu, 25 Aug 2016 15:47:01 +0800 Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> I'm going to do something like this:
> 
> ---8<---
> This patch fixes an unused label warning triggered when the macro
> XOR_SELECT_TEMPLATE is not set.
> 
> Fixes: 39457acda913 ("crypto: xor - skip speed test if the xor...")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> diff --git a/crypto/xor.c b/crypto/xor.c
> index b8975d9..69866e9 100644
> --- a/crypto/xor.c
> +++ b/crypto/xor.c
> @@ -113,13 +113,14 @@ calibrate_xor_blocks(void)
>  
>  #ifdef XOR_SELECT_TEMPLATE
>  	fastest = XOR_SELECT_TEMPLATE(fastest);
> +#endif
> +
>  	if (fastest) {
>  		printk(KERN_INFO "xor: automatically using best "
>  				 "checksumming function   %-10s\n",
>  		       fastest->name);
>  		goto out;
>  	}
> -#endif

That looks fine to me.  An alternative might be to have:

#ifndef XOR_SELECT_TEMPLATE
#define XOR_SELECT_TEMPLATE(x)	(x)
#endif

near the top of the file.  That gets the #ifdef out of the code flow
and serves as some hint that such a thing can be defined by arch header
files.

Either way.
-- 
Cheers,
Stephen Rothwell
