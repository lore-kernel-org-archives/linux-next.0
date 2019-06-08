Return-Path: <SRS0=bGaF=UH=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A332C28CC5
	for <linux-next@archiver.kernel.org>; Sat,  8 Jun 2019 12:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1704A21537
	for <linux-next@archiver.kernel.org>; Sat,  8 Jun 2019 12:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfFHMue (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 8 Jun 2019 08:50:34 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:39051 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfFHMue (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 8 Jun 2019 08:50:34 -0400
Received: by mail-wm1-f48.google.com with SMTP id z23so4257469wma.4
        for <linux-next@vger.kernel.org>; Sat, 08 Jun 2019 05:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hlCih0Ql28i40uIzvi3GAm97kcm7Flw3X0DygvueNwc=;
        b=Hu59HrytRRhAWvZmE3Mg96L3ZPU2+uY1/LP4yWAKLJyIXNuDd1tO5NYOsiXdH7mQI9
         8hullo1fO949jj24rLit9EL4ckbOBSKu0u48LN8kr+L+dXVr8OVz/88piMXONgHh/VnJ
         wew9vTtjKyi46o8p8IsPG2ERG+ri0C31IP1KPhTRq6XO2pNATaRev//ZEul7bfd6+gvK
         +XXekyDZ3BXUBzIr/EgFSNKMmkT+PvVU+p9FR4kYrtN+5QV7P/ysnGwMbN5BVcQk50vn
         /QhbrPj5lu9w+M4/XOEkfnzgxv9J/N07hGvD+dC+1cAfzbhq4BN7h7Dtbkc+uPGZdAZP
         4Yrw==
X-Gm-Message-State: APjAAAW3xC/cS2aq/3ToBxk1+K4+CuDio5CRINisKFgxYbCtrTGbbeE4
        JgYNAboTNSyXSYT9K/RFzVvUBw==
X-Google-Smtp-Source: APXvYqzpIby80Tewbtpb2LGh2fqIUOiyhotWBXo6dVznPVGxAbl/PSIblNHC6QHSlLTqyykJn5SDgg==
X-Received: by 2002:a7b:cc0d:: with SMTP id f13mr7694208wmh.1.1559998232908;
        Sat, 08 Jun 2019 05:50:32 -0700 (PDT)
Received: from raver.teknoraver.net (net-93-144-152-91.cust.vodafonedsl.it. [93.144.152.91])
        by smtp.gmail.com with ESMTPSA id d10sm7916279wrh.91.2019.06.08.05.50.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 05:50:31 -0700 (PDT)
From:   Matteo Croce <mcroce@redhat.com>
To:     netdev@vger.kernel.org, linux-next@vger.kernel.org,
        akpm@linux-foundation.org, Randy Dunlap <rdunlap@infradead.org>,
        David Ahern <dsahern@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH net] mpls: fix af_mpls dependencies
Date:   Sat,  8 Jun 2019 14:50:19 +0200
Message-Id: <20190608125019.417-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

MPLS routing code relies on sysctl to work, so let it select PROC_SYSCTL.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: David Ahern <dsahern@gmail.com>
Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 net/mpls/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mpls/Kconfig b/net/mpls/Kconfig
index d9391beea980..2b802a48d5a6 100644
--- a/net/mpls/Kconfig
+++ b/net/mpls/Kconfig
@@ -26,6 +26,7 @@ config NET_MPLS_GSO
 config MPLS_ROUTING
 	tristate "MPLS: routing support"
 	depends on NET_IP_TUNNEL || NET_IP_TUNNEL=n
+	select PROC_SYSCTL
 	---help---
 	 Add support for forwarding of mpls packets.
 
-- 
2.21.0

