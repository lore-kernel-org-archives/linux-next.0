From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 random tree
Date: Wed, 28 Jun 2017 16:03:48 +1000
Message-ID: <20170628160348.16d15d02@canb.auug.org.au>
References: <20170608162812.640fb3ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751747AbdF1GDv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 02:03:51 -0400
In-Reply-To: <20170608162812.640fb3ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Rik van Riel <riel@redhat.com>

Hi Andrew,

[Yes, top posting :-)]

With the merge window approaching, just a reminder that this conflict
still exists.

On Thu, 8 Jun 2017 16:28:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/random.h
> 
> between commit:
> 
>   60473a13020f ("random: add get_random_{bytes,u32,u64,int,long,once}_wait family")
> 
> from the random tree and commit:
> 
>   d7802aa82f66 ("random,stackprotect: introduce get_random_canary function")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/random.h
> index 4aecc339558d,1fa0dc880bd7..000000000000
> --- a/include/linux/random.h
> +++ b/include/linux/random.h
> @@@ -58,31 -57,27 +58,52 @@@ static inline unsigned long get_random_
>   #endif
>   }
>   
>  +/* Calls wait_for_random_bytes() and then calls get_random_bytes(buf, nbytes).
>  + * Returns the result of the call to wait_for_random_bytes. */
>  +static inline int get_random_bytes_wait(void *buf, int nbytes)
>  +{
>  +	int ret = wait_for_random_bytes();
>  +	if (unlikely(ret))
>  +		return ret;
>  +	get_random_bytes(buf, nbytes);
>  +	return 0;
>  +}
>  +
>  +#define declare_get_random_var_wait(var) \
>  +	static inline int get_random_ ## var ## _wait(var *out) { \
>  +		int ret = wait_for_random_bytes(); \
>  +		if (unlikely(ret)) \
>  +			return ret; \
>  +		*out = get_random_ ## var(); \
>  +		return 0; \
>  +	}
>  +declare_get_random_var_wait(u32)
>  +declare_get_random_var_wait(u64)
>  +declare_get_random_var_wait(int)
>  +declare_get_random_var_wait(long)
>  +#undef declare_get_random_var
>  +
> + /*
> +  * On 64-bit architectures, protect against non-terminated C string overflows
> +  * by zeroing out the first byte of the canary; this leaves 56 bits of entropy.
> +  */
> + #ifdef CONFIG_64BIT
> + # ifdef __LITTLE_ENDIAN
> + #  define CANARY_MASK 0xffffffffffffff00UL
> + # else /* big endian, 64 bits: */
> + #  define CANARY_MASK 0x00ffffffffffffffUL
> + # endif
> + #else /* 32 bits: */
> + # define CANARY_MASK 0xffffffffUL
> + #endif
> + 
> + static inline unsigned long get_random_canary(void)
> + {
> + 	unsigned long val = get_random_long();
> + 
> + 	return val & CANARY_MASK;
> + }
> + 
>   unsigned long randomize_page(unsigned long start, unsigned long range);
>   
>   u32 prandom_u32(void);

-- 
Cheers,
Stephen Rothwell
