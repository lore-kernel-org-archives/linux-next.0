From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] use limited register constraint for setnz
Date: Tue, 25 Nov 2008 00:42:37 -0500 (EST)
Message-ID: <alpine.DEB.1.10.0811250040060.2977@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:40188 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751154AbYKYFmk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 00:42:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


Impact: fix in compiling

GCC can decide to use %dil when "r" is used, which is not valid for
setnz.

This bug was brought out by Stephen Rothwell's merging of the
branch tracer into linux-next.

Signed-off-by: Steven Rostedt <srostedt@redhat.com>

diff --git a/arch/x86/boot/tty.c b/arch/x86/boot/tty.c
index 0be77b3..c2121d2 100644
--- a/arch/x86/boot/tty.c
+++ b/arch/x86/boot/tty.c
@@ -74,7 +74,7 @@ static int kbd_pending(void)
 {
 	u8 pending;
 	asm volatile("int $0x16; setnz %0"
-		     : "=rm" (pending)
+		     : "=Qm" (pending)
 		     : "a" (0x0100));
 	return pending;
 }
