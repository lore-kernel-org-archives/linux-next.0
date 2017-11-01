From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the drm tree
Date: Wed, 1 Nov 2017 14:16:40 +1100
Message-ID: <20171101141640.3ca7597f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44699 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751958AbdKADQn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Oct 2017 23:16:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Eric Anholt <eric@anholt.net>

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

drivers/gpu/drm/vc4/vc4_bo.c: In function 'vc4_bo_stats_debugfs':
drivers/gpu/drm/vc4/vc4_bo.c:91:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
   seq_printf(m, "%30s: %6dkb BOs (%d)\n", "userspace BO cache",
                 ^
drivers/gpu/drm/vc4/vc4_bo.c:95:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
   seq_printf(m, "%30s: %6dkb BOs (%d)\n", "total purged BO",
                 ^

Introduced by commit

  b9f19259b84d ("drm/vc4: Add the DRM_IOCTL_VC4_GEM_MADVISE ioctl")

-- 
Cheers,
Stephen Rothwell
