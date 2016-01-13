From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Wed, 13 Jan 2016 18:44:33 +1100
Message-ID: <1452671073.7404.1.camel@ellerman.id.au>
References: <20160107191613.0228560b@canb.auug.org.au>
	 <1452162650.5826.2.camel@ellerman.id.au>
	 <87vb6yc9r1.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48885 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750935AbcAMHom (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Jan 2016 02:44:42 -0500
In-Reply-To: <87vb6yc9r1.fsf@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Neuling <mikey@neuling.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2016-01-13 at 11:16 +0530, Aneesh Kumar K.V wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > On Thu, 2016-01-07 at 19:16 +1100, Stephen Rothwell wrote:
> > > After merging the powerpc tree, today's linux-next build (powerpc64
> > > allnoconfig) failed like this:
> > > 
> > > arch/powerpc/mm/hash_utils_64.c: In function 'get_paca_psize':
> > > arch/powerpc/mm/hash_utils_64.c:869:19: error: 'struct paca_struct' has no member named 'context'
> > >   return get_paca()->context.user_psize;
> > >                    ^
> > > arch/powerpc/mm/hash_utils_64.c:870:1: error: control reaches end of non-void function [-Werror=return-type]
> > >  }
> > >  ^
> > > 
> > > Caused by commit
> > > 
> > >   2fc251a8dda5 ("powerpc: Copy only required pieces of the mm_context_t to the paca")
> > 
> > Well that's rather embarrassing, for Mikey ;D

> > > This build has CONFIG_PPC_MM_SLICES not set ...
> > 
> > Ugh, but it would seem none of our defconfigs do :/
> 
> 4K page size with hugetlb disabled will get that 

Yeah, but none of our defconfigs do that.

I've got a kisskb target for it now:

  http://kisskb.ellerman.id.au/kisskb/target/28577/

cheers
