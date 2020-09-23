Return-Path: <SRS0=TrZl=DA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A3CC4363D
	for <linux-next@archiver.kernel.org>; Wed, 23 Sep 2020 01:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEDC9238D7
	for <linux-next@archiver.kernel.org>; Wed, 23 Sep 2020 01:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgIWB6X (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 22 Sep 2020 21:58:23 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37316 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726548AbgIWB6X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Sep 2020 21:58:23 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id CE262BD9F4EA474853D8;
        Wed, 23 Sep 2020 09:58:20 +0800 (CST)
Received: from [10.174.179.238] (10.174.179.238) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 23 Sep 2020 09:58:17 +0800
Subject: [PATCH v3] net: ice: Fix pointer cast warnings
To:     "Brown, Aaron F" <aaron.f.brown@intel.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>
CC:     "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
References: <20200731105721.18511-1-cuibixuan@huawei.com>
 <5af7c5af-c45d-2174-de89-8b89eddb4f4d@huawei.com>
 <DM6PR11MB289004F11B8936F7C421A863BC540@DM6PR11MB2890.namprd11.prod.outlook.com>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <85dcea48-8b82-d806-0026-e6b371e6a092@huawei.com>
Date:   Wed, 23 Sep 2020 09:58:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB289004F11B8936F7C421A863BC540@DM6PR11MB2890.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.238]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

pointers should be casted to unsigned long to avoid
-Wpointer-to-int-cast warnings:

drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning:
    cast from pointer to integer of different size
drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warning:
    cast to pointer from integer of different size

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
Tested-by: Aaron Brown <aaron.f.brown@intel.com>
---
v3->v2: add 'Tested-by: Aaron Brown <aaron.f.brown@intel.com>'
v2->v1: add fix:
 ice_flow.h:198:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 #define ICE_FLOW_ENTRY_PTR(h) ((struct ice_flow_entry *)(h))

 drivers/net/ethernet/intel/ice/ice_flow.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_flow.h b/drivers/net/ethernet/intel/ice/ice_flow.h
index 3913da2116d2..829f90b1e998 100644
--- a/drivers/net/ethernet/intel/ice/ice_flow.h
+++ b/drivers/net/ethernet/intel/ice/ice_flow.h
@@ -194,8 +194,8 @@ struct ice_flow_entry {
 	u16 entry_sz;
 };

-#define ICE_FLOW_ENTRY_HNDL(e)	((u64)e)
-#define ICE_FLOW_ENTRY_PTR(h)	((struct ice_flow_entry *)(h))
+#define ICE_FLOW_ENTRY_HNDL(e)	((u64)(uintptr_t)e)
+#define ICE_FLOW_ENTRY_PTR(h)	((struct ice_flow_entry *)(uintptr_t)(h))

 struct ice_flow_prof {
 	struct list_head l_entry;
-- 
2.17.1

.
