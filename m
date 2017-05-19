From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the drm tree
Date: Fri, 19 May 2017 12:07:29 +1000
Message-ID: <20170519120729.597f5a9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40041 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752083AbdESCHb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 May 2017 22:07:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Cooksey <tom.cooksey@arm.com>, Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

drivers/gpu/drm/pl111/pl111_drv.c:81:12: warning: 'pl111_modeset_init' defined but not used [-Wunused-function]
 static int pl111_modeset_init(struct drm_device *dev)
            ^
drivers/gpu/drm/pl111/pl111_drv.c:149:26: warning: 'pl111_drm_driver' defined but not used [-Wunused-variable]
 static struct drm_driver pl111_drm_driver = {
                          ^

Introduced by commit

  bed41005e617 ("drm/pl111: Initial drm/kms driver for pl111")

-- 
Cheers,
Stephen Rothwell
