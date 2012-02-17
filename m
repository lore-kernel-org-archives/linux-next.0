From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: build failure after merge of the staging tree
Date: Fri, 17 Feb 2012 09:23:23 -0800 (PST)
Message-ID: <f39ea8b1-32d8-4c55-b2ec-6ebf9f1292f2@default>
References: <20120217151030.59ce998d4b844faa0023750b@canb.auug.org.au>
 <20120217170407.GA25775@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:36245 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752495Ab2BQRXi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Feb 2012 12:23:38 -0500
In-Reply-To: <20120217170407.GA25775@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>

> From: Greg KH [mailto:greg@kroah.com]
> Sent: Friday, February 17, 2012 10:04 AM
> To: Stephen Rothwell
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Dan Magenheimer
> Subject: Re: linux-next: build failure after merge of the staging tree
> 
> On Fri, Feb 17, 2012 at 03:10:30PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> >
> > After merging the staging tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/built-in.o: In function `r2hb_hb_group_drop_item':
> > heartbeat.c:(.text+0x12cd7a): undefined reference to `config_item_put'
> > <snip>
> > drivers/built-in.o: In function `exit_r2nm':
> > nodemanager.c:(.exit.text+0x99b): undefined reference to `configfs_unregister_subsystem'
> >
> > This after I moved the tmem tree to before the staging tree to fix
> > yesterday's build failure.
> >
> > I have cherry-picked Greg's patch to disable building of the ramster code
> > for today (since it wasn't in his tree when I fetched it this morning).
> 
> Thank you for doing that, sorry I didn't get any of these build errors
> on my own.  That's what I get for applying patches while on the road and
> away from my big build systems to verify this :(

Yes, thanks from me also.  It occurs only for allmodconfig and I already have
a Kconfig fix* but not fully-tested yet so, figuring that Greg's CONFIG_BROKEN
patch would turn ramster off for now anyway, I didn't rush the fix to you or Greg.

Apologies again, but I am (slowly) learning. :-(

Dan

* RAMster does work very nicely but, for various reasons, requires
CONFIG_RAMSTER=y and CONFIG_CONFIGFS_FS=y, so ramster Kconfig needs
"depends on CONFIGFS_FS=y" not just "depends on CONFIGFS_FS".
(Patch forthcoming Greg.)
