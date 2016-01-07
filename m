From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Thu, 07 Jan 2016 21:30:50 +1100
Message-ID: <1452162650.5826.2.camel@ellerman.id.au>
References: <20160107191613.0228560b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160107191613.0228560b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2016-01-07 at 19:16 +1100, Stephen Rothwell wrote:
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

Well that's rather embarrassing, for Mikey ;D

> This build has CONFIG_PPC_MM_SLICES not set ...

Ugh, but it would seem none of our defconfigs do :/

> I have applied the following patch for today:

Thanks.

I'll merge it or something similar once I get a chance to test it.

cheers
