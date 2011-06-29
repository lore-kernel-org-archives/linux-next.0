From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: linux-next: build failure after merge of the security-testing tree
Date: Wed, 29 Jun 2011 13:16:35 +0900
Message-ID: <201106291316.CDF48413.JtQVLOFSFOOFMH@I-love.SAKURA.ne.jp>
References: <20110629134800.9ee0d5b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www262.sakura.ne.jp ([202.181.97.72]:62892 "EHLO
	www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942Ab1F2EQx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jun 2011 00:16:53 -0400
In-Reply-To: <20110629134800.9ee0d5b7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, jmorris@namei.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp

Stephen Rothwell wrote:
> Hi James,
> 
> After merging the security-testing tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> security/built-in.o: In function `tomoyo_bprm_set_creds':
> tomoyo.c:(.text+0x4698e): undefined reference to `tomoyo_load_policy'
> 
Sorry. I forgot to add #ifndef there.
It is for embedded systems where running userspace policy loader is difficult.
Below patch fixes the error.

Regards.
---
 From 262f32874cd073fe2684e07dc838381f1dd01fd4 Mon Sep 17 00:00:00 2001
 From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Wed, 29 Jun 2011 13:07:52 +0900
Subject: [PATCH] TOMOYO: Fix build error with CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y .

I forgot to add #ifndef in commit 0e4ae0e0 "TOMOYO: Make several options
configurable.", resulting

  security/built-in.o: In function `tomoyo_bprm_set_creds':
  tomoyo.c:(.text+0x4698e): undefined reference to `tomoyo_load_policy'

error.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 security/tomoyo/tomoyo.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index 2615c7d..d6f68a0 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -51,12 +51,14 @@ static int tomoyo_bprm_set_creds(struct linux_binprm *bprm)
 	 */
 	if (bprm->cred_prepared)
 		return 0;
+#ifndef CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER
 	/*
 	 * Load policy if /sbin/tomoyo-init exists and /sbin/init is requested
 	 * for the first time.
 	 */
 	if (!tomoyo_policy_loaded)
 		tomoyo_load_policy(bprm->filename);
+#endif
 	/*
 	 * Release reference to "struct tomoyo_domain_info" stored inside
 	 * "bprm->cred->security". New reference to "struct tomoyo_domain_info"
-- 
1.6.1
