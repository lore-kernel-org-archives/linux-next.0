From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: Tests tree not submitted?
Date: Mon, 19 May 2008 10:08:22 +0530
Message-ID: <20080519043822.GA3473@in.ibm.com>
References: <20080519135436.34d6d593.sfr@canb.auug.org.au>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:55166 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785AbYESEhQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 May 2008 00:37:16 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m4J4bFUj011944
	for <linux-next@vger.kernel.org>; Mon, 19 May 2008 00:37:15 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id m4J4bEcs077458
	for <linux-next@vger.kernel.org>; Sun, 18 May 2008 22:37:14 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m4J4bExv005350
	for <linux-next@vger.kernel.org>; Sun, 18 May 2008 22:37:14 -0600
Content-Disposition: inline
In-Reply-To: <20080519135436.34d6d593.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org

On Mon, May 19, 2008 at 01:54:36PM +1000, Stephen Rothwell wrote:
> Hi Ananth, Sam,

Hi Stephen,

> Is there some reason that the tests tree changes have not bee submitted
> to Linus yet?  They have been in linux-next for quite some time now
> (since February 24) without any changes.

When this was submitted last, the opinion was that since it was post
2.6.25-rc2 and since it had Kconfig changes, this should be deferred to
the next release. However I got busy during the merge time and couldn't
resumbit this.

I believe this being a code movement, its mostly benign. But if it needs
to wait for 2.6.27, thats fine too; also given that the -mm is now based
on -next, it'll get a lot more tested.

Andrew,

What is the best way forward here? Given the code has been in -next for
a few months, and given -mm is now based on -next, will you be pushing
these changes to Linus during the next merge window? Or, do you want me
to resubmit the patchset again later in the 2.6.26-rc cycle?

Ananth
