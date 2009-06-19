From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: slab tree build failure
Date: Fri, 19 Jun 2009 20:40:08 +1000
Message-ID: <1245408008.16880.9.camel@pasglop>
References: <20090619141626.a60bba01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:36299 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752334AbZFSKkc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Jun 2009 06:40:32 -0400
In-Reply-To: <20090619141626.a60bba01.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2009-06-19 at 14:16 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> mm/slqb.c:75: error: 'SLAB_GFP_BOOT_MASK' undeclared here (not in a function)
> 
> Caused by commit df548b0bbaf2d4d16ce52d2f5ccdc1cfded70e06 ("SLQB: Fix
> early boot allocations") from the slab tree interacting with commit
> dcce284a259373f9e5570f2e33f79eca84fcf565 ("mm: Extend gfp masking to the
> page allocator") that entered Linus' tree today.
> 
> I have applied this patch for today:

The right fix is to remove slab_gfp_mask from slqb.c and use
the global gfp_allowed_mask instead.

Cheers,
Ben.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 19 Jun 2009 14:13:21 +1000
> Subject: [PATCH] slqb: fix for macro name change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/slqb.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/mm/slqb.c b/mm/slqb.c
> index b61ad01..4c9051d 100644
> --- a/mm/slqb.c
> +++ b/mm/slqb.c
> @@ -72,7 +72,7 @@ static int slqb_min_objects = 1;
>   * The slab allocator is initialized with interrupts disabled. Therefore, make
>   * sure early boot allocations don't accidentally enable interrupts.
>   */
> -static gfp_t slab_gfp_mask __read_mostly = SLAB_GFP_BOOT_MASK;
> +static gfp_t slab_gfp_mask __read_mostly = GFP_BOOT_MASK;
>  
>  #ifdef CONFIG_NUMA
>  static inline int slab_numa(struct kmem_cache *s)
> -- 
> 1.6.3.1
> 
