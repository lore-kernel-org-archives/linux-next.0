From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-2008-11-28: bfin vs cpumask fixlet
Date: Fri, 28 Nov 2008 18:17:55 +0300
Message-ID: <20081128151755.GA27660@x200.localdomain>
References: <20081128213620.2ec593d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.172]:27490 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752308AbYK1PNz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 10:13:55 -0500
Received: by ug-out-1314.google.com with SMTP id 39so2000149ugf.37
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2008 07:13:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081128213620.2ec593d4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au

--- a/arch/blackfin/kernel/time-ts.c
+++ b/arch/blackfin/kernel/time-ts.c
@@ -162,7 +162,6 @@ static struct clock_event_device clockevent_bfin = {
 	.name		= "bfin_core_timer",
 	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
 	.shift		= 32,
-	.cpumask	= CPU_MASK_CPU0,
 	.set_next_event = bfin_timer_set_next_event,
 	.set_mode	= bfin_timer_set_mode,
 };
@@ -193,6 +192,7 @@ static int __init bfin_clockevent_init(void)
 	clockevent_bfin.mult = div_sc(timer_clk, NSEC_PER_SEC, clockevent_bfin.shift);
 	clockevent_bfin.max_delta_ns = clockevent_delta2ns(-1, &clockevent_bfin);
 	clockevent_bfin.min_delta_ns = clockevent_delta2ns(100, &clockevent_bfin);
+	clockevent_bfin.cpumask = cpumask_of(0);
 	clockevents_register_device(&clockevent_bfin);
 
 	return 0;
