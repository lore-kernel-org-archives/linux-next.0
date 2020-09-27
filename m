Return-Path: <SRS0=cmI2=DE=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40AAC4346E
	for <linux-next@archiver.kernel.org>; Sun, 27 Sep 2020 08:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55D8223976
	for <linux-next@archiver.kernel.org>; Sun, 27 Sep 2020 08:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbgI0IS7 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 27 Sep 2020 04:18:59 -0400
Received: from inva021.nxp.com ([92.121.34.21]:55262 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729125AbgI0IS7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Sep 2020 04:18:59 -0400
X-Greylist: delayed 510 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Sep 2020 04:18:58 EDT
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EA8EA20147F;
        Sun, 27 Sep 2020 10:10:27 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 29B0B200049;
        Sun, 27 Sep 2020 10:10:24 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 340DE402E6;
        Sun, 27 Sep 2020 10:10:19 +0200 (CEST)
From:   Yangbo Lu <yangbo.lu@nxp.com>
To:     netdev@vger.kernel.org
Cc:     Yangbo Lu <yangbo.lu@nxp.com>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Richard Cochran <richardcochran@gmail.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] ptp: add stub function for ptp_get_msgtype()
Date:   Sun, 27 Sep 2020 16:01:50 +0800
Message-Id: <20200927080150.8479-1-yangbo.lu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Added the missing stub function for ptp_get_msgtype().

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 036c508ba95e ("ptp: Add generic ptp message type function")
Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
 include/linux/ptp_classify.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/ptp_classify.h b/include/linux/ptp_classify.h
index 8437307..c6487b7 100644
--- a/include/linux/ptp_classify.h
+++ b/include/linux/ptp_classify.h
@@ -134,5 +134,13 @@ static inline struct ptp_header *ptp_parse_header(struct sk_buff *skb,
 {
 	return NULL;
 }
+static inline u8 ptp_get_msgtype(const struct ptp_header *hdr,
+				 unsigned int type)
+{
+	/* The return is meaningless. The stub function would not be
+	 * executed since no available header from ptp_parse_header.
+	 */
+	return 0;
+}
 #endif
 #endif /* _PTP_CLASSIFY_H_ */
-- 
2.7.4

