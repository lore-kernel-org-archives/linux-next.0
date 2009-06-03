From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for June 3 (staging)
Date: Wed, 3 Jun 2009 16:11:52 -0700
Message-ID: <20090603231152.GA18701@suse.de>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au> <4A2695C1.2060104@oracle.com> <20090603152558.GA25725@suse.de> <4A269971.1050004@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54599 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756028AbZFCXPz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 19:15:55 -0400
Content-Disposition: inline
In-Reply-To: <4A269971.1050004@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Gao Yunpeng <yunpeng.gao@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jun 03, 2009 at 08:40:33AM -0700, Randy Dunlap wrote:
> Greg KH wrote:
> > On Wed, Jun 03, 2009 at 08:24:49AM -0700, Randy Dunlap wrote:
> >> Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Looks like a real rush since -rc7 ...
> >>
> >> drivers/staging/comedi/drivers/adq12b.c:328: error: implicit declaration of function 'udelay'
> >>
> >>
> >> drivers/staging/mrst_nand/ffsport.c:360:error: 'struct request' has no member named 'sector'
> >> drivers/staging/mrst_nand/ffsport.c:376:error: 'struct request' has no member named 'sector'
> >> drivers/staging/mrst_nand/ffsport.c:376:error: 'struct request' has no member named 'current_nr_sectors'
> >> drivers/staging/mrst_nand/ffsport.c:380:error: 'struct request' has no member named 'sector'
> >> drivers/staging/mrst_nand/ffsport.c:381:error: 'struct request' has no member named 'current_nr_sectors'
> >> drivers/staging/mrst_nand/ffsport.c:392:error: 'struct request' has no member named 'current_nr_sectors'
> >> drivers/staging/mrst_nand/ffsport.c:499:error: implicit declaration of function 'elv_next_request'
> >> drivers/staging/mrst_nand/ffsport.c:517:error: implicit declaration of function 'end_request'
> >> drivers/staging/mrst_nand/ffsport.c:738:error: implicit declaration of function 'blk_queue_hardsect_size'
> > 
> > Can I get your .config for this?  It works here with a "default" one.
> 
> attached (for mrst_nand/ffsport.c build errors)

Ah, thanks, figured it out.

Gao, this looks like a problem in your ffsport.c code.  It isn't up to
date with the 2.6.30-rc8 kernel tree.  Care to send me a follow-on patch
to fix this up?

thanks,

greg k-h
