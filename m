From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the tip tree with the  tree
Date: Fri, 13 May 2011 09:03:27 +0100
Message-ID: <20110513080327.GC12058@linux-mips.org>
References: <20110513131044.499e82d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from h5.dl5rb.org.uk ([81.2.74.5]:33779 "EHLO duck.linux-mips.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757787Ab1EMIC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 May 2011 04:02:27 -0400
Content-Disposition: inline
In-Reply-To: <20110513131044.499e82d0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, John Stultz <john.stultz@linaro.org>

On Fri, May 13, 2011 at 01:10:44PM +1000, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> arch/mips/kernel/i8253.c between commit 2b9b7cd782a5 ("clocksource:
> convert mips to generic i8253 clocksource") from the arm tree and commit
> 75c4fd8c7862 ("mips: convert to clocksource_register_hz/khz") from the
> tip tree.
> 
> The former seems to supercede the latter, so I used the former.

That's the right resolution, thanks!

  Ralf
