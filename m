From: Andres Salomon <dilinger@queued.net>
Subject: Re: linux-next: Tree for October 1 (staging/olpc_dcon)
Date: Sat, 2 Oct 2010 18:03:34 -0700
Message-ID: <20101002180334.7894bdfe@debxo>
References: <20101001153756.47b52566.sfr@canb.auug.org.au>
	<20101001154531.997630a2.randy.dunlap@oracle.com>
	<20101001192454.0a427cb0@debxo>
	<20101002185154.GA18020@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from LUNGE.MIT.EDU ([18.54.1.69]:56190 "EHLO lunge.queued.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752076Ab0JCBD2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 2 Oct 2010 21:03:28 -0400
In-Reply-To: <20101002185154.GA18020@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Chris Ball <cjb@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>

On Sat, 2 Oct 2010 11:51:54 -0700
Greg KH <gregkh@suse.de> wrote:

> On Fri, Oct 01, 2010 at 07:24:54PM -0700, Andres Salomon wrote:
> > On Fri, 1 Oct 2010 15:45:31 -0700
> > Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > 
> > > On Fri, 1 Oct 2010 15:37:56 +1000 Stephen Rothwell wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > Changes since 20100930:
> > > 
> > > 
> > > drivers/staging/olpc_dcon/olpc_dcon_xo_1.c:57: error: implicit
> > > declaration of function 'geode_gpio_event_irq'
> > > drivers/staging/olpc_dcon/olpc_dcon_xo_1.c:57: error: implicit
> > > declaration of function 'geode_gpio'
> > 
> > Yep, it's pending a cs5535-gpio patch
> > (https://patchwork.kernel.org/patch/209482/).
> 
> Wait, as I didn't apply the later patches, what I did apply should
> have still built properly (remember our rule, no breakage at any
> point in a patch series.)  So, should I revert the last olpc patch
> that caused this problem?
> 

Sorry, I thought that was made clear by the "this patch is necessary
for building the driver" comments in each patch description.  The
original driver that was submitted doesn't build unless all patches are
applied (the only which touches external APIs is the pending
cs5535-gpio one).
