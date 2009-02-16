From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm tree with the arm-current tree
Date: Mon, 16 Feb 2009 00:29:22 +0000
Message-ID: <20090216002922.GB1929@flint.arm.linux.org.uk>
References: <20090216103947.12d84612.sfr@canb.auug.org.au> <4998B0EC.5020302@bluewatersys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:45212 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754254AbZBPA35 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 15 Feb 2009 19:29:57 -0500
Content-Disposition: inline
In-Reply-To: <4998B0EC.5020302@bluewatersys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ryan Mallon <ryan@bluewatersys.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Marc Pignat <marc.pignat@hevs.ch>

On Mon, Feb 16, 2009 at 01:18:52PM +1300, Ryan Mallon wrote:
> Stephen Rothwell wrote:
> > Hi Russell,
> > 
> > Today's linux-next merge of the arm tree got a conflict in
> > arch/arm/mach-at91/gpio.c between commit
> > 2b768b6cdbcf7fa0761e6c35c6ea288297582c43 ("[ARM] 5391/1: AT91: Enable
> > GPIO clocks earlier") from the arm-current tree and commit
> > f373e8c0639f1720d2d0fe414990f504e113c2ba ("[ARM] 5373/2: Add gpiolib
> > support to AT91") from the arm tree.
> > 
> > Overlapping changes.  I fixed it up as below (which may not be correct,
> > so needs checking) and can carry the fix for a while.
> 
> The fix looks okay. Stupid question: What is the easiest/best way for me
> to apply the same fix into my tree to replicate the merge? My tree has
> some additional stuff in it to support the custom AT91 board I am using.
> I tried downloading the patch 5391/1 from the patch system and using
> git-apply, but there doesn't seem to be a way to force it into a merge
> like you can with git-am (and I can't find that patch on the mailing
> list). If I can figure out how to do this, I'll test the code to make
> sure it is still okay.

Probably the easiest solution is to wait for Linus to return (Tuesday?)
and then for me to push my master branch to Linus.  Once that's happened,
get 5391 rebased on top of your patch.  Or something like that.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
