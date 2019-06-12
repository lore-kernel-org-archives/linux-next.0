Return-Path: <SRS0=4G8J=UL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D286EC31E46
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 13:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A772F208CA
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 13:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="wCcv1vX3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407435AbfFLNnC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 12 Jun 2019 09:43:02 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:54059 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407111AbfFLNnC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jun 2019 09:43:02 -0400
Received: by mail-wm1-f50.google.com with SMTP id x15so6640999wmj.3
        for <linux-next@vger.kernel.org>; Wed, 12 Jun 2019 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r7bkoG0F9rP1/GAK/MHMJxBOmUV/PR6gWMNVJ/zqZr8=;
        b=wCcv1vX3XY0V+yY6Tm/TiqCs3mojzJCpxofrLTkXCKEmb26T5Hi5v9JUoIOTbRywOY
         hGQnE3gyQpjZCP0eFtq7dca9WYcFQ/VB2Q19B7enCueaFxoQKroLJy8QJ88Hv34MdEw/
         fINHpKe5XinVPbUF2lk8XqmL7LEMGr9/IT/efvQS47XKV7Iiooe66vdVa+4gBsYBFSy7
         XZdINlch1y7ys95+AF1eSjhC16TTnznVMKs/H+AnHGEw3fDOXi4nI3SkRr7bcyQRIflV
         zT/EnxJsTZmeTw9hL1dPYr+gucgUMVWWu5VqGTxzS4kMV7YFjr09YU/amg32n0c+8aHF
         vB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r7bkoG0F9rP1/GAK/MHMJxBOmUV/PR6gWMNVJ/zqZr8=;
        b=drDGyNnNuOXf9Hyi72GBAEIDXbkKwUAFcvGgkB/J068DWq5mPMFAsLtKTc0v+nVNIU
         0FUNUT1iOwvUGm8TJDqyG9bR381ikdgmFpurYsd0TWHMvqaPy2MOdXz69iFT1jzjKXGH
         +QdNyTvVez05UxUDkS5vNeWMih2wRfNkpgav3MJJLjV8jBDKL3opcEGxzvk/3N+yytEj
         SBKWj55yOIYcic/zo0vv+hSKxxe8daVrjio5rBLWUbymvWMv09pZ4pk67fr1ftFJr3r7
         FJtG/ZM6v0NxeLfo+yeJlXZSBENE5oSWRkVeUVnOF2WCSrAkqsBIHgrJiOq/IORZ4PYn
         H5fw==
X-Gm-Message-State: APjAAAWrjEKWjcnD2ctS2aAB719+BVbuz9HvcR7/2OcZ2KFCdnwp5xDg
        nXSmBGsMs3gWYb2Nx6U+Ve77dH5lPjCNPg==
X-Google-Smtp-Source: APXvYqxXxP38s5Fi7vy1bfL5ka8yZNz0GovlxMvPP0s6Ytk9JpKAgpt9ZPWPMrWQPT0grXYcLEEs1Q==
X-Received: by 2002:a1c:a019:: with SMTP id j25mr22937125wme.95.1560346979723;
        Wed, 12 Jun 2019 06:42:59 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 32sm40018354wra.35.2019.06.12.06.42.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:42:58 -0700 (PDT)
Message-ID: <5d010162.1c69fb81.5cb9b.6a0d@mx.google.com>
Date:   Wed, 12 Jun 2019 06:42:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc4-273-g26c91f14d441
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 219 boots: 1 failed,
 218 passed (v5.2-rc4-273-g26c91f14d441)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 219 boots: 1 failed, 218 passed (v5.2-rc4-273-g26c=
91f14d441)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc4-273-g26c91f14d441/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc4-273-g26c91f14d441/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc4-273-g26c91f14d441
Git Commit: 26c91f14d44168644e31389080d081e3896dcc5b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 24 SoC families, 20 builds out of 223

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

---
For more info write to <info@kernelci.org>
