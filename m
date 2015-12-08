From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 8 Dec 2015 21:51:40 +1100
Message-ID: <20151208215140.0c2ee0af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43906 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932537AbbLHKvm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2015 05:51:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Cashman <dcashman@android.com>, Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm64
allnoconfig and others) failed like this:

arch/arm64/mm/mmap.c:54:1: error: unknown type name 'ifdef'
arch/arm64/mm/mmap.c:55:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'if'
arch/arm64/mm/mmap.c:57:2: error: 'else' without a previous 'if'
arch/arm64/mm/mmap.c:58:2: error: #endif without #if

Caused by commit

  2e4614190421 ("arm64-mm-support-arch_mmap_rnd_bits-v4")

An obvious typo :-(

I will add the missing '#' tomorrow if it si not fixed by then.

Reported by Mark's build bot.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
