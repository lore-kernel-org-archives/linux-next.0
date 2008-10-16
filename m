From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: origin tree build failure
Date: Thu, 16 Oct 2008 13:58:17 +0100
Message-ID: <20081016125817.GA28746@linux-mips.org>
References: <20081016113112.698aa9ae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from h4.dl5rb.org.uk ([81.2.74.4]:50868 "EHLO
	ditditdahdahdah-dahdahdahditdit.dl5rb.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751255AbYJPNTh (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 09:19:37 -0400
Content-Disposition: inline
In-Reply-To: <20081016113112.698aa9ae.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, LKML <linux-kernel@vger.kernel.org>

On Thu, Oct 16, 2008 at 11:31:12AM +1100, Stephen Rothwell wrote:

> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/rtc/rtc-ds1286.c: In function 'ds1286_rtc_read':
> drivers/rtc/rtc-ds1286.c:33: error: implicit declaration of function '__raw_readl'
> drivers/rtc/rtc-ds1286.c: In function 'ds1286_rtc_write':
> drivers/rtc/rtc-ds1286.c:38: error: implicit declaration of function '__raw_writel'
> drivers/rtc/rtc-ds1286.c: In function 'ds1286_probe':
> drivers/rtc/rtc-ds1286.c:345: error: implicit declaration of function 'ioremap'
> drivers/rtc/rtc-ds1286.c:345: warning: assignment makes pointer from integer without a cast
> drivers/rtc/rtc-ds1286.c:365: error: implicit declaration of function 'iounmap'
> 
> Caused by commit 5f119f29063c9a9bf1ab40112c02710c2db84f29 ("MIPS: DS1286:
> New RTC driver") which presumably needs to depend in some architecture or
> feature.
> 
> I just reverted it for now.

It's just missing an include which Geert has already posted in a different
thread.

As far as I can say these two RTC chips are only being uses in MIPS
systems so maybe it's a good idea to allow configuring the driver if it
builds and does no harm on another platform/architecture?  I can cook up
a patch if that's what people want.

  Ralf
