From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: build failure after merge of the access_once tree
Date: Mon, 08 Dec 2014 12:35:35 +0100
Message-ID: <54858D07.2030403@de.ibm.com>
References: <20141208222641.40a64946@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:53757 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419AbaLHLfm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2014 06:35:42 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Mon, 8 Dec 2014 11:35:40 -0000
In-Reply-To: <20141208222641.40a64946@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>

Am 08.12.2014 um 12:26 schrieb Stephen Rothwell:
> Hi Christian,
> 
> After merging the acess_once tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> arch/powerpc/mm/hugetlbpage.c: In function 'find_linux_pte_or_hugepte':
> arch/powerpc/mm/hugetlbpage.c:981:3: error: invalid initializer
>    pud  = ACCESS_ONCE(*pudp);
>    ^
> arch/powerpc/mm/hugetlbpage.c:993:4: error: invalid initializer
>     pmd  = ACCESS_ONCE(*pmdp);
>     ^
> 
> These are preexisting ...
> 
> mm/gup.c: In function 'gup_pmd_range':
> mm/gup.c:929:3: error: invalid initializer
>    pmd_t pmd = ACCESS_ONCE(*pmdp);
>    ^
> mm/gup.c:929:3: error: (near initialization for 'pmd')
> 
> This is from commit f30c59e921f1 ("mm: Update generic gup
> implementation to handle hugepage directory") from the powerpc-mpe (and
> powerpc) tree and so will require a merge fix patch (presumable
> s/ACCESS_ONCE/READ_ONCE/).
> 
> I am not sure how many architectures you are trying to cover, but
> powerpc is one I care about :-)
> 
> I have dropped the access_once tree again today, sorry (its too late at
> night).

Yes, we expect that tightening ACCESS_ONCE will trigger these bugs. I tried to cover everything in Linus master, but next is certainly a new game. It will be pretty hard for me to keep this running when hundreds of trees get merged during 3.19-rc. :-(

Linus, I see two options:

a: Either we go a full round in linux-next and expect all trees to follow the new rules, so we can merge this for 3.20
b: Only apply READ/ASSIGN_ONCE and the first fixups for 3.19 and put the ACCESS_ONCE change in next after rc1 so it will go in for 3.20 (or later) so that people can adopt. 

Any opinions?

Christian
