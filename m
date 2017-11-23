From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 23 Nov 2017 13:01:09 +1100
Message-ID: <20171123130109.41f47546@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751525AbdKWCBL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Nov 2017 21:01:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/super.c: In function 'sget_userns':
fs/super.c:521:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
  register_shrinker(&s->s_shrink);
  ^
drivers/gpu/drm/ttm/ttm_page_alloc.c: In function 'ttm_pool_mm_shrink_init':
drivers/gpu/drm/ttm/ttm_page_alloc.c:451:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
  register_shrinker(&manager->mm_shrink);
  ^
drivers/gpu/drm/ttm/ttm_page_alloc_dma.c: In function 'ttm_dma_pool_mm_shrink_init':
drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1185:2: warning: ignoring return value of 'register_shrinker', declared with attribute warn_unused_result [-Wunused-result]
  register_shrinker(&manager->mm_shrink);
  ^

Introduced by commit

  488251e1e892 ("mm,vmscan: mark register_shrinker() as __must_check")

Yes, I realise that it is meant to flush the users out ...

-- 
Cheers,
Stephen Rothwell
