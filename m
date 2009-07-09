From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Merge request for the Thumb-2 branch
Date: Thu, 09 Jul 2009 09:57:55 +0100
Message-ID: <1247129875.11409.8.camel@pc1117.cambridge.arm.com>
References: <1246035591.30717.54.camel@pc1117.cambridge.arm.com>
	 <1247067269.6595.44.camel@pc1117.cambridge.arm.com>
	 <20090709100626.1e40912d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:50723 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757248AbZGII6G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2009 04:58:06 -0400
In-Reply-To: <20090709100626.1e40912d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-next <linux-next@vger.kernel.org>

Hi Stephen,

On Thu, 2009-07-09 at 10:06 +1000, Stephen Rothwell wrote:
> On Wed, 08 Jul 2009 16:34:29 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > On Fri, 2009-06-26 at 17:59 +0100, Catalin Marinas wrote:
> > > Could you please merge the thumb-2 branch into linux-next:
> > > 
> > >   git://linux-arm.org/linux-2.6.git thumb-2
> > > 
> > > It adds support for compiling the ARM kernel to the Thumb-2 instruction
> > > set (16 or 32 bit opcodes) and it makes sense to check it doesn't break
> > > other things before the next merging window (it's a bit more intrusive
> > > but limited to arch/arm/* files).
[...]
> > Russell - are you OK with getting this branch merged during the next
> > window, assuming that any new comments are implemented and testing is
> > fine? If there are other issues, please let me know.
> 
> From previous comments that Russell has made, I think he is OK with arm
> platforms being in linux-next separately (we already have 2 others), so I
> will add this today.

That's not a new ARM platform, it is affecting the core
arch/arm/kernel/, arch/arm/mm/ etc. files so that they can be compiled
to an alternative instruction set (mostly 16-bit instructions). So it
should eventually be merged via Russell's tree (or get his ack and push
directly)

My intention is indeed to merge this in the upcoming window (unless
Russell has any more comments to the code).

Thanks.

-- 
Catalin
