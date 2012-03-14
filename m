From: Hugh Dickins <hughd@google.com>
Subject: Re: next-20120313 cpuidle freezes when booting
Date: Wed, 14 Mar 2012 12:03:37 -0700 (PDT)
Message-ID: <alpine.LSU.2.00.1203141156490.3826@eggly.anvils>
References: <alpine.LSU.2.00.1203131454500.1335@eggly.anvils> <4F608116.80508@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:38448 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751557Ab2CNTER (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Mar 2012 15:04:17 -0400
Received: by dadp12 with SMTP id p12so3369466dad.11
        for <linux-next@vger.kernel.org>; Wed, 14 Mar 2012 12:04:16 -0700 (PDT)
In-Reply-To: <4F608116.80508@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Robert Lee <rob.lee@linaro.org>, Jean Pihet <j-pihet@ti.com>, Kevin Hilman <khilman@ti.com>, Deepthi Dharwar <deepthi@linux.vnet.ibm.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 14 Mar 2012, Daniel Lezcano wrote:
> On 03/13/2012 11:29 PM, Hugh Dickins wrote:
> > Hi Stephen,
> > 
> > Yesterday's 3.3.0-rc7-next-20120313 gives me unpredictable freezes
> > on x86_64, on a ThinkPad T420s - I've not dared it on more machines.
> > 
> > Usually when booting up (sometimes just after Freeing unused kernel
> > memory, sometimes random places elsewhere), but occasionally it manages
> > to get as far as X; doesn't usually manage to complete suspend+resume.
> > 
> > 3.3.0-rc6-nex-20120309 behaved similarly; the last I tried before
> > that was 3.3.0-rc5-next20120227, which was okay.
> > 
> > Bisection led me to "cpuidle: Add common time keeping and irq enabling",
> > (from the cpuidle-cons tree I think), and reverting that has so far
> > given me a working system (it's a success if I complete this mail).
> > 
> > Below is the patch I've used to revert it (for other people having
> > problems with recent linux-next to try); but it's not quite correct,
> > because you did a merge on conflicting trees there, and I didn't spend
> > time to unravel all that, just get a working x86 system - since I've
> > left out some of your merge (in arch/arm/kernel/Makefile and arch/arm/
> > mach-at91/cpuidle.c), this reversion probably breaks arm as is.
> 
> Hi Hugh,
> 
> is it possible you give the cpuidle driver your host is using ?

"grep IDLE .config" tells me:

CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
CONFIG_ARCH_HAS_DEFAULT_IDLE=y
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
CONFIG_INTEL_IDLE=y
# CONFIG_I7300_IDLE is not set

but I've a feeling that isn't what you need to know.

Is there some /proc or /sys file I can read to tell you?

Though if it's something that changes dynamically, then what
I read now might not be what it would say when things go wrong.

I expect you've realized by now, I haven't a clue about cpuidle
drivers: I hadn't even realized that idleness needs a driver.

Hugh
