From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Fri, 7 Nov 2008 15:06:11 -0800
Message-ID: <20081107230611.GA400@kroah.com>
References: <20081107143046.7b2b171a.sfr@canb.auug.org.au> <1226079837.11596.19.camel@brick> <20081108095950.259305aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:59096 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751213AbYKGXWr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 18:22:47 -0500
Content-Disposition: inline
In-Reply-To: <20081108095950.259305aa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Harvey Harrison <harvey.harrison@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Sam Ravnborg <sam@ravnborg.org>

On Sat, Nov 08, 2008 at 09:59:50AM +1100, Stephen Rothwell wrote:
> Hi Harvey,
> 
> On Fri, 07 Nov 2008 09:43:57 -0800 Harvey Harrison <harvey.harrison@gmail.com> wrote:
> >
> > Is it really fair to drop the v4l tree when it was -staging that broke?  I'd humbly
> > suggest that staging be weighted somewhat lower than the other trees.
> 
> There is no staging tree in linux-next, that driver is in Linus' tree.  I
> agree that if there was a staging tree, it would be much lower priority.
> 
> Maybe we need some way to exclude the staging directory from
> all{yes,mod}config builds ...

Ah, ok, that makes more sense.

thanks,

greg k-h
