Return-Path: <SRS0=AeLc=WC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D0AC31E40
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 10:33:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E99D20C01
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 10:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="O3CnbVdP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfHFKdA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 06:33:00 -0400
Received: from mail-eopbgr790078.outbound.protection.outlook.com ([40.107.79.78]:25536
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730844AbfHFKc7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Aug 2019 06:32:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkWUHFVTLa2aaw4ZLfYaTTv1mMGRDJ2WUt4fZRoKhSYY6NDsdLZ6TUMhSPA4lULNiUl57fif5WtpeKuqIoqvFxLz5TZc3TBx6yQ5uvX9wZnjRN5MjqsVzhTCOVaqla7UdqXGFr/jLBhwvdxbORtvOAJVMqD/ywH/15m823hHk2iDu0RtxJ6WRIsGVYmfKJT/+VETagHoOLqwav1neZSSg4vWhV+kCcV+hhGyvW1Kcstf4aiiLJSCCgRdzkQ2x8jiu3dKm+luPpNpI0POtHN4ELbh76BltzTKCGDpHZjQBedPnujGcAwKzLSiTHzOLS2LqydCF3tpLySlj6gw4LaDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzAXGpSTkbbExFeOoqJkDsCFO2FrfxE8FI4e1WDjUU8=;
 b=RpZcgzbJpFl9P+IJPUXrKgIttYaMdKqAzmQJTjCE7E0Ugfw9CEqEs2GQxEyj3tTUvclSw3p+PPf534HOfL3Ev2EOQagADXIHoW2hDiIyDbjQI/0YwQTROIPqWm9dPZN9aR9izsS3gv7n2wNlIKP0CaSsWTbWfhPRt75uLZbq2Nsm36f/jQMrYZxoAYtctld4fW/5/sIMa5jaQNZAVmGdiQCMrIAHfTWEEjB3N5ZASqsRxEMQzc5BjuzFnBdhNbX9pefnCJIGllFX6xEaiTvZif+tlhtifbiL7kh7H6HK7xAhy5rc4VighqFce8oyi+V2WKuXwv6F8QF6MW2X1fei3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzAXGpSTkbbExFeOoqJkDsCFO2FrfxE8FI4e1WDjUU8=;
 b=O3CnbVdPSC2O80WmMJbD0tX+wRjMUKEclQuJovsOdCMpQRbd99Z0PyuP+XrQxbNVRfTqdTZ04YsDhEGaRwLrd9AAK/kMEXlnLb4OTxSz7AfZDs+kkDvCsF2ofD/mmf+Nyw9jEVvEZg2hNPX8yn72OjSiT1kCgOjavMe11+rrXgs=
Received: from DM3PR12CA0049.namprd12.prod.outlook.com (2603:10b6:0:56::17) by
 BN7PR12MB2708.namprd12.prod.outlook.com (2603:10b6:408:21::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Tue, 6 Aug 2019 10:32:56 +0000
Received: from CO1NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0049.outlook.office365.com
 (2603:10b6:0:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15 via Frontend
 Transport; Tue, 6 Aug 2019 10:32:55 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT035.mail.protection.outlook.com (10.152.80.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Tue, 6 Aug 2019 10:32:55 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 6 Aug 2019
 05:32:54 -0500
From:   Tao Zhou <tao.zhou1@amd.com>
To:     <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
        <hawking.zhang@amd.com>, <dennis.li@amd.com>, <broonie@kernel.org>
CC:     <kernel-build-reports@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-next@vger.kernel.org>, "Tao Zhou" <tao.zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: fix compile error about readq/writeq on arm ARCH
Date:   Tue, 6 Aug 2019 18:31:56 +0800
Message-ID: <20190806103156.3778-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(428003)(199004)(189003)(70586007)(48376002)(70206006)(86362001)(8936002)(316002)(305945005)(81156014)(26005)(81166006)(186003)(68736007)(1076003)(53416004)(486006)(5660300002)(47776003)(36756003)(8676002)(51416003)(7696005)(50226002)(50466002)(4744005)(2616005)(476003)(126002)(53936002)(336012)(54906003)(356004)(426003)(2906002)(16586007)(478600001)(2201001)(110136005)(4326008)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR12MB2708;H:SATLEXCHOV02.amd.com;FPR:;SPF:None;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e804145-08ce-4a84-62b6-08d71a59719d
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:BN7PR12MB2708;
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27084DA08DC9552B7237B40EB0D50@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-Forefront-PRVS: 0121F24F22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6pTUcoNUBVv5Ae7rpBHXaaa/xWecxGRsqTrDLEfxET1jbNeB3KChoOAjIkFPEkxXC/qDSPJGdvmXYz0BkJfpWK9Gf2xHE5mDxkgfrJQDQpUE/AJy7L+H5EwB3oPmwm9rEKNVG+VnbB2lLkqU0METR8FnbL0aoVN+QKx9ORIGijd5vXXANnf/EfXj+EgChfJYnAYJgfVDnGH5Xxy5Xs/kPF+FSUeCMNU6Cqb2ocC5CIJ+vkBhxLGZ0MCj3r1JfpTDf56SbB3UaZDudo4LONv08bvEAOyBJhfxQyskiGqmgFaJ6V2An7Tq6y+6L8jU8Vl+iwOtCeGX83I8DHmWhQdPk6dUByuRSXy4d0bl3EjaKRosHvLeHFhpDyxTmfbyAJ39je9pD4b0OoV776jR3w9Ta2q1YwbzWHSJF2+k29h2bHk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2019 10:32:55.4717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e804145-08ce-4a84-62b6-08d71a59719d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

readq/writeq can't be found on arm architecture, implement them
with 32 bits operations

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f62d4f30e810..aaf7f31cf8df 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -29,6 +29,7 @@
 #include <linux/kthread.h>
 #include <linux/console.h>
 #include <linux/slab.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-- 
2.17.1

