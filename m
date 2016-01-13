From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Wed, 13 Jan 2016 11:16:10 +0530
Message-ID: <87vb6yc9r1.fsf@linux.vnet.ibm.com>
References: <20160107191613.0228560b@canb.auug.org.au> <1452162650.5826.2.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:58638 "EHLO
	e23smtp04.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811AbcAMFrS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2016 00:47:18 -0500
Received: from localhost
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Wed, 13 Jan 2016 15:47:15 +1000
In-Reply-To: <1452162650.5826.2.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Neuling <mikey@neuling.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> writes:

> On Thu, 2016-01-07 at 19:16 +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the powerpc tree, today's linux-next build (powerpc64
>> allnoconfig) failed like this:
>> 
>> arch/powerpc/mm/hash_utils_64.c: In function 'get_paca_psize':
>> arch/powerpc/mm/hash_utils_64.c:869:19: error: 'struct paca_struct' has no member named 'context'
>>   return get_paca()->context.user_psize;
>>                    ^
>> arch/powerpc/mm/hash_utils_64.c:870:1: error: control reaches end of non-void function [-Werror=return-type]
>>  }
>>  ^
>> 
>> Caused by commit
>> 
>>   2fc251a8dda5 ("powerpc: Copy only required pieces of the mm_context_t to the paca")
>
> Well that's rather embarrassing, for Mikey ;D
>
>> This build has CONFIG_PPC_MM_SLICES not set ...
>
> Ugh, but it would seem none of our defconfigs do :/

4K page size with hugetlb disabled will get that 

-aneesh
