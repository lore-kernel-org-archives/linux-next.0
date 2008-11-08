From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Sat, 8 Nov 2008 04:05:35 +0100
Message-ID: <20081108030535.GA14802@uranus.ravnborg.org>
References: <20081107143046.7b2b171a.sfr@canb.auug.org.au> <1226079837.11596.19.camel@brick> <20081108095950.259305aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:53611 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790AbYKHDGx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 22:06:53 -0500
Content-Disposition: inline
In-Reply-To: <20081108095950.259305aa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Harvey Harrison <harvey.harrison@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Greg KH <greg@kroah.com>

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

That is simple to do. Something like:

config STAGING_EXCLUDE_BUILD
	bool "Exclude Staging from the build"


And test for this in the Staging Makefile

When this is set to 'y' then we will not build
the staging tree.

	Sam
