From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 14 Feb 2012 16:03:58 -0800
Message-ID: <20120215000358.GA27341@kroah.com>
References: <20120210155800.ccef418fd5c2f2b87a5d6315@canb.auug.org.au>
 <20120210052947.GA2068@kroah.com>
 <80f07411-179e-4fe9-b591-32fbcaac414b@default>
 <20120210174359.GB5128@kroah.com>
 <443c718c-643b-4b48-9dd8-e0424fc0afa9@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45878 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757416Ab2BOAEQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Feb 2012 19:04:16 -0500
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 295242091B
	for <linux-next@vger.kernel.org>; Tue, 14 Feb 2012 19:04:16 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <443c718c-643b-4b48-9dd8-e0424fc0afa9@default>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Seth Jennings <sjenning@linux.vnet.ibm.com>, Nitin Gupta <ngupta@vflare.org>, Konrad Wilk <konrad.wilk@oracle.com>

On Tue, Feb 14, 2012 at 03:43:31PM -0800, Dan Magenheimer wrote:
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Subject: Re: linux-next: build failure after merge of the staging tree
> > 
> > On Fri, Feb 10, 2012 at 09:21:46AM -0800, Dan Magenheimer wrote:
> > > > From: Greg KH [mailto:greg@kroah.com]
> > > > Subject: Re: linux-next: build failure after merge of the staging tree
> > > >
> > > > On Fri, Feb 10, 2012 at 03:58:00PM +1100, Stephen Rothwell wrote:
> > > > > Hi Greg,
> > > > >
> > > > > After merging the staging tree, today's linux-next build (x86_64
> > > > > allmodconfig) failed like this:
> > > > >
> > > > > drivers/staging/ramster/ramster_o2net.c: In function 'ramster_remote_async_get_request_handler':
> > > > > drivers/staging/ramster/ramster_o2net.c:91:2: error: implicit declaration of function
> > > > 'o2net_force_data_magic' [-Werror=implicit-function-declaration]
> > > > > drivers/staging/ramster/ramster_o2net.c: In function 'ramster_remote_put':
> > > > > drivers/staging/ramster/ramster_o2net.c:250:2: error: implicit declaration of function
> > > > 'o2net_nn_from_num' [-Werror=implicit-function-declaration]
> > > > > drivers/staging/ramster/zcache-main.c:40:64: fatal error: ../zram/xvmalloc.h: No such file or
> > > > directory
> > > > >
> > > > > Caused by commits ba351b02ab11 ("staging: ramster: local compression +
> > > > > tmem") and 14a3cd58dd4f ("staging: ramster: ramster-specific new files").
> > > > >
> > > > > I have used the version of the staging tree from next-20120209 for today.
> > > >
> > > > Ugh, I wonder why it builds here, very odd.
> > > >
> > > > Dan, care to send me a patch to fix this?
> > >
> > > > > drivers/staging/ramster/zcache-main.c:40:64: fatal error: ../zram/xvmalloc.h: No such
> > >
> > > Hmmm... it appears that Seth's zsmalloc patch for drivers/staging/zcache
> > > removed xvmalloc.[ch] from drivers/staging/zram while drivers/staging/ramster
> > > is still depending on it. :-(  I hadn't planned for both ramster
> > > and zsmalloc-replacing-xvmalloc to be merged at the same time... I guess
> > > this is exactly the kind of problem linux-next is designed to wring out!
> > >
> > > Greg, FOR NOW, PLEASE JUST REVERT the ramster patchset from staging-next.
> > > I am working on a v5 anyway and will roll in a copy of the xvmalloc.[ch]
> > > code into it for now and, since Seth's patch should be in linux-next
> > > by the time I am done (hopefully next week), I can test build ramster v5
> > > with linux-next to ensure all the above problems are resolved before
> > > resubmitting.
> > >
> > > (Seth, I could also switch ramster v5 to depend on zsmalloc instead of
> > > xvmalloc, but since I've done all my ramster testing on xvmalloc,
> > > I think I would prefer to make that transition later.)
> > >
> > > Sorry, Stephen and Greg, for the hassle!
> > 
> > Ok, now reverted, what a mess...
> > 
> > greg k-h
> 
> OK, I have just posted the ramster v5 patchset which applies against
> linux-3.2.  I've test-built it against linux-next... it only gets
> the normal minor merge conflicts for adding a line to
> drivers/staging/Makefile and Kconfig.

Please resend after fixing that conflict, as it would require me to edit
it by hand in order to apply this.  As you have already redone the
patch, there's no reason I should have to do this, right?

thanks,

greg k-h
