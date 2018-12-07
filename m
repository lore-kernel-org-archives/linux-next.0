From: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Date: Thu, 6 Dec 2018 17:40:57 -0800
Message-ID: <20181207014057.GA214249@google.com>
References: <20181206174417.45fe3e7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206174417.45fe3e7a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 06, 2018 at 05:44:17PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got conflicts in:
> 
>   arch/powerpc/include/asm/book3s/32/pgalloc.h
>   arch/powerpc/include/asm/nohash/32/pgalloc.h
>   arch/powerpc/mm/pgtable-book3s64.c
> 
> between commits:
> 
>   a95d133c8643 ("powerpc/mm: Move pte_fragment_alloc() to a common location")
>   32ea4c149990 ("powerpc/mm: Extend pte_fragment functionality to PPC32")
> 
> from the powerpc tree and commit:
> 
>   913c2d755b39 ("mm: treewide: remove unused address argument from pte_alloc functions")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below, plus the extra merge fix patch) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

The conflict resolution looks good to me.

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel
