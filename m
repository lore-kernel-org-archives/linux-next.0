From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: next-20130204 - bisected slab problem to "slab: Common constants
 for kmalloc boundaries"
Date: Tue, 05 Feb 2013 11:28:35 -0700
Message-ID: <51114F53.4030603@wwwdotorg.org>
References: <510FE051.7080107@imgtec.com> <51100E79.9080101@wwwdotorg.org> <alpine.DEB.2.02.1302042019170.32396@gentwo.org> <0000013cab3780f7-5e49ef46-e41a-4ff2-88f8-46bf216d677e-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:60454 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754317Ab3BES2k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Feb 2013 13:28:40 -0500
In-Reply-To: <0000013cab3780f7-5e49ef46-e41a-4ff2-88f8-46bf216d677e-000000@email.amazonses.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: James Hogan <james.hogan@imgtec.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org

On 02/05/2013 09:36 AM, Christoph Lameter wrote:
> OK I was able to reproduce it by setting ARCH_DMA_MINALIGN in slab.h. This
> patch fixes it here:
> 
> 
> Subject: slab: Handle ARCH_DMA_MINALIGN correctly
> 
> A fixed KMALLOC_SHIFT_LOW does not work for arches with higher alignment
> requirements.
> 
> Determine KMALLOC_SHIFT_LOW from ARCH_DMA_MINALIGN instead.

Tested-by: Stephen Warren <swarren@nvidia.com>

> +/*
> + * Some archs want to perform DMA into kmalloc caches and need a guaranteed
> + * alignment larger than the alignment of a 64-bit integer.
> + * Setting ARCH_KMALLOC_MINALIGN in arch headers allows that.
> + */
> +#if defined(ARCH_DMA_MINALIGN) && ARCH_DMA_MINALIGN > 8
> +#define ARCH_KMALLOC_MINALIGN ARCH_DMA_MINALIGN
> +#define KMALLOC_MIN_SIZE ARCH_DMA_MINALIGN

I might be tempted to drop that #define of KMALLOC_MIN_SIZE ...

> +#define KMALLOC_SHIFT_LOW ilog2(ARCH_DMA_MINALIGN)
> +#else
> +#define ARCH_KMALLOC_MINALIGN __alignof__(unsigned long long)
> +#endif

> +#ifndef KMALLOC_MIN_SIZE
>  #define KMALLOC_MIN_SIZE (1 << KMALLOC_SHIFT_LOW)
>  #endif

... and simply drop the ifdef around that #define instead.

That way, KMALLOC_MIN_SIZE is always defined in one place, and derived
from KMALLOC_SHIFT_LOW; the logic will just set KMALLOC_SHIFT_LOW based
on the various conditions. This seems a little safer to me; fewer
conditions and less code to update if anything changes.
