From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Sun, 19 Jan 2014 23:45:43 -0500
Message-ID: <CAJvTdKnoNh2YAvtXraYxTct+8e6e_8Om9cAZGSTpy8UO=t=W4w@mail.gmail.com>
References: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au>
	<20140116121955.GQ31570@twins.programming.kicks-ass.net>
	<20140117074628.88698f59939c9002b7c12968@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:47984 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752367AbaATEpp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2014 23:45:45 -0500
In-Reply-To: <20140117074628.88698f59939c9002b7c12968@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

+static void mwait_idle(void)
+{
+       mwait_idle_with_hints(0, 0);
+}
+

The reason the patch above will crash Core2 machines is because
core2 machines don't support mwait_idle_with_hints().

The calling sequence for old and new MWAIT instructions is different.
The former must be invoked with interrupts enabled,
and the later can be invoked with interrupts disabled,
which is a feature that Linux takes advantage of.

thanks,
-Len
