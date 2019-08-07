Return-Path: <SRS0=ikMb=WD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E94C31E40
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 02:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42B57208C3
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 02:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcewzGRW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729248AbfHGCYA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 22:24:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43585 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728994AbfHGCYA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Aug 2019 22:24:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id r26so6646876pgl.10
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2019 19:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pkL8MY9zC5v+zrBda/zPQm0g3an3ptjtpVdI7jzPVfs=;
        b=hcewzGRW803/McXeTj5WrIwfjtIILcuMOhhJI0+XH2tVg9fxh/5KolBT0x1b5T51+R
         XQ7IzrsxAVtHeyFEBDzoK5YSDcR82uErm3bVWGbHKSg1K4zRos0VapMK+1uxdw/foioe
         8U99TG1Qn/sp68fFKtdn6NTCKGlwrmX0NtkvzSDWUbbHDKqXSrIiBsfWxTVkj/N/HyjT
         iBlOtyfqcbF00/ppnxcHXZDVoeccewmF/JIELCQ0/o5INRAL4oHH+C/PTBqw4XC3Tb6P
         RFC6O+PCswW6u79cxA/A/infPSvko1boCXwi+HBSH6bCnN9eOji0e8EqlqN67zYuqmqS
         OzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pkL8MY9zC5v+zrBda/zPQm0g3an3ptjtpVdI7jzPVfs=;
        b=qxLwVjCpTW8iAwTXObKB7pbS2wvB9WE6jpHJzkV3M7d229KTTVuZ2oK0a21pNYoT0f
         Tw1bBhOVYD/ol/lP7HPxxbbbREKvAPUPYxInRcbchwzg9cQC1CD4J7RpMAs4wfr2Mk9I
         V5bYAsnD9RPAyPzhwVMRNq8Ni/0Gz3mczY7Wvl1e3AuQWNLwlmx+eOSr8NohVkSg/X//
         kiOyBk8FXDLA6On/qnkcmP5n6Yx1n1ueFuHoqHQTCmqCWRjDZby9GtDp/fpKk5/O2Mmt
         Dnc4DAXUyO2ZDxKfjtyzp/5vEeIV+7g4NB49rrky+913zr1GeVbadZ6Zc6c91GH6hRmW
         aMMw==
X-Gm-Message-State: APjAAAXF1I2c6JUmg/a6rDFgyiNZgF1rWKuerHaMVD8gr3ee37DLMzXS
        Lj9S5nzMQ8YjrcAC0ir3YXBWuA==
X-Google-Smtp-Source: APXvYqz7rj/ZOxWgoHwJTLzC8i+4illOfJNW0JcRCpvRX9rpVQhzih41tpGt3i/vt14DeAjuz7iIjA==
X-Received: by 2002:a62:b515:: with SMTP id y21mr6996570pfe.213.1565144639931;
        Tue, 06 Aug 2019 19:23:59 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i124sm164007064pfe.61.2019.08.06.19.23.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 19:23:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH v2] soc: qcom: socinfo: Annotate switch cases with fall through
Date:   Tue,  6 Aug 2019 19:23:56 -0700
Message-Id: <20190807022356.8502-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807100803.63007737@canb.auug.org.au>
References: 
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Introduce fall through annotations in the switch statements of
socinfo_debugfs_init() to silence compiler warnings.

Fixes: 9c84c1e78634 ("soc: qcom: socinfo: Expose custom attributes")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 855353bed19e..a39ea5061dc5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -323,6 +323,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_x32("raw_device_number", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_device_num);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 11):
 	case SOCINFO_VERSION(0, 10):
 	case SOCINFO_VERSION(0, 9):
@@ -330,10 +331,12 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 
 		debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.foundry_id);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 8):
 	case SOCINFO_VERSION(0, 7):
 		DEBUGFS_ADD(info, pmic_model);
 		DEBUGFS_ADD(info, pmic_die_rev);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 6):
 		qcom_socinfo->info.hw_plat_subtype =
 			__le32_to_cpu(info->hw_plat_subtype);
@@ -341,6 +344,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_u32("hardware_platform_subtype", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.hw_plat_subtype);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 5):
 		qcom_socinfo->info.accessory_chip =
 			__le32_to_cpu(info->accessory_chip);
@@ -348,23 +352,27 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		debugfs_create_u32("accessory_chip", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.accessory_chip);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 4):
 		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
 
 		debugfs_create_u32("platform_version", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.plat_ver);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 3):
 		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
 
 		debugfs_create_u32("hardware_platform", 0400,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.hw_plat);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 2):
 		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
 
 		debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_ver);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 1):
 		DEBUGFS_ADD(info, build_id);
 		break;
-- 
2.18.0

