From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 9 Dec 2015 10:03:35 +1100
Message-ID: <20151209100335.1adcf909@canb.auug.org.au>
References: <20151208215140.0c2ee0af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57718 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750780AbbLHXDh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2015 18:03:37 -0500
In-Reply-To: <20151208215140.0c2ee0af@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Cashman <dcashman@android.com>, Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org

Hi Andrew,

On Tue, 8 Dec 2015 21:51:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the akpm-current tree, today's linux-next build (arm64
> allnoconfig and others) failed like this:
> 
> arch/arm64/mm/mmap.c:54:1: error: unknown type name 'ifdef'
> arch/arm64/mm/mmap.c:55:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'if'
> arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
> arch/arm64/mm/mmap.c:58:2: error: #endif without #if
> 
> Caused by commit
> 
>   2e4614190421 ("arm64-mm-support-arch_mmap_rnd_bits-v4")
> 
> An obvious typo :-(
> 
> I will add the missing '#' tomorrow if it si not fixed by then.
> 
> Reported by Mark's build bot.

I have added this commit for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 9 Dec 2015 10:00:16 +1100
Subject: [PATCH] arm64-mm-support-arch_mmap_rnd_bits-v4-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/mm/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index af461b935137..e59a75a308bc 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -51,7 +51,7 @@ unsigned long arch_mmap_rnd(void)
 {
 	unsigned long rnd;
 
-ifdef CONFIG_COMPAT
+#ifdef CONFIG_COMPAT
 	if (test_thread_flag(TIF_32BIT))
 		rnd = (unsigned long)get_random_int() % (1 << mmap_rnd_compat_bits);
 	else
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
