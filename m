From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH -next] x86 mrst: fix build error when X86_MRST is not
 enabled
Date: Fri, 30 Sep 2011 10:07:04 +0100
Message-ID: <20110930100704.6ea882c8@lxorguk.ukuu.org.uk>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
	<4E84D684.107@xenotime.net>
	<20110929235708.1bbd1166@lxorguk.ukuu.org.uk>
	<20110929161040.41f23573.akpm00@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110929161040.41f23573.akpm00@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm00@gmail.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: linux-next.vger.kernel.org

> > This breaks Medfield so NAK
> > 
> > The correct behaviour should be 
> > 
> > INTEL_MID defined -> mrst_cpu_chip has meaning
> > INTEL_MID not defined -> mrst_identify_chip is 0
> > 
> > your change makes it 0 for Medfield which means it will crash on boot.
> 
> Randy's patch is an attempt to fix Mathias's "x86: rtc: don't register
> a platform RTC device for Intel MID platforms".

NAK this.

> I'm tempted to do a mass droppage, but then some of the patches might
> get forever lost.

Randy's patch breaks Medfield, simply because he's seeing an incomplete
set of merges. The stuff the x86 maintainers were sent already deals with
this. It's all simply a case of waiting for the trees to get back into
sync, at which point platform/x86/mrst will get built for INTEL_MID
general case.

> Could we please get some x86 maintainers on deck??

Well currently x86@kernel.org is undeliverable so that won't help you.

Alan
