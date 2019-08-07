Return-Path: <SRS0=ikMb=WD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06CBC31E40
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 02:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74E81216F4
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 02:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="01vV5quK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfHGC4x (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 22:56:53 -0400
Received: from mail-eopbgr760052.outbound.protection.outlook.com ([40.107.76.52]:13382
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726518AbfHGC4w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Aug 2019 22:56:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWPdnakyhnR74NSGjGh6eeOnrfGShlgsES5yCt5u9qW8CiGVa5Oi03XDhefr9DvPvPdXQpbZqzMa86Uv9VlrE+86fxrRHb9cPZiTl43uKUrKKNj9HIkYOea3/jLxZWWolAM+Qdupc9Xo92ZINI4Wf6i1YdTxTiIIrAx7YpU8BVASWV3QdgTr8ZPPKAXOvPfE8eO+QmIAtfoDAYIbrD/rO+u86E2E1OQ767uuCtGAZObSypgEMaPxC6wx4IyBh2APfzo2PKRK8spuqTb/60lN1oSU7c0N4m95V+9yUBmeLOXLz+KLoWiDFR/tOLFjK3Mc8tYd83Usp5FqpDajaaz2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yky6w6/M4SeHS15mmKKQtpK5alww9+bmfDk4qJna3/I=;
 b=iZsglEpD5wGKBLonXv4jYlGzYDUHXZ4UP+HUvqAu497fFWCGfFffwc3vA7E4Xc/BfqJU0rYMQNHduYzqajW1XpEWuTZitbDdPdmGtPN9xsaxg3K5eMeaOrED7UscDRPIr2xlI/vtszhrU8oJi8PS9k6lMHFxVRdBeQj4Ynlz/Nl1ShPtdTK43/Be6q98VAwhpjQYC5gcGM4A6RfIke1QHLFuGJ7O2U4k6xnHrJQbEboLdnrS2CG507uqLxFSIeRfGjb7tAB8TokITvW8hALzkhGSJDjU/x6Z/tWoNedMCdQnTQk5EZUMI8OluwwXQ2eqNjC4s3CvDH1PQb1ZeeQS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linaro.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yky6w6/M4SeHS15mmKKQtpK5alww9+bmfDk4qJna3/I=;
 b=01vV5quKFaefE/H7PL5mupPTZ/YJQG+6uE8GW8OsGfFU2XJbyfvgAMNKtyE4GICgc6ejbFBSYjM3bNPbLj1KT2JKOpwY0jxVB54/WdLBkUkpMg57POJmGTrLAW3AH9EvzIJ/DTFjqCYZUXYZu7pi8g7he/9aW4qc2VJHdv0LLEw=
Received: from MWHPR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:301:4a::31) by BYAPR12MB2710.namprd12.prod.outlook.com
 (2603:10b6:a03:68::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.19; Wed, 7 Aug
 2019 02:56:50 +0000
Received: from BY2NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MWHPR1201CA0021.outlook.office365.com
 (2603:10b6:301:4a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.13 via Frontend
 Transport; Wed, 7 Aug 2019 02:56:50 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT043.mail.protection.outlook.com (10.152.85.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Wed, 7 Aug 2019 02:56:49 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 6 Aug 2019
 21:56:47 -0500
From:   Tao Zhou <tao.zhou1@amd.com>
To:     <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
        <hawking.zhang@amd.com>, <dennis.li@amd.com>, <broonie@kernel.org>,
        <akpm@linux-foundation.org>, <christian.koenig@amd.com>
CC:     <kernel-build-reports@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-next@vger.kernel.org>, "Tao Zhou" <tao.zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Date:   Wed, 7 Aug 2019 10:56:40 +0800
Message-ID: <20190807025640.682-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(68736007)(2201001)(486006)(50466002)(48376002)(476003)(53416004)(6666004)(2616005)(356004)(426003)(126002)(336012)(186003)(86362001)(6636002)(47776003)(478600001)(4326008)(26005)(70206006)(316002)(54906003)(1076003)(16586007)(110136005)(5660300002)(7696005)(51416003)(53936002)(8676002)(70586007)(36756003)(8936002)(81166006)(81156014)(50226002)(305945005)(2906002)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2710;H:SATLEXCHOV01.amd.com;FPR:;SPF:None;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bdaf23d-67ff-4dfa-a56e-08d71ae2e4dd
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BYAPR12MB2710;
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB271044796759B6AE287FF480B0D40@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-Forefront-PRVS: 01221E3973
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cM6Rs+5qRQZU+kNfIqs1zxyQY8bCl0jE7pJBdn2dOoL7uQ0LruNrBOw1lEKvQZXFLXNGI739+x63BVBLi4mfxLNtCygclmDn4+993i156ejaccChEvYksXAQ7cySfYFBON0654AeDjYezo4N7XoWJWMNRwgKZgqly/cjgz8Kozti2tmYZXasvj14Y9sx9fRSsCtwDFG+xCsNePlyWt7Pv0unWS4z2DOtrkgUnkWfPT/rp9r0I+gi+YYI2rcOAhDa4bWzYHqujH8iYXTTXFXOKXOUgzQPVm56LW/GNxD4iSNz/+naXSAb+WC4Hyg5pV70H9QWXSEzsXqM3clZ9ev0IL5xEeTIiNrSP5bmOVXRmt92lW+cgRpMEsFxNw9JcdT9tGrRybvHQQaRTGxH0en6TzlnmJS6xFXQ+sV89QXr1LI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2019 02:56:49.9265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdaf23d-67ff-4dfa-a56e-08d71ae2e4dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

readq/writeq are not supported on all architectures

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 558fe6d091ed..7eb9e0b9235a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -272,14 +272,10 @@ void amdgpu_mm_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v,
  */
 uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev, uint32_t reg)
 {
-	uint64_t ret;
-
 	if ((reg * 4) < adev->rmmio_size)
-		ret = readq(((void __iomem *)adev->rmmio) + (reg * 4));
+		return atomic64_read((atomic64_t *)(adev->rmmio + (reg * 4)));
 	else
 		BUG();
-
-	return ret;
 }
 
 /**
@@ -294,7 +290,7 @@ uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev, uint32_t reg)
 void amdgpu_mm_wreg64(struct amdgpu_device *adev, uint32_t reg, uint64_t v)
 {
 	if ((reg * 4) < adev->rmmio_size)
-		writeq(v, ((void __iomem *)adev->rmmio) + (reg * 4));
+		atomic64_set((atomic64_t *)(adev->rmmio + (reg * 4)), v);
 	else
 		BUG();
 }
-- 
2.17.1

