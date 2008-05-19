From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Tests tree not submitted?
Date: Sun, 18 May 2008 22:00:03 -0700
Message-ID: <20080518220003.5169892a.akpm@linux-foundation.org>
References: <20080519135436.34d6d593.sfr@canb.auug.org.au>
	<20080519043822.GA3473@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:45759 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751417AbYESFBF (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 01:01:05 -0400
In-Reply-To: <20080519043822.GA3473@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ananth@in.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org

On Mon, 19 May 2008 10:08:22 +0530 Ananth N Mavinakayanahalli <ananth@in.ibm.com> wrote:

> On Mon, May 19, 2008 at 01:54:36PM +1000, Stephen Rothwell wrote:
> > Hi Ananth, Sam,
> 
> Hi Stephen,
> 
> > Is there some reason that the tests tree changes have not bee submitted
> > to Linus yet?  They have been in linux-next for quite some time now
> > (since February 24) without any changes.
> 
> When this was submitted last, the opinion was that since it was post
> 2.6.25-rc2 and since it had Kconfig changes, this should be deferred to
> the next release. However I got busy during the merge time and couldn't
> resumbit this.
> 
> I believe this being a code movement, its mostly benign. But if it needs
> to wait for 2.6.27, thats fine too; also given that the -mm is now based
> on -next, it'll get a lot more tested.
> 
> Andrew,
> 
> What is the best way forward here? Given the code has been in -next for
> a few months, and given -mm is now based on -next, will you be pushing
> these changes to Linus during the next merge window? Or, do you want me
> to resubmit the patchset again later in the 2.6.26-rc cycle?

<brief panic>

I don't even know what the "tests" tree _is_.

Searching the past seven weeks lmkl archives for From:.*ananth.* turns
up zero hits.

So whatever this thing is, it's waaaaaaaaaaaaaaaaaaaaay too low-profile.

Did you even send Linus a pull request?  I have no record of one.

Secret tree :(
