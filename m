From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Oct 2015 19:44:41 +0530
Message-ID: <87lhaws3zi.fsf@linux.vnet.ibm.com>
References: <20151021165932.3160cb59@canb.auug.org.au> <1445422133.472.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp09.in.ibm.com ([122.248.162.9]:59916 "EHLO
	e28smtp09.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751695AbbJUOOv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2015 10:14:51 -0400
Received: from /spool/local
	by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Wed, 21 Oct 2015 19:44:48 +0530
In-Reply-To: <1445422133.472.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Dufour <ldufour@linux.vnet.ibm.com>, Pavel Emelyanov <xemul@parallels.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

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
>

The other two patches are fixes for core soft dirty tracking code and
they are valid even without powerpc bits. So they can go via -mm tree

-aneesh
