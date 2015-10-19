From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad base of the h8300 tree
Date: Tue, 20 Oct 2015 08:57:43 +1100
Message-ID: <20151020085743.4c7d4d3f@canb.auug.org.au>
References: <20150831074304.0ce16f9f@canb.auug.org.au>
	<20150901074033.4282c9c4@canb.auug.org.au>
	<20150914095425.1c6c3470@canb.auug.org.au>
	<20150915091030.13b2a149@canb.auug.org.au>
	<20150915091201.6d1f620b@canb.auug.org.au>
	<87vbappzob.wl-ysato@users.sourceforge.jp>
	<20151003142838.4bcd9570@canb.auug.org.au>
	<20151015092157.757b4452@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38034 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752664AbbJSV5p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Oct 2015 17:57:45 -0400
In-Reply-To: <20151015092157.757b4452@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Thu, 15 Oct 2015 09:21:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Sat, 3 Oct 2015 14:28:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > It is now based on next-20150925.  As I have said before, you cannot
> > base your linux-next included branch on a linux-next release.  You
> > should either base it on Linus' tree, or one of the other linux-next
> > included branches (as long as that other branch is never rebased).  
> 
> OK, now your tree is no longer based on a linux-next release (thanks).
> However, you have managed to rebase a whole string of post v4.3-rc5
> commits from Linus' tree into your tree.  This would mean that we would
> end up with duplicates of those patches.  Please just rebase your
> patches (and just your patches) onto some part of Linus' tree.

And now that you have merged in v4.3-rc6, just do a "git rebase
v4.3-rc6", please (you still have duplicates of some of the patches in
Linus' tree between -rc5 and -rc6.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
