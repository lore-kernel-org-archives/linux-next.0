From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-current
 tree
Date: Thu, 7 May 2009 08:54:18 +0200
Message-ID: <20090507085418.3f5206a3@hyperion.delvare>
References: <20090506131031.83f1b04d.sfr@canb.auug.org.au>
	<20090506071547.GA29466@flint.arm.linux.org.uk>
	<20090506092559.2d9e53cb@hyperion.delvare>
	<20090506190110.GB6897@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:23990 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318AbZEGGyj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 02:54:39 -0400
In-Reply-To: <20090506190110.GB6897@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Nicolas Pitre <nico@cam.org>, Wolfram Sang <w.sang@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>

Hi Russell,

On Wed, 6 May 2009 20:01:10 +0100, Russell King wrote:
> On Wed, May 06, 2009 at 09:25:59AM +0200, Jean Delvare wrote:
> > On Wed, 6 May 2009 08:15:48 +0100, Russell King wrote:
> > > Since defconfig updates are always going to create lots of noise, and
> > > the files are normally out of date, the *only* sensible way to handle
> > > updates is to have one tree dealing with them per architecture.
> > > 
> > > Spreading them across multiple trees and then expecting merges to sort
> > > out the resulting mess is unreasonable; they just change far too much
> > > when updates happen.  Moreover, defconfig updates should be in their
> > > own separate commit and not combined with other changes.
> > 
> > I fail to see how you can handle configuration option renames
> > gracefully with your proposed model.
> 
> That's not the point I'm making.  The point I'm making is about the
> merge issues which is the BIG and I mean BIG as in 1000ft tall
> letters BIG problem with scattering defconfig patches everywhere.
> 
> The reality of defconfigs is that they're normally months out of date
> with respect to the current kernel, and are occasionally updated by
> the platform maintainers on an occasional basis (as has happened with
> Nicolas' change which your tree has clashed with.)
> 
> I've heard it argued that the only people who should ever touch defconfig
> files are the platform maintainers themselves.  What I'm suggesting is
> one step closer to sanity than that position - having the arch maintainer
> responsible for dealing with all changes to those files, thereby providing
> a centralised point for synchronising and co-ordinating all defconfig
> updates.
> 
> If you think you have a better solution (no, throwing them into your own
> I2C tree is NOT a solution - it's a cause of major problems) then please
> state it.

Thanks for the explanation, I understand your point. I was updating the
defconfigs to make the maintainer's lives easier. If this has the
opposite effect, I'll just stop doing it, that's less work for me.

-- 
Jean Delvare
