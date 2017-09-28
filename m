From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Thu, 28 Sep 2017 14:57:33 +1000
Message-ID: <20170928145733.09f080fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46741 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751591AbdI1E5f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Sep 2017 00:57:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rex Zhu <Rex.Zhu@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi Dave,

After merging the drm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.o:(.opd+0xd8): multiple definition of `ci_send_msg_to_smc'
drivers/gpu/drm/radeon/ci_smc.o:(.opd+0xc0): first defined here
drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.o: In function `.ci_send_msg_to_smc':
(.text+0xea0): multiple definition of `.ci_send_msg_to_smc'
drivers/gpu/drm/radeon/ci_smc.o:(.text+0x760): first defined here


Caused by commit

  9f4b35411cfe ("drm/amd/powerplay: add CI asics support to smumgr (v3)")

I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 Sep 2017 14:50:51 +1000
Subject: [PATCH] drm/amd/powerplay: uniquify ci_send_msg_to_smc

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c    | 4 ++--
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.h    | 2 +-
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c
index 9ee14315dce7..fcf88b8fc738 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c
@@ -208,7 +208,7 @@ static int ci_read_smc_sram_dword(struct pp_hwmgr *hwmgr, uint32_t smc_addr,
 	return 0;
 }
 
-int ci_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg)
+int sumgr_ci_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg)
 {
 	int ret;
 
@@ -231,7 +231,7 @@ int ci_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
 					uint16_t msg, uint32_t parameter)
 {
 	cgs_write_register(hwmgr->device, mmSMC_MSG_ARG_0, parameter);
-	return ci_send_msg_to_smc(hwmgr, msg);
+	return sumgr_ci_send_msg_to_smc(hwmgr, msg);
 }
 
 static void ci_initialize_power_tune_defaults(struct pp_hwmgr *hwmgr)
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.h b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.h
index cc4176d2d25f..61d17e354d6d 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.h
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.h
@@ -32,7 +32,7 @@ struct amd_pp_profile;
 
 int ci_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
 					uint16_t msg, uint32_t parameter);
-int ci_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg);
+int sumgr_ci_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg);
 int ci_populate_all_graphic_levels(struct pp_hwmgr *hwmgr);
 int ci_populate_all_memory_levels(struct pp_hwmgr *hwmgr);
 int ci_init_smc_table(struct pp_hwmgr *hwmgr);
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
index f265f42a7ed3..ce3c13f9e97b 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
@@ -68,7 +68,7 @@ const struct pp_smumgr_func ci_smu_funcs = {
 	.check_fw_load_finish = NULL,
 	.request_smu_load_fw = NULL,
 	.request_smu_load_specific_fw = NULL,
-	.send_msg_to_smc = ci_send_msg_to_smc,
+	.send_msg_to_smc = sumgr_ci_send_msg_to_smc,
 	.send_msg_to_smc_with_parameter = ci_send_msg_to_smc_with_parameter,
 	.download_pptable_settings = NULL,
 	.upload_pptable_settings = NULL,
-- 
2.14.1

-- 
Cheers,
Stephen Rothwell
