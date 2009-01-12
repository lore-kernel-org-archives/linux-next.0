From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: origin tree build failure
Date: Mon, 12 Jan 2009 10:32:14 +0100
Message-ID: <20090112093214.GA6798@elte.hu>
References: <20090112104837.69feedec.sfr@canb.auug.org.au> <1231719015.22571.4.camel@pasglop> <20090112090552.GD26750@elte.hu> <20090112202427.3b918490.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:44379 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751462AbZALJcl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2009 04:32:41 -0500
Content-Disposition: inline
In-Reply-To: <20090112202427.3b918490.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > It slipped through because it didnt get caught in build tests because 
> > cpufreq isnt enabled in the powerpc defconfig.
> 
> Which is one of the reasons we have linux-next: "integration testing".

Build bugs slipped through that net too in the past.

And we dont really want developers and maintainers to rely on an external 
middle man facility to be able to submit patches. So the best method is to 
make the defconfigs good enough to catch everyday build bugs. Random 
testing and linux-next can then catch the weird special cases as well.

	Ingo
