From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH -next] at91rm9200 vs cpumask changes
Date: Fri, 28 Nov 2008 13:39:13 +0300
Message-ID: <20081128103913.GA8488@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.191]:31980 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247AbYK1KfP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 05:35:15 -0500
Received: by nf-out-0910.google.com with SMTP id d3so720709nfc.21
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2008 02:35:12 -0800 (PST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, rusty@rustcorp.com.au

--- a/arch/arm/mach-at91/at91rm9200_time.c
+++ b/arch/arm/mach-at91/at91rm9200_time.c
@@ -169,7 +169,6 @@ static struct clock_event_device clkevt = {
 	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
 	.shift		= 32,
 	.rating		= 150,
-	.cpumask	= CPU_MASK_CPU0,
 	.set_next_event	= clkevt32k_next_event,
 	.set_mode	= clkevt32k_mode,
 };
@@ -197,7 +196,7 @@ void __init at91rm9200_timer_init(void)
 	clkevt.mult = div_sc(AT91_SLOW_CLOCK, NSEC_PER_SEC, clkevt.shift);
 	clkevt.max_delta_ns = clockevent_delta2ns(AT91_ST_ALMV, &clkevt);
 	clkevt.min_delta_ns = clockevent_delta2ns(2, &clkevt) + 1;
-	clkevt.cpumask = cpumask_of_cpu(0);
+	clkevt.cpumask = cpumask_of(0);
 	clockevents_register_device(&clkevt);
 
 	/* register clocksource */
