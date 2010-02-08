From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] sched: Fix unused variable warning on UP (was: Re:
 linux-next: tip tree build warning)
Date: Mon, 8 Feb 2010 00:32:41 -0800
Message-ID: <20100208003241.1155a7e5.akpm@linux-foundation.org>
References: <10f740e81002071157p11b78784i8091d4790c29f30d@mail.gmail.com>
	<1265572738.12224.278.camel@laptop>
	<10f740e81002071226g3290d276q4c9df0e79a1e7ac0@mail.gmail.com>
	<10f740e81002071231j6977c6c7ie3f9e82bd0170f21@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:43730 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751066Ab0BHIdk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2010 03:33:40 -0500
In-Reply-To: <10f740e81002071231j6977c6c7ie3f9e82bd0170f21@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Sun, 7 Feb 2010 21:31:56 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Shouldn't put_cpu() take a (possibly dummy) `cpu' parameter, as
> returned by get_cpu()?

Yeah, that always seemed a bit screwy.  Something like this...

--- a/include/linux/smp.h~a
+++ a/include/linux/smp.h
@@ -177,6 +177,15 @@ smp_call_function_any(const struct cpuma
 #define put_cpu()		preempt_enable()
 
 /*
+ * This just exists to touch the `cpu' arg, to suppress unused var
+ * warnings
+ */
+static inline void put_cpu_nr(unsigned cpu)
+{
+	put_cpu();
+}
+
+/*
  * Callback to arch code if there's nosmp or maxcpus=0 on the
  * boot command line:
  */
_
