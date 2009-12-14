From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: origin tree build warning
Date: Sun, 13 Dec 2009 23:24:03 -0800
Message-ID: <1260775443.18538.16.camel@Joe-Laptop.home>
References: <20091214102415.10bdcf24.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:1165 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754637AbZLNHYF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2009 02:24:05 -0500
In-Reply-To: <20091214102415.10bdcf24.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, 2009-12-14 at 10:24 +1100, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> arch/x86/mm/mmio-mod.c: In function 'print_pte':
> Caused by commit 3a0340be06a9356eb61f6804107480acbe62c069 ("x86:
> mmio-mod.c: Use pr_fmt").  Was this even build tested?  The patch doesn't
> even match the commit message.

Dunno how that happened, it was tested here
with #define pr_fmt(fmt) "mmiotrace: " fmt

Here's the diff necessary to make it work.

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index 4c765e9..34a3291 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -20,7 +20,7 @@
  * Derived from the read-mod example from relay-examples by Tom Zanussi.
  */
 
-#define pr_fmt(fmt) "mmiotrace: "
+#define pr_fmt(fmt) "mmiotrace: " fmt
 
 #define DEBUG 1
 
