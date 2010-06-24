From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Thu, 24 Jun 2010 10:09:17 +0100
Message-ID: <20100624090917.GA25508@flint.arm.linux.org.uk>
References: <20100624021949.62910287.sfr@canb.auug.org.au> <20100624103619.46a88a63.sfr@canb.auug.org.au> <1277370056.30452.9.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:36511 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754340Ab0FXJJh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2010 05:09:37 -0400
Content-Disposition: inline
In-Reply-To: <1277370056.30452.9.camel@e102109-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Carmody <ext-phil.2.carmody@nokia.com>

On Thu, Jun 24, 2010 at 10:00:56AM +0100, Catalin Marinas wrote:
> On Thu, 2010-06-24 at 10:36 +1000, Stephen Rothwell wrote:
> > Hi Russell,
> > 
> > On Thu, 24 Jun 2010 02:19:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the final tree, the next-20100616 and later linux-next
> > > builds for most arm configs (including versatile_defconfig) failed like this:
> > > 
> > > In file included from include/linux/module.h:23,
> > >                  from include/linux/device.h:23,
> > >                  from include/linux/dma-mapping.h:4,
> > >                  from arch/arm/kernel/asm-offsets.c:15:
> > > include/trace/events/module.h:11: error: two or more data types in declaration 
> > > 
> > > Reverting commit f0028612a8ffedcdafa8b7ae83ab090d8b0318b4 ("ARM: 6171/1:
> > > module - simplify unwind table handling") (and
> > > cecaa4c6b8173b02c9f7ecfdbbc81f573a7a9f33 ("ARM: 6172/1: module -
> > > additional unwind tables for exit/devexit sections") that depends on it)
> > > fixes this build error.
> > 
> > I have reverted those 2 commits in linux-next today.
> 
> Thanks. Stephen, do you build with just the standard defconfig for
> ARCH=arm?

The linux-next website has all the build results for all the defconfigs.
You can get to the ARM build results via:

  http://kisskb.ellerman.id.au/kisskb/compiler/11/

> Phil, could you please add a semicolon after '}' and send Russell a
> patch?

... and also test the result before sending.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
