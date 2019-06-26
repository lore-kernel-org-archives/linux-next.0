Return-Path: <SRS0=Vtnz=UZ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3C7C48BD3
	for <linux-next@archiver.kernel.org>; Wed, 26 Jun 2019 20:58:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE2CD2086D
	for <linux-next@archiver.kernel.org>; Wed, 26 Jun 2019 20:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="ISz4wZ3Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfFZU6C (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 26 Jun 2019 16:58:02 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:39663 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfFZU6C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2019 16:58:02 -0400
Received: by mail-wm1-f52.google.com with SMTP id z23so3458739wma.4
        for <linux-next@vger.kernel.org>; Wed, 26 Jun 2019 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p76e47dreY1WnmDKMmiDrhjgXJDFEdWPGBjsXN+qDE0=;
        b=ISz4wZ3ZnGK9hlvltuQaSsYurd7yCYgPMeeioczDdIupa4zCngMFbElLH9S/ZjSBbU
         AsF9alc/u5gNuOD4eo2WaXjOf4gmsnMz75J2/tjC4VMhqQ+pcj17ky6crLHmYt6mB14z
         oflVc1aDgCGG987EJZAEZ1/1A3x1TtoYhBMDjTD5eGCncP7I/NgGO4q5wPKfk3YiXEYI
         /dlFXuI/H07q/umHZH+dasatYEPqGq9tK67gTUWK7aQNbBwm+v7nF9sYWxui1hPga0nw
         azIxksoPifHuKvaSJkanx3Hi57U+BhqMizbHPlkawDuvay44A+MRqiwCU8ltsSrSUZ5o
         VQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p76e47dreY1WnmDKMmiDrhjgXJDFEdWPGBjsXN+qDE0=;
        b=SSGXsjfXOi6J5ZgxgcX6H8TwP/BdetQwIZt6I8hHI/p2DQIEnrE9evxhimdwN8Z4Kz
         0NDYYlH3YaMk0mSSEMt2WfhUVc4A80GVMmJZv6zJ3gZKE/wU7GVjaP8iVakyK6LKpXui
         8vFNcD4O0oT+NgCiuqyTuOC0GpRqM0mWCsItYMpKFNwkV8VzaZLiLggMapWR8capxBSJ
         lfNtffWl6E9ng+XuQ11hBwo1lrRQsITzAygNwgUD9xE1ljMi+19nvSkq/p1dyVxU0k2n
         bm58fMJyr7zDQKr3WzAnaK1Q8QXaaWrOiS7oF/N3rzLiVVxr/78YS2aSF98exo7MJWhM
         7pKA==
X-Gm-Message-State: APjAAAW82Pbl/5DNd+H4W6YOudxEfti9KiveZgt2mUdvXIrq9ypWIMLE
        dLBK8LWB24XZ1xnr/cVOtEUvHlL4h065PQ==
X-Google-Smtp-Source: APXvYqzGbZ4RFlhM1NjZ07WOBB/F7ls9/vue2azfF7gTGbvf6Xl3dk2R1VJCigB8uXS4Rvt/sykHRQ==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr606439wmi.14.1561582679782;
        Wed, 26 Jun 2019 13:57:59 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e4sm10683620wrt.93.2019.06.26.13.57.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 13:57:58 -0700 (PDT)
Message-ID: <5d13dc56.1c69fb81.535b8.a1c5@mx.google.com>
Date:   Wed, 26 Jun 2019 13:57:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc6-136-gdba89a35f087
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 231 boots: 4 failed,
 225 passed with 1 offline, 1 untried/unknown (v5.2-rc6-136-gdba89a35f087)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 231 boots: 4 failed, 225 passed with 1 offline, 1 =
untried/unknown (v5.2-rc6-136-gdba89a35f087)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc6-136-gdba89a35f087/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc6-136-gdba89a35f087/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc6-136-gdba89a35f087
Git Commit: dba89a35f087c486053fac6eeae5af4fdbd2bc7a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 26 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-rc=
6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-rc=
6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-rc=
6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
