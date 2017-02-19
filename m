From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the drm tree
Date: Mon, 20 Feb 2017 10:48:45 +1100
Message-ID: <20170220104845.0f71eec9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45619 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751626AbdBSXsv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Feb 2017 18:48:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>

Hi Dave,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

drivers/gpu/drm/sti/sti_vtg.c: In function 'vtg_probe':
drivers/gpu/drm/sti/sti_vtg.c:392:22: warning: unused variable 'np' [-Wunused-variable]
  struct device_node *np;
                      ^

Introduced by commit

  0c7ff84f7f9d ("drm/sti: remove deprecated legacy vtg slave")

drivers/gpu/drm/sti/sti_drv.c:120:13: warning: 'sti_drm_dbg_cleanup' defined but not used [-Wunused-function]
 static void sti_drm_dbg_cleanup(struct drm_minor *minor)
             ^

Introduced by commit

  5e60f595d6ca ("drm/sti: use atomic_helper for commit")

[BTW, this latter commit has no Signed-off-by from its committer :-(]

-- 
Cheers,
Stephen Rothwell
