From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 9/9] arm64: defconfig: enable the Qualcomm Technologies EMAC Ethernet driver
Date: Fri, 28 Apr 2017 16:06:03 -0500
Message-ID: <1493413563-18375-10-git-send-email-timur@codeaurora.org>
References: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938643AbdD1VGR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2017 17:06:17 -0400
In-Reply-To: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: timur@codeaurora.org

The EMAC is present on Qualcomm Technologies' server and some mobile
chips, and is used as the primary Ethernet interface.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 424064b..9f574c3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -191,6 +191,7 @@ CONFIG_IGBVF=y
 CONFIG_MVNETA=y
 CONFIG_MVPP2=y
 CONFIG_SKY2=y
+CONFIG_QCOM_EMAC=m
 CONFIG_RAVB=y
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
