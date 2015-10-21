From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Oct 2015 21:08:53 +1100
Message-ID: <1445422133.472.1.camel@ellerman.id.au>
References: <20151021165932.3160cb59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151021165932.3160cb59@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Dufour <ldufour@linux.vnet.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Pavel Emelyanov <xemul@parallels.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2015-10-21 at 16:59 +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
 
> arch/powerpc/include/asm/pgtable.h: In function 'pte_pgprot':
> arch/powerpc/include/asm/pte-common.h:104:18: error: '_PAGE_SOFT_DIRTY' undeclared (first use in this function)
>      _PAGE_EXEC | _PAGE_SOFT_DIRTY)

That's probably my fault, Andrew asked if we wanted to take it via powerpc and
I thought "yes" but never actually replied.

Andrew can you drop this one and we'll take it via powerpc?

It might take a while to actually hit the powerpc tree because Aneesh is doing
a lot of work in this area at the moment.

Without knowing the code, the change logs make me think we probably also need
to take the other two from Laurent for it to make sense. Laurent?

cheers
