From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Fri, 7 Nov 2008 10:41:48 -0800
Message-ID: <20081107184148.GA2320@kroah.com>
References: <20081107143046.7b2b171a.sfr@canb.auug.org.au> <1226079837.11596.19.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:57287 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752406AbYKGUMu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 15:12:50 -0500
Content-Disposition: inline
In-Reply-To: <1226079837.11596.19.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

On Fri, Nov 07, 2008 at 09:43:57AM -0800, Harvey Harrison wrote:
> On Fri, 2008-11-07 at 14:30 +1100, Stephen Rothwell wrote:
> > Hi Mauro,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/staging/go7007/go7007-v4l2.c: In function 'go7007_ioctl':
> > drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 1 of 'video_usercopy' from incompatible pointer type
> > drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 2 of 'video_usercopy' makes integer from pointer without a cast
> > drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 4 of 'video_usercopy' makes pointer from integer without a cast
> > drivers/staging/go7007/go7007-v4l2.c:1338: error: too many arguments to function 'video_usercopy'
> > 
> > Caused by commit 579209181bfc24ee03a0d167bdc32106afd4e269 ("V4L/DVB
> > (9503): v4l: remove inode argument from video_usercopy") which missed the
> > above driver.
> > 
> > I have dropped your tree again for today.
> 
> Is it really fair to drop the v4l tree when it was -staging that broke?  I'd humbly
> suggest that staging be weighted somewhat lower than the other trees.

I agree, please always drop the staging tree, not any "real" tree :)

thanks,

greg k-h
