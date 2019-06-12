Return-Path: <SRS0=4G8J=UL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E63C31E46
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 09:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1A87207E0
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 09:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437681AbfFLJuw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 12 Jun 2019 05:50:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40451 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437584AbfFLJuw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jun 2019 05:50:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id p11so16168073wre.7
        for <linux-next@vger.kernel.org>; Wed, 12 Jun 2019 02:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PAvGFOoYzPS61be8d0hDk59IdKm5jv+M0Lyik/mzoSE=;
        b=hXSi8F5aNQyQHadY/URVfX+E6bFcioWp5sGbLQ/0yDp/4A0rFPPJm2cpNuy8LJXNhH
         NgPzArC3i1US0KQ2tPr9v5mKQMVcmsXApPei1lbeQ/mrDAc4y+bFV4ZbH6cqnMd+ZgEW
         V8aOjBwFhRSJDv3Myyup8V8nv2pvXDe01jNVVLzyaR5x00NHNVkKFNhVrIn2UD5ybiiK
         eBR98L7VfNh7skg7gdkvf0sjDn/S5OIqm+loNuKdPSNnOrz98VWauHXKMPbkWBwlfcfV
         Jfk7R+QuM9vXuBGdptjrs5351yu7b65TGud2o4nhgUJtG+1/K54kHfXcSOpWSLdxwTo0
         XeSw==
X-Gm-Message-State: APjAAAUQQVSrR1h+4UfJwMPT8MxcYRlSkob3j2xHOrTng4INKHoYhvOr
        esQ3K8zBVMHYnGU18pSzkBqE3kztwvI=
X-Google-Smtp-Source: APXvYqxWCtXFIT7WAXyNcyUz59E7fx+sMjOkrh9/IR0cbl66vKkr0afl6Z0nTISHKI7+dI3deUDvpw==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr14633941wrv.143.1560333050210;
        Wed, 12 Jun 2019 02:50:50 -0700 (PDT)
Received: from mcroce-redhat.mxp.redhat.com (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.gmail.com with ESMTPSA id q20sm44919103wra.36.2019.06.12.02.50.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 02:50:49 -0700 (PDT)
From:   Matteo Croce <mcroce@redhat.com>
To:     netdev <netdev@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     akpm@linux-foundation.org, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH net] mpls: fix af_mpls dependencies for real
Date:   Wed, 12 Jun 2019 11:50:37 +0200
Message-Id: <20190612095037.6472-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Randy reported that selecting MPLS_ROUTING without PROC_FS breaks
the build, because since commit c1a9d65954c6 ("mpls: fix af_mpls
dependencies"), MPLS_ROUTING selects PROC_SYSCTL, but Kconfig's select
doesn't recursively handle dependencies.
Change the select into a dependency.

Fixes: c1a9d65954c6 ("mpls: fix af_mpls dependencies")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 net/mpls/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mpls/Kconfig b/net/mpls/Kconfig
index 2b802a48d5a6..d1ad69b7942a 100644
--- a/net/mpls/Kconfig
+++ b/net/mpls/Kconfig
@@ -26,7 +26,7 @@ config NET_MPLS_GSO
 config MPLS_ROUTING
 	tristate "MPLS: routing support"
 	depends on NET_IP_TUNNEL || NET_IP_TUNNEL=n
-	select PROC_SYSCTL
+	depends on PROC_SYSCTL
 	---help---
 	 Add support for forwarding of mpls packets.
 
-- 
2.21.0

