From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the tiny tree with the tip tree
Date: Tue, 25 Nov 2014 07:16:45 +0100
Message-ID: <20141125061645.GA15512@gmail.com>
References: <20141125170315.13157c60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:54964 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974AbaKYGQu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2014 01:16:50 -0500
Content-Disposition: inline
In-Reply-To: <20141125170315.13157c60@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Triplett <josh@joshtriplett.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Catalina Mocanu <catalina.mocanu@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Josh,
> 
> Today's linux-next merge of the tiny tree got a conflict in
> kernel/time/Makefile between commit fd866e2b116b ("time: Rename
> udelay_test.c to test_udelay.c") from the tip tree and commit
> d1f6d68d03ea ("kernel: time: Compile out NTP support") from the tiny
> tree.

So I think a timer subsystem commit d1f6d68d03ea with this 
magnitude of linecount increase:

 Signed-off-by: Catalina Mocanu <catalina.mocanu@gmail.com>
 [josh: Handle CONFIG_COMPAT=y.]
 Reviewed-by: Josh Triplett <josh@joshtriplett.org>
 Signed-off-by: Josh Triplett <josh@joshtriplett.org>
 ---
  drivers/pps/Kconfig        |  2 +-
  include/linux/timex.h      | 15 +++++++++++++--
  init/Kconfig               | 10 ++++++++++
  kernel/compat.c            |  8 ++++++--
  kernel/sys_ni.c            |  4 ++++
  kernel/time/Makefile       |  3 ++-
  kernel/time/ntp_internal.h | 28 ++++++++++++++++++++++++++++
  kernel/time/posix-timers.c |  2 ++
  kernel/time/time.c         |  2 ++
  kernel/time/timekeeping.c  |  2 ++
  10 files changed, 70 insertions(+), 6 deletions(-)

at minimum needs the ack of timer folks, before it can be 
committed to Git. Or is the tiny tree plan to submit all
patches to the appropriate subsystem or gather acks, before 
sending it upstream?

Thanks,

	Ingo
