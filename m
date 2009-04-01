From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tracing/powerpc tree build failure
Date: Wed, 1 Apr 2009 14:51:48 +0200
Message-ID: <20090401125148.GL12966@elte.hu>
References: <20090327230834.93d0221d.sfr@canb.auug.org.au> <1238158131.22033.10.camel@localhost.localdomain> <20090331165430.383fe51d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:54369 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752400AbZDAMwK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Apr 2009 08:52:10 -0400
Content-Disposition: inline
In-Reply-To: <20090331165430.383fe51d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <srostedt@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> This patch is now applicable to the tracing tree after merging 
> with Linus' tree.

Thanks, that's useful info.

There's the skb tracepoints related merge fixlet needed too. 
Anything else in this context you are aware of?

	Ingo
