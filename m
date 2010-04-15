From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: PowerPC WARN_ON_ONCE() after merge of the final tree
 (tip related)
Date: Thu, 15 Apr 2010 09:32:56 +0200
Message-ID: <20100415073256.GG9240@elte.hu>
References: <20100415161214.04637496.sfr@canb.auug.org.au>
 <20100415064940.GA9240@elte.hu>
 <20100414.235557.123118153.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:44528 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757357Ab0DOHdJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Apr 2010 03:33:09 -0400
Content-Disposition: inline
In-Reply-To: <20100414.235557.123118153.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, linuxppc-dev@lists.ozlabs.org


* David Miller <davem@davemloft.net> wrote:

> From: Ingo Molnar <mingo@elte.hu>
> Date: Thu, 15 Apr 2010 08:49:40 +0200
> 
> > Btw., WARN_ON trapping on PowerPC is clearly a PowerPC bug - there's a good 
> > reason we have WARN_ON versus BUG_ON - it should be fixed.
> 
> I disagree, an implementation should be allowed to use the most
> efficient implementation possible for both interfaces.

It trades robustness for slightly better space/code efficiency.

Such a trap based mechanism exists on x86 as well and we use it for BUG_ON(). 
We intentionally dont use it to generate warnings and dont override __WARN(), 
because it would blow up way too often when a warning triggers in some 
sensitive codepath that cannot take a trap.

Anyway, the warning obviously has to be fixed - but the boot crash itself is 
PowerPC's own doing.

	Ingo
