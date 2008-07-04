From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Fri, 4 Jul 2008 09:35:16 +0200
Message-ID: <20080704093516.6d9a8195@hyperion.delvare>
References: <20080703133905.7b6f058f.sfr@canb.auug.org.au>
	<20080703054739.GA643@secretlab.ca>
	<9e4733910807030522h1aa0bl1801ecc5fc877c25@mail.gmail.com>
	<20080703152453.GB2284@secretlab.ca>
	<fa686aa40807032254j76dd1892y7af76c1a2d555809@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:2711 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754351AbYGDHgM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 03:36:12 -0400
In-Reply-To: <fa686aa40807032254j76dd1892y7af76c1a2d555809@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Jon Smirl <jonsmirl@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, galak@kernel.crashing.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Timur Tabi <timur@freescale.com>

On Thu, 3 Jul 2008 23:54:26 -0600, Grant Likely wrote:
> On Thu, Jul 3, 2008 at 9:24 AM, Grant Likely <grant.likely@secretlab.ca> wrote:
> > On Thu, Jul 03, 2008 at 08:22:18AM -0400, Jon Smirl wrote:
> >> Testing was good when the patch was initially posted in January. In
> >> the last six months the initial patch set has been sliced and diced
> >> into a bunch of different pieces but the contents of this patch are
> >> essentially unchanged.
> >>
> >> I don't care which tree it uses to get to mainline, I'd just like to
> >> see it get merged.
> >
> > Me too, but it is used by some of the mpc8xxx platforms too, so I'd like
> > to see an ack from one of those users also.
> 
> Okay, I've tested it on my board.  All looks good to me.  I'd prefer
> to hear back from one of the Freescale folks, but on a second reading
> I think it is pretty safe.  I'll make sure any merge conflicts are
> resolved.
> 
> Jean, is it okay with you to drop it from your tree and merge it through mine?

Sure, no problem. It's done now, the patch is yours.

-- 
Jean Delvare
