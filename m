Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE53DC433E0
	for <linux-next@archiver.kernel.org>; Wed, 13 Jan 2021 08:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8089C2336D
	for <linux-next@archiver.kernel.org>; Wed, 13 Jan 2021 08:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbhAMIqn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 13 Jan 2021 03:46:43 -0500
Received: from retiisi.eu ([95.216.213.190]:43470 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbhAMIqm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Jan 2021 03:46:42 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CE470634C87;
        Wed, 13 Jan 2021 10:44:07 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 1/1] Documentation: media: Fix recently introduced build warning in subdev docs
Date:   Wed, 13 Jan 2021 10:39:19 +0200
Message-Id: <20210113083919.30905-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113151027.21f3f1de@canb.auug.org.au>
References: <20210113151027.21f3f1de@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

A reference to the sub-device pad ops was not follwed by a whitespace,
resulting in a warning during documentation build. Fix it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 25c8d9a7689e ("media: Documentation: v4l: Document that link_validate op is valid for sink only")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Stephen,

Thanks for reporting the issue. I believe this patch fixes it.

Regards,
Sakari

 Documentation/driver-api/media/v4l2-subdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 6d5c799c49fe..0e82c77cf3e2 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -123,7 +123,7 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
 	media_entity_cleanup(&sd->entity);
 
 If a sub-device driver implements sink pads, the subdev driver may set the
-link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its own link
+link_validate field in :c:type:`v4l2_subdev_pad_ops` to provide its own link
 validation function. For every link in the pipeline, the link_validate pad
 operation of the sink end of the link is called. In both cases the driver is
 still responsible for validating the correctness of the format configuration
-- 
2.29.2

