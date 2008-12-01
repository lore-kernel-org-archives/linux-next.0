From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Sun, 30 Nov 2008 23:23:18 -0800 (PST)
Message-ID: <20081130.232318.213950662.davem@davemloft.net>
References: <20081201104639.5080f12e.sfr@canb.auug.org.au>
	<20081201054140.GA21718@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:36088
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750748AbYLAHXR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2008 02:23:17 -0500
In-Reply-To: <20081201054140.GA21718@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sam@ravnborg.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 1 Dec 2008 06:41:40 +0100

> On Mon, Dec 01, 2008 at 10:46:39AM +1100, Stephen Rothwell wrote:
> > Hi Dave,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> >   GEN     /scratch/sfr/powerpc_ppc64_defconfig/Makefile
> > ***
> > *** Can't find default configuration "arch/sparc/configs/ppc64_defconfig"!
> > ***
> > 
> > Caused by commit 9cdcf85e1bf5dca97c1304292810041af2fcbd42 ("Subject:
> > [PATCH 08/10] sparc,sparc64: unify Makefile") which seems to arbitrarily
> > set SRCARCH in the top level make file to sparc!
> Crap - missed an if/endif
> Fix is simple:

Applied, thanks Sam.

World sparc domination almost worked :)
