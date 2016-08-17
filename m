From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Wed, 17 Aug 2016 14:59:59 +0200
Message-ID: <e6fbe17c-1981-1579-433d-88462d2efb58@suse.cz>
References: <20160817114443.67675413@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36921 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750839AbcHQNAE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Aug 2016 09:00:04 -0400
In-Reply-To: <20160817114443.67675413@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>

On 2016-08-17 03:44, Stephen Rothwell wrote:
> Hi Michal,
> 
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
> 
> WARNING: 25 bad relocations
> c000000000cf2570 R_PPC64_ADDR64    __crc___arch_hweight16
[...]
> Introduced by commit
> 
>   9445aa1a3062 ("ppc: move exports to definitions")
> 
> I have reverted that commit for today.
> 
> [cc-ing the ppc guys for clues - also involved is commit
> 
>   22823ab419d8 ("EXPORT_SYMBOL() for asm")
> ]

FWIW, I see these warnings as well. Any help from ppc developers is
appreciated - should the R_PPC64_ADDR64 be whitelisted for exported asm
symbols (their CRCs actually)?

Thanks,
Michal
