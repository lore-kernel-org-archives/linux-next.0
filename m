From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Thu, 18 Aug 2016 11:09:48 +1000
Message-ID: <20160818110948.52f1322d@roar.ozlabs.ibm.com>
References: <20160817114443.67675413@canb.auug.org.au>
	<e6fbe17c-1981-1579-433d-88462d2efb58@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34210 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752992AbcHRBKA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Aug 2016 21:10:00 -0400
In-Reply-To: <e6fbe17c-1981-1579-433d-88462d2efb58@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, PowerPC <linuxppc-dev@lists.ozlabs.org>

On Wed, 17 Aug 2016 14:59:59 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2016-08-17 03:44, Stephen Rothwell wrote:
> > Hi Michal,
> > 
> > After merging the kbuild tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced these warnings:
> > 
> > WARNING: 25 bad relocations
> > c000000000cf2570 R_PPC64_ADDR64    __crc___arch_hweight16  
> [...]
> > Introduced by commit
> > 
> >   9445aa1a3062 ("ppc: move exports to definitions")
> > 
> > I have reverted that commit for today.
> > 
> > [cc-ing the ppc guys for clues - also involved is commit
> > 
> >   22823ab419d8 ("EXPORT_SYMBOL() for asm")
> > ]  
> 
> FWIW, I see these warnings as well. Any help from ppc developers is
> appreciated - should the R_PPC64_ADDR64 be whitelisted for exported asm
> symbols (their CRCs actually)?

The dangling relocation is a side effect of linker unable to resolve the
reference to the undefined weak symbols. So the real question is, why has
genksyms not overridden these symbols with their CRC values?

This may not even be powerpc specific, but  I'll poke at it a bit more
when I get a chance.

Thanks,
Nick
