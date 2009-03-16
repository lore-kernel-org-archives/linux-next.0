From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] powerpc/5200: fix building GPT driver without sysfs
Date: Mon, 16 Mar 2009 19:17:51 +0300
Message-ID: <20090316161751.GA3622@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.190]:58438 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196AbZCPQSH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2009 12:18:07 -0400
Received: by ti-out-0910.google.com with SMTP id d10so2286980tib.23
        for <linux-next@vger.kernel.org>; Mon, 16 Mar 2009 09:18:03 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: grant.likely@secretlab.ca, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org

arch/powerpc/platforms/52xx/mpc52xx_gpt.c: In function 'mpc52xx_gpt_create_attribs':
arch/powerpc/platforms/52xx/mpc52xx_gpt.c:373: error: parameter name omitted
arch/powerpc/platforms/52xx/mpc52xx_gpt.c:373: warning: 'return' with a value, in function returning void

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 arch/powerpc/platforms/52xx/mpc52xx_gpt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index cb038dc..ef81cce 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -370,7 +370,7 @@ static void mpc52xx_gpt_create_attribs(struct mpc52xx_gpt_priv *gpt)
 }

 #else /* defined(CONFIG_SYSFS) */
-static void mpc52xx_gpt_create_attribs(struct mpc52xx_gpt_priv *) { return 0; }
+static inline void mpc52xx_gpt_create_attribs(struct mpc52xx_gpt_priv *gpt) {}
 #endif /* defined(CONFIG_SYSFS) */

 /* ---------------------------------------------------------------------
