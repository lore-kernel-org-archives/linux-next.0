From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: PowerPC WARN_ON_ONCE() after merge of the final
 tree (tip related)
Date: Fri, 16 Apr 2010 12:38:43 +0200
Message-ID: <1271414323.4807.1931.camel@twins>
References: <20100415161214.04637496.sfr@canb.auug.org.au>
	 <20100415064940.GA9240@elte.hu> <20100415130032.GA6789@nowhere>
	 <20100415140358.GA19981@elte.hu>  <20100415171551.GA5069@nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53896 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751772Ab0DPKio convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2010 06:38:44 -0400
In-Reply-To: <20100415171551.GA5069@nowhere>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Thu, 2010-04-15 at 19:15 +0200, Frederic Weisbecker wrote:
> > that looks rather ugly. Why not do a raw:
> > 
> >       this_cpu_inc(lockdep_stats.redundant_hardirqs_on);
> > 
> > which basically open-codes debug_atomic_inc(), but without the warning?
> 
> 
> Because that would open a race against interrupts that might
> touch lockdep_stats.redundant_hardirqs_on too.


How so, its a pure per-cpu variable right? so either the increment
happens before the interrupts hits, or after, in either case there
should not be a race with interrupts.
