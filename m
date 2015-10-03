From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad base of the h8300 tree
Date: Sat, 3 Oct 2015 14:28:38 +1000
Message-ID: <20151003142838.4bcd9570@canb.auug.org.au>
References: <20150831074304.0ce16f9f@canb.auug.org.au>
	<20150901074033.4282c9c4@canb.auug.org.au>
	<20150914095425.1c6c3470@canb.auug.org.au>
	<20150915091030.13b2a149@canb.auug.org.au>
	<20150915091201.6d1f620b@canb.auug.org.au>
	<87vbappzob.wl-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45201 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750698AbbJCE2k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 3 Oct 2015 00:28:40 -0400
In-Reply-To: <87vbappzob.wl-ysato@users.sourceforge.jp>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Yoshinori,

On Fri, 02 Oct 2015 15:11:48 +0900 Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> On Tue, 15 Sep 2015 08:12:01 +0900,
> Stephen Rothwell wrote:
> > 
> > On Tue, 15 Sep 2015 09:10:30 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Please do "gitk 9751a9e449da..h8300-next" in your tree and look at
> > > it (9751a9e449da is in Linus' tree).  As I suggested above, maybe you
> > > should go back to commit 99bcfda85f66 and work forward from there
> > > (after amending it have a SOB).  Or just start all over with v4.3 ...
> > 
> > I meant v4.3-rc1, of course.
> 
> OK.
> fixed it.

Well, not really :-(

It is now based on next-20150925.  As I have said before, you cannot
base your linux-next included branch on a linux-next release.  You
should either base it on Linus' tree, or one of the other linux-next
included branches (as long as that other branch is never rebased).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
