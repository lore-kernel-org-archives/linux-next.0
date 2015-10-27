From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 27 Oct 2015 09:45:15 +0900
Message-ID: <1445906715.23184.1.camel@ellerman.id.au>
References: <20151021165932.3160cb59@canb.auug.org.au>
	 <1445422133.472.1.camel@ellerman.id.au>
	 <562E4E33.3010103@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45569 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753004AbbJ0ApW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Oct 2015 20:45:22 -0400
In-Reply-To: <562E4E33.3010103@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Dufour <ldufour@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.orgdirty.olddirty.old, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Pavel Emelyanov <xemul@parallels.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

On Mon, 2015-10-26 at 17:00 +0100, Laurent Dufour wrote:
> On 21/10/2015 12:08, Michael Ellerman wrote:
> > On Wed, 2015-10-21 at 16:59 +1100, Stephen Rothwell wrote:
> > > Hi Andrew,
> > > 
> > > After merging the akpm-current tree, today's linux-next build (powerpc
> > > allnoconfig) failed like this:
> > 
> > > arch/powerpc/include/asm/pgtable.h: In function 'pte_pgprot':
> > > arch/powerpc/include/asm/pte-common.h:104:18: error: '_PAGE_SOFT_DIRTY' undeclared (first use in this function)
> > >      _PAGE_EXEC | _PAGE_SOFT_DIRTY)
> > 
> > That's probably my fault, Andrew asked if we wanted to take it via powerpc and
> > I thought "yes" but never actually replied.
> 
> I apologize, that's my mistake, I forgot to test with allnoconfig.
> 
> Michael, should I propose a new version of this patch on linuxppc-dev or
> should I wait for Aneesh's series to be in your next branch ?

Please send an updated version to linuxppc-dev, I probably won't merge it until
Aneesh's series go in but it's still good to have an updated version on the
list.

cheers
