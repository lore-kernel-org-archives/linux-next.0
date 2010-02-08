From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] sched: Fix unused variable warning on UP (was: Re: 	linux-next:
 tip tree build warning)
Date: Mon, 08 Feb 2010 01:47:21 -0800
Message-ID: <4B6FDDA9.4000200@zytor.com>
References: <10f740e81002071157p11b78784i8091d4790c29f30d@mail.gmail.com>	 <1265572738.12224.278.camel@laptop>	 <10f740e81002071226g3290d276q4c9df0e79a1e7ac0@mail.gmail.com> <10f740e81002071231j6977c6c7ie3f9e82bd0170f21@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:60125 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751052Ab0BHJvc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Feb 2010 04:51:32 -0500
In-Reply-To: <10f740e81002071231j6977c6c7ie3f9e82bd0170f21@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On 02/07/2010 12:31 PM, Geert Uytterhoeven wrote:
>
> <trying to completely destroy my credibility>
> Shouldn't put_cpu() take a (possibly dummy) `cpu' parameter, as
> returned by get_cpu()?
> </trying>
>

Please tell me that you're joking.

There is absolutely no reason for it, since there is only one CPU that 
you can put (the one you're already on.)  The only thing that will 
happen if you insist on carrying the CPU number forward (unless it is 
used anyway) is that the compiler will generate worse code.

get_cpu() returning the CPU you're on is a convenience; it's so you 
don't need to do a third operation just to get your current CPU number, 
but it could just as easily be done that way.

	-hpa
