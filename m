From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: sparc64 build failure
Date: Fri, 20 Jun 2008 10:34:43 +0200
Message-ID: <20080620083443.GA23523@uranus.ravnborg.org>
References: <20080620104352.1358ff2a.sfr@canb.auug.org.au> <20080619.175520.231354507.davem@davemloft.net> <20080620073444.GA23126@uranus.ravnborg.org> <20080620175311.3ef1ea8b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:57995 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751866AbYFTId7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Jun 2008 04:33:59 -0400
Content-Disposition: inline
In-Reply-To: <20080620175311.3ef1ea8b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Fri, Jun 20, 2008 at 05:53:11PM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> On Fri, 20 Jun 2008 09:34:44 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > On Thu, Jun 19, 2008 at 05:55:20PM -0700, David Miller wrote:
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Fri, 20 Jun 2008 10:43:52 +1000
> > > 
> > > > Yesterday's linux-next build (sparc64 allmodconfig) failed like this:
> > > 
> > > Sam knowingly added this problem :-)
> > Yes - this is all my fault.
> > It must hurt a little before it becomes good!
> 
> Yep, OK.
> 
> Seriously, though the sparc64 allmodconfig has been broken by this for
> two days and we really don't want any deliberate bisection breakage if we
> can avoid it.

I have not looked into it yet. But I assume this is a merge issue.
sparc-next.git is OK
kbuild-next.git is OK

But when merged we break sparc64.
So I need to feed David a patch so I do not break it with kbuild-next.git,
or I need to do something in kbuil-next.git to avoid the breakage.

I will sort it out in the weekend.

	Sam
