From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: tests tree unfetchable
Date: Tue, 29 Jul 2008 05:18:31 +0200
Message-ID: <20080729031831.GA27371@uranus.ravnborg.org>
References: <20080729100407.954c35f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:57215 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752761AbYG2DR5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 23:17:57 -0400
Content-Disposition: inline
In-Reply-To: <20080729100407.954c35f7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>, linux-next@vger.kernel.org

On Tue, Jul 29, 2008 at 10:04:07AM +1000, Stephen Rothwell wrote:
> Hi Sam, Ananth,
> 
> I am unable to fetch the tests tree this morning:
> 
> $ git fetch tests
> fatal: '/pub/scm/linux/kernel/git/sam/tests.git': unable to chdir or not a git archive
> fatal: The remote end hung up unexpectedly
> 
> Looking on master.kernel.org, I notice that there is
> a /pub/scm/linux/kernel/git/sam/test.git (note "test", not "tests")
> directory.  Would that be it?

Yes. I rebased it yesterday and accidently renamed it it.

	Sam
