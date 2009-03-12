From: reinette chatre <reinette.chatre@intel.com>
Subject: Re: [ipw3945-devel] X200 suspend status on -wl and -next
Date: Thu, 12 Mar 2009 11:47:13 -0700
Message-ID: <1236883633.13699.31.camel@rc-desk>
References: <20090311073030.GA5284@denkbrett.schottelius.org>
	 <200903110946.23280.rjw@sisk.pl>
	 <20090311085229.GB4495@denkbrett.schottelius.org>
	 <20090311184407.GG8761@tuxdriver.com>
	 <20090312142003.GF30728@denkbrett.schottelius.org>
	 <20090312173042.GD3410@tuxdriver.com>  <1236882742.13699.28.camel@rc-desk>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:18792 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752683AbZCLSmK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 14:42:10 -0400
In-Reply-To: <1236882742.13699.28.camel@rc-desk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Nico Schottelius <nico-linux-20090311@schottelius.org>, LKML <linux-kernel@vger.kernel.org>, "ipw3945-devel@lists.sourceforge.net" <ipw3945-devel@lists.sourceforge.net>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Next Mailing List <linux-next@vger.kernel.org>

On Thu, 2009-03-12 at 11:32 -0700, Chatre, Reinette wrote:
> On Thu, 2009-03-12 at 10:30 -0700, John W. Linville wrote:
> > On Thu, Mar 12, 2009 at 03:20:03PM +0100, Nico -telmich- Schottelius wrote:
> > > John W. Linville [Wed, Mar 11, 2009 at 02:44:07PM -0400]:
> > > > Any chance you'd like to try wireless-testing to help to isolate
> > > > possible sources of this problem?
> > > > 
> > > > 	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-testing.git
> > > 
> > > v2.6.29-rc7-17155-g2f7ab92 looks good (as in: wlan works after several
> > > suspends and resumes). But it seems you do not add the full kernel version:
> > > 
> > > sgnx20002:/home/nico/wireless-testing# git describe
> > > v2.6.29-rc7-17155-g2f7ab92
> > > sgnx20002:/home/nico/wireless-testing# uname -r
> > > 2.6.29-rc7-wl-ikn
> > > 
> > > Which is the kernel built some seconds before.
> > 
> > I don't know where you get the -ikn bits from, presumably from the
> > iwlwifi project.  Given what you said above, it would seem you are
> > getting your suspend/resume problems from them as well... :-(
> 
> In our repo we do not add anything to the value of localversion. 

I have to clarify ... iwlwifi-2.6 does not add anything to localversion
that is already there from the wireless-testing repository. So,
iwlwifi-2.6 kernels will have identical name as wireless-testing
kernels.

Reinette
