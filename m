From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 26 Oct 2015 17:00:51 +0100
Message-ID: <562E4E33.3010103@linux.vnet.ibm.com>
References: <20151021165932.3160cb59@canb.auug.org.au>
 <1445422133.472.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:49137 "EHLO
	e06smtp10.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750721AbbJZQBA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Oct 2015 12:01:00 -0400
Received: from localhost
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
	Mon, 26 Oct 2015 16:00:58 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 426772190068
	for <linux-next@vger.kernel.org>; Mon, 26 Oct 2015 16:00:50 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com [9.149.37.248])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t9QG0rx259506694
	for <linux-next@vger.kernel.org>; Mon, 26 Oct 2015 16:00:53 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t9QG0pwO025623
	for <linux-next@vger.kernel.org>; Mon, 26 Oct 2015 10:00:52 -0600
In-Reply-To: <1445422133.472.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.orgdirty.olddirty.old, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Pavel Emelyanov <xemul@parallels.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

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

I apologize, that's my mistake, I forgot to test with allnoconfig.

Michael, should I propose a new version of this patch on linuxppc-dev or
should I wait for Aneesh's series to be in your next branch ?

Cheers,
Laurent.

> 
> Andrew can you drop this one and we'll take it via powerpc?
> 
> It might take a while to actually hit the powerpc tree because Aneesh is doing
> a lot of work in this area at the moment.
> 
> Without knowing the code, the change logs make me think we probably also need
> to take the other two from Laurent for it to make sense. Laurent?
> 
> cheers
> 
