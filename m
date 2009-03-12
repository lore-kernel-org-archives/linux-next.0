From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: [ipw3945-devel] X200 suspend status on -wl and -next
Date: Thu, 12 Mar 2009 13:30:43 -0400
Message-ID: <20090312173042.GD3410@tuxdriver.com>
References: <20090311073030.GA5284@denkbrett.schottelius.org> <200903110946.23280.rjw@sisk.pl> <20090311085229.GB4495@denkbrett.schottelius.org> <20090311184407.GG8761@tuxdriver.com> <20090312142003.GF30728@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:57109 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756190AbZCLRpi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2009 13:45:38 -0400
Content-Disposition: inline
In-Reply-To: <20090312142003.GF30728@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-ipw3945-devel@schottelius.org>, Nico Schottelius <nico-linux-20090311@schottelius.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, LKML <linux-kernel@>

On Thu, Mar 12, 2009 at 03:20:03PM +0100, Nico -telmich- Schottelius wrote:
> John W. Linville [Wed, Mar 11, 2009 at 02:44:07PM -0400]:
> > Any chance you'd like to try wireless-testing to help to isolate
> > possible sources of this problem?
> > 
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-testing.git
> 
> v2.6.29-rc7-17155-g2f7ab92 looks good (as in: wlan works after several
> suspends and resumes). But it seems you do not add the full kernel version:
> 
> sgnx20002:/home/nico/wireless-testing# git describe
> v2.6.29-rc7-17155-g2f7ab92
> sgnx20002:/home/nico/wireless-testing# uname -r
> 2.6.29-rc7-wl-ikn
> 
> Which is the kernel built some seconds before.

I don't know where you get the -ikn bits from, presumably from the
iwlwifi project.  Given what you said above, it would seem you are
getting your suspend/resume problems from them as well... :-(

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
