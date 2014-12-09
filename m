From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: build failure after merge of the access_once tree
Date: Tue, 09 Dec 2014 20:54:27 +0100
Message-ID: <54875373.50305@de.ibm.com>
References: <20141208222641.40a64946@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141208222641.40a64946@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

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
> 

Next try. I removed the change of ACCESS_ONCE and just left the new interfaces and the simple reworks in the queue.
I will tackle everything else after rc1 when next should be small again. Keeping fingers crossed....

Christian
