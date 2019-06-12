Return-Path: <SRS0=xExw=UM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194A7C31E45
	for <linux-next@archiver.kernel.org>; Thu, 13 Jun 2019 17:13:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E690121473
	for <linux-next@archiver.kernel.org>; Thu, 13 Jun 2019 17:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732999AbfFMRN0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 13 Jun 2019 13:13:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33363 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728978AbfFLWB0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jun 2019 18:01:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so18565609wru.0
        for <linux-next@vger.kernel.org>; Wed, 12 Jun 2019 15:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rtjjxJbZCnNJbQ4rRmAh0Ahovsd/DILFvQwc++jpSoQ=;
        b=d9AbvFnUEesoDvOAnqOirqKxuhqv6eXZsUF2Q00NyjmkCLEEA3Dtr46kqqwP8CzKUx
         ZLtkVo1lBqXMCt5+E+ulnf5Uxingy2J7NO85PBUTwv4SZtMmAw4aX79wfHFxK6hpYgCA
         leVf0NCJlnWZjWl+Dk+NYCv3fzi6sAUGUtrlg8pmsttF0ROSlHdJDlRguDqZ3+fZrbUy
         x+HTE1ogoSOcsndqkA81NPcGCxedtD2e9rLvZ1T2MfTWeGSGh8i5QU27NJSBYBGljCRg
         njhg3FOqFJx26Ih8N9o41J8zMxAJ+CC7MHdueW6IZQMrIsvwp37td2z/rMGnktISD+Hg
         ohwQ==
X-Gm-Message-State: APjAAAUvUGRfzl+X8qoRWfvjpY5qopaFwE/VEhCJibjChi2olpPgr+Ss
        TPJ5pV1WTSdsLiSh5pgQTUT3Vg==
X-Google-Smtp-Source: APXvYqwzum8xO+Bu+aMx87Ojw8bGvggqXnzAbO1TIQlOxrSKi01Hd/i8+OaLN8a0LKXtOAy3bBjcow==
X-Received: by 2002:adf:d081:: with SMTP id y1mr11088437wrh.34.1560376884297;
        Wed, 12 Jun 2019 15:01:24 -0700 (PDT)
Received: from raver.teknoraver.net (net-93-144-152-91.cust.dsl.teletu.it. [93.144.152.91])
        by smtp.gmail.com with ESMTPSA id i188sm929448wma.27.2019.06.12.15.01.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 15:01:23 -0700 (PDT)
From:   Matteo Croce <mcroce@redhat.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        linux-next@vger.kernel.org
Cc:     Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
        Johannes Weiner <hannes@cmpxchg.org>,
        Aaron Tomlin <atomlin@redhat.com>
Subject: [PATCH linux-next] sysctl: fix build error
Date:   Thu, 13 Jun 2019 00:01:20 +0200
Message-Id: <20190612220120.31312-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Commit cefdca0a86be ("userfaultfd/sysctl: add vm.unprivileged_userfaultfd")
reintroduces a reference to 'zero' and 'one'.
Use the SYSCTL_{ZERO,ONE} symbols instead.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 kernel/sysctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index c77174336d16..4dce89d74a40 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1735,8 +1735,8 @@ static struct ctl_table vm_table[] = {
 		.maxlen		= sizeof(sysctl_unprivileged_userfaultfd),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= &zero,
-		.extra2		= &one,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
 	},
 #endif
 	{ }
-- 
2.21.0

