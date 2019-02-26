From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 26 Feb 2019 10:16:38 +0200
Message-ID: <20190226081637.GB11981@rapoport-lnx>
References: <20190226183915.053f5993@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190226183915.053f5993@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 26, 2019 at 06:39:15PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> /home/sfr/next/next/arch/powerpc/kernel/setup_32.c:176:21: error: redefinition of 'alloc_stack'
>  static void *__init alloc_stack(void)
>                      ^~~~~~~~~~~
> /home/sfr/next/next/arch/powerpc/kernel/setup_32.c:165:21: note: previous definition of 'alloc_stack' was here
>  static void *__init alloc_stack(void)
>                      ^~~~~~~~~~~
> 
> Caused by patch
> 
>   "powerpc: use memblock functions returning virtual address"
> 
> from the akpm tree interacting with commit
> 
>   c8e409a33cf8 ("powerpc/irq: use memblock functions returning virtual address")
> 
> from the powerpc tree.
> 
> Both patches added the alloc_stack() function and git resolved it by
> adding both. :-(  I have added a patch to remove one of them.

Yeah, me too :)

https://lore.kernel.org/linux-mm/20190226064032.GA5873@rapoport-lnx/
 
Stephen, sorry, should have cc'ed you

> -- 
> Cheers,
> Stephen Rothwell

-- 
Sincerely yours,
Mike.
