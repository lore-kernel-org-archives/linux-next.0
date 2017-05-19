From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Fri, 19 May 2017 12:10:01 +1000
Message-ID: <20170519121001.0515391c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44863 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752954AbdESCKD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 May 2017 22:10:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/gma500/mdfld_tpo_vid.c: In function 'tpo_vid_get_config_mode':
drivers/gpu/drm/gma500/mdfld_tpo_vid.c:34:31: warning: unused variable 'ti' [-Wunused-variable]
  struct oaktrail_timing_info *ti = &dev_priv->gct_data.DTD;
                               ^

Introduced by commit

  94d7fb4982d2 ("gpu: drm: gma500: remove dead code")

-- 
Cheers,
Stephen Rothwell
