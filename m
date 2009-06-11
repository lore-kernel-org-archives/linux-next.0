From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] x86: memtest: fix compile warning
Date: Thu, 11 Jun 2009 16:21:41 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.0906111512400.3372@localhost.localdomain>
References: <20090611112746.802a24cb.sfr@canb.auug.org.au> <20090611102927.GE12431@alberich.amd.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:42083 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751177AbZFKOWK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Jun 2009 10:22:10 -0400
In-Reply-To: <20090611102927.GE12431@alberich.amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andreas Herrmann <andreas.herrmann3@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 11 Jun 2009, Andreas Herrmann wrote:

> Commit c9690998ef48ffefeccb91c70a7739eebdea57f9
> (x86: memtest: remove 64-bit division) introduced following compile warning:
> 
>  arch/x86/mm/memtest.c: In function 'memtest':
>  arch/x86/mm/memtest.c:56: warning: comparison of distinct pointer types lacks a cast
>  arch/x86/mm/memtest.c:58: warning: comparison of distinct pointer types lacks a cast
> 
> Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
> ---
>  arch/x86/mm/memtest.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> Sorry.
> Please apply.

I applied it already, but zapped it right away, as it is bad style to
do the type casting in the loops. The proper fix is below.

But aside of that this code is confusing.

	start_phys_aligned = ALIGN(start_phys, incr);

Why do we have to fiddle with the alignment. Are you really seing e820
entries which are not 8 byte aligned ?

	for (p = start; p < end; p++, start_phys_aligned += incr) {
		if (*p == pattern)
			continue;
		if (start_phys_aligned == last_bad + incr) {
			last_bad += incr;
			continue;
		}
		if (start_bad)
			reserve_bad_mem(pattern, start_bad, last_bad + incr);
		start_bad = last_bad = start_phys_aligned;
	}
	if (start_bad)
		reserve_bad_mem(pattern, start_bad, last_bad + incr);

I really had to look more than once to understand what the heck
start_phys_aligned and last_bad + incr are doing. Really non
intuitive.

But the reserve_bad_mem() semantics are even more scary:

- if you hit flaky memory, which gives you bad and good results here
  and there, you call reserve_bad_mem() totally unbound which is
  likely to overflow the early reservation space and panics the
  machine. You need to keep track of those events somehow (e.g. in a
  bitmap) so you can detect such problems and mark the whole affected
  region bad in one go.

- you call reserve_early() which calls __reserve_early(....,
  overrun_ok = 0) so if you do the default multi pattern scan and each
  run sees the same region of broken memory you will trigger the
  "Overlapping early reservations" panic in __reserve_early() when you
  reserve that region the second time. Why do you run the test twice
  when the first one failed already ? Also there is no need to do the
  wipeout run in that case, which will trigger it as well!

So in both cases you panic the machine w/o need.

Please fix ASAP.

Thanks,

	tglx
---
diff --git a/arch/x86/mm/memtest.c b/arch/x86/mm/memtest.c
index d1c5cef..18d244f 100644
--- a/arch/x86/mm/memtest.c
+++ b/arch/x86/mm/memtest.c
@@ -40,16 +40,14 @@ static void __init reserve_bad_mem(u64 pattern, u64 start_bad, u64 end_bad)
 
 static void __init memtest(u64 pattern, u64 start_phys, u64 size)
 {
-	u64 *p, *end;
-	void *start;
+	u64 *p, *start, *end;
 	u64 start_bad, last_bad;
 	u64 start_phys_aligned;
-	size_t incr;
+	const size_t incr = sizeof(pattern);
 
-	incr = sizeof(pattern);
 	start_phys_aligned = ALIGN(start_phys, incr);
 	start = __va(start_phys_aligned);
-	end = (u64 *) (start + size - (start_phys_aligned - start_phys));
+	end = start + (size - (start_phys_aligned - start_phys)) / incr;
 	start_bad = 0;
 	last_bad = 0;
 
