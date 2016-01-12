From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Tue, 12 Jan 2016 23:32:47 +1100 (AEDT)
Message-ID: <20160112123248.131801401E7@ozlabs.org>
References: <20160107191613.0228560b@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160107191613.0228560b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Neuling <mikey@neuling.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 2016-07-01 at 08:16:13 UTC, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> arch/powerpc/mm/hash_utils_64.c: In function 'get_paca_psize':
> arch/powerpc/mm/hash_utils_64.c:869:19: error: 'struct paca_struct' has no member named 'context'
>   return get_paca()->context.user_psize;
>                    ^
> arch/powerpc/mm/hash_utils_64.c:870:1: error: control reaches end of non-void function [-Werror=return-type]
>  }
>  ^
> 
> Caused by commit
> 
>   2fc251a8dda5 ("powerpc: Copy only required pieces of the mm_context_t to the paca")
> 
> This build has CONFIG_PPC_MM_SLICES not set ...
> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 7 Jan 2016 19:07:18 +1100
> Subject: [PATCH] powerpc: restore the user_psize member of the mm_context_t in
>  the paca
> 
> It is used when CONFIG_PPC_MM_SLICES is not set.
> 
> Fixes: 2fc251a8dda5 ("powerpc: Copy only required pieces of the mm_context_t to the paca")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c33e54fafacaf83b3e345aae0e

cheers
