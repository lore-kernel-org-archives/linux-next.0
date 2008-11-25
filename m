From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] use limited register constraint for setnz
Date: Tue, 25 Nov 2008 08:22:09 +0100
Message-ID: <20081125072209.GC9660@elte.hu>
References: <alpine.DEB.1.10.0811250040060.2977@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:51949 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751287AbYKYHWX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 02:22:23 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.10.0811250040060.2977@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* Steven Rostedt <rostedt@goodmis.org> wrote:

> Impact: fix in compiling
> 
> GCC can decide to use %dil when "r" is used, which is not valid for
> setnz.
> 
> This bug was brought out by Stephen Rothwell's merging of the
> branch tracer into linux-next.
> 
> Signed-off-by: Steven Rostedt <srostedt@redhat.com>
> 
> diff --git a/arch/x86/boot/tty.c b/arch/x86/boot/tty.c
> index 0be77b3..c2121d2 100644
> --- a/arch/x86/boot/tty.c
> +++ b/arch/x86/boot/tty.c
> @@ -74,7 +74,7 @@ static int kbd_pending(void)
>  {
>  	u8 pending;
>  	asm volatile("int $0x16; setnz %0"
> -		     : "=rm" (pending)
> +		     : "=Qm" (pending)
>  		     : "a" (0x0100));
>  	return pending;
>  }

applied to tip/x86/urgent, thanks Steve!

	Ingo
