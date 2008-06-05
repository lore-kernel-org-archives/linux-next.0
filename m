From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: frimware build failure
Date: Thu, 05 Jun 2008 09:03:42 +0100
Message-ID: <1212653023.32207.169.camel@pmac.infradead.org>
References: <20080605172512.e000ddc5.sfr@canb.auug.org.au>
	 <1212652090.32207.159.camel@pmac.infradead.org>
	 <20080605175941.5520add5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:49151 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752523AbYFEIDt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jun 2008 04:03:49 -0400
In-Reply-To: <20080605175941.5520add5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

On Thu, 2008-06-05 at 17:59 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> On Thu, 05 Jun 2008 08:48:10 +0100 David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > I did it like this so I could keep it in 80 columns:
> 
> Looks just as good.
> 
> I am a little worried that this may be broken the same way on other
> platforms ...  The gas manual said something like "On platforms where @
> is the comment character (like ARM) another character is used instead.
> For example, the ARM port uses the % character."
> 
> A grep through the kernel sources shows only @ except on arm, so it
> should be ok.

I did ponder using 'gcc -S' on a simple template file and then
post-processing the output, but I figured there was just as much that
could go wrong with that one too. At least when we emit our own asm,
once we've finished the coverage testing on all architectures and fixed
it all, we can have a reasonable expectation that it'll stay working.
Post-processing the assembly output of GCC just scares me :)

-- 
dwmw2

