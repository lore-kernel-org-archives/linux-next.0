From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: Tests tree not submitted?
Date: Mon, 19 May 2008 11:19:40 +0530
Message-ID: <20080519054940.GB3473@in.ibm.com>
References: <20080519135436.34d6d593.sfr@canb.auug.org.au> <20080519043822.GA3473@in.ibm.com> <20080518220003.5169892a.akpm@linux-foundation.org>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e6.ny.us.ibm.com ([32.97.182.146]:33285 "EHLO e6.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752699AbYESFsu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 01:48:50 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m4J5om5h017026
	for <linux-next@vger.kernel.org>; Mon, 19 May 2008 01:50:48 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id m4J5mRJU152002
	for <linux-next@vger.kernel.org>; Mon, 19 May 2008 01:48:27 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m4J5mQW3014290
	for <linux-next@vger.kernel.org>; Mon, 19 May 2008 01:48:27 -0400
Content-Disposition: inline
In-Reply-To: <20080518220003.5169892a.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org

On Sun, May 18, 2008 at 10:00:03PM -0700, Andrew Morton wrote:
> On Mon, 19 May 2008 10:08:22 +0530 Ananth N Mavinakayanahalli <ananth@in.ibm.com> wrote:
> 
> > On Mon, May 19, 2008 at 01:54:36PM +1000, Stephen Rothwell wrote:
> > > Hi Ananth, Sam,
> > 
> > Hi Stephen,
> > 
> > > Is there some reason that the tests tree changes have not bee submitted
> > > to Linus yet?  They have been in linux-next for quite some time now
> > > (since February 24) without any changes.
> > 
> > When this was submitted last, the opinion was that since it was post
> > 2.6.25-rc2 and since it had Kconfig changes, this should be deferred to
> > the next release. However I got busy during the merge time and couldn't
> > resumbit this.
> > 
> > I believe this being a code movement, its mostly benign. But if it needs
> > to wait for 2.6.27, thats fine too; also given that the -mm is now based
> > on -next, it'll get a lot more tested.
> > 
> > Andrew,
> > 
> > What is the best way forward here? Given the code has been in -next for
> > a few months, and given -mm is now based on -next, will you be pushing
> > these changes to Linus during the next merge window? Or, do you want me
> > to resubmit the patchset again later in the 2.6.26-rc cycle?
> 
> <brief panic>

Oops! Sorry Andrew :-)

> I don't even know what the "tests" tree _is_.
> 
> Searching the past seven weeks lmkl archives for From:.*ananth.* turns
> up zero hits.

http://marc.info/?l=linux-kernel&m=120285599718700&w=2 is Sam's mail to
lkml about it.

> So whatever this thing is, it's waaaaaaaaaaaaaaaaaaaaay too low-profile.

Yes, its nothing earth shattering :-) Just code consolidation.

> Did you even send Linus a pull request?  I have no record of one.

Sam did http://marc.info/?l=linux-kernel&m=120285599718700&w=2 again.

Ananth
