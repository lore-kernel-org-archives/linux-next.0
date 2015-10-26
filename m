From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 26 Oct 2015 09:18:14 +0100
Message-ID: <562DE1C6.5090706@linux.vnet.ibm.com>
References: <20151021165932.3160cb59@canb.auug.org.au>
 <1445422133.472.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp06.uk.ibm.com ([195.75.94.102]:43811 "EHLO
	e06smtp06.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753161AbbJZISX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Oct 2015 04:18:23 -0400
Received: from localhost
	by e06smtp06.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
	Mon, 26 Oct 2015 08:18:21 -0000
In-Reply-To: <1445422133.472.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Pavel Emelyanov <xemul@parallels.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

On 21/10/2015 12:08, Michael Ellerman wrote:
> On Wed, 2015-10-21 at 16:59 +1100, Stephen Rothwell wrote:
>> Hi Andrew,
>>
>> After merging the akpm-current tree, today's linux-next build (powerpc
>> allnoconfig) failed like this:
> 
>> arch/powerpc/include/asm/pgtable.h: In function 'pte_pgprot':
>> arch/powerpc/include/asm/pte-common.h:104:18: error: '_PAGE_SOFT_DIRTY' undeclared (first use in this function)
>>      _PAGE_EXEC | _PAGE_SOFT_DIRTY)
> 
> That's probably my fault, Andrew asked if we wanted to take it via powerpc and
> I thought "yes" but never actually replied.
> 
> Andrew can you drop this one and we'll take it via powerpc?
> 
> It might take a while to actually hit the powerpc tree because Aneesh is doing
> a lot of work in this area at the moment.
> 
> Without knowing the code, the change logs make me think we probably also need
> to take the other two from Laurent for it to make sense. Laurent?

Hi Michael,

Sorry for the late answer, I was off a couple of days last week.

The other two patches are not specific to powerpc and, as mentioned by
Aneesh, they can go to the -mm tree.

Cheers,
Laurent.
