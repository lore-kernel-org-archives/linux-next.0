Return-Path: <SRS0=1ly7=US=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBDFC43613
	for <linux-next@archiver.kernel.org>; Wed, 19 Jun 2019 23:34:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76572214AF
	for <linux-next@archiver.kernel.org>; Wed, 19 Jun 2019 23:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="yF9sAy3l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfFSXex (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 19 Jun 2019 19:34:53 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:39416 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfFSXex (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Jun 2019 19:34:53 -0400
Received: by mail-wr1-f52.google.com with SMTP id x4so1008211wrt.6
        for <linux-next@vger.kernel.org>; Wed, 19 Jun 2019 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TEz8QkeqC2fv+9msoBLG/YfXPfkVmYql5mctCawIgGI=;
        b=yF9sAy3lONydaEitRgRmSBgh5lPLGRLA4WcVqe0DFkR1ZCIOgG/jcwhQncNpLdkeOr
         ojRG3XpqvcE+TmRYcIY6xX8Fe76oI0qiZYNKuJPO4WYefDVTfgehKba/O2+QJTbTK3lz
         CfkJS59TGN4oN/YpAdxUeEY21HeLhhC0/LN4XMcV013ga+5KD9ct+lHTee22Do/F8Y7J
         06XCRq8c+pjlm0l+KcHl0vB7ViW/KiORq+Wotbz5UZVAmjNE+l/X75GxhHYXW7V2bXIe
         Yn2ORi7I9CKPmKJ0KBM3xyGF3GEnnGTYkfVrmDNCo3GOZThDcbUrnMdVfIAXQatH68s9
         dhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TEz8QkeqC2fv+9msoBLG/YfXPfkVmYql5mctCawIgGI=;
        b=eN1Bc2naurVBQPj89W5dukeuUmkkX7jCuYtIN/Z8/Rtalf9YF4NGQ+wtKHvJi8UOKI
         3pc2ZU4AnvtuNo0mL79B8JirDWZUSXzpwgDb4BNZdGCMriXgU92wML3ajc5HKPzquZ3y
         vBFns5atqDMta9v//dWoNxLPH+TmcLAOWwq/+PCnnkU29WtdCZFnkWLqqTlcJ7KLkXjx
         ho4q2TuJWI2zp0a9n/DR7NotjlWjPnWXnjXqWmsemK1VRjI+QtBI3Ei8opUC9T1d3d1p
         cP/lWUnglaVw4XILyqJTw8SccWmTNwwOAvGeu6DtgsqzsmT4GRoAGvwhxVYNjBQL+flc
         O5+g==
X-Gm-Message-State: APjAAAVVWYuB4d0ubOkI2vJ5K5DUWldNG6q0Looyo5pd5fy7RBrN8c4g
        c86ipfJJ72fR6z4jDnH6bktk0YPgWTGEQg==
X-Google-Smtp-Source: APXvYqwjpRNCpXCkVyPjKLl5RD3W++qZ/FwHO1RhqroEQHObNwQa7Y4mbzVXB/12J5VTR2Pf/O5mfg==
X-Received: by 2002:a05:6000:e:: with SMTP id h14mr15008799wrx.112.1560987291290;
        Wed, 19 Jun 2019 16:34:51 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v24sm1786149wmj.26.2019.06.19.16.34.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 16:34:49 -0700 (PDT)
Message-ID: <5d0ac699.1c69fb81.fd4ff.9c40@mx.google.com>
Date:   Wed, 19 Jun 2019 16:34:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190619
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 113 boots: 3 failed, 99 passed with 9 offline,
 2 untried/unknown (next-20190619)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 113 boots: 3 failed, 99 passed with 9 offline, 2 untried/=
unknown (next-20190619)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190619/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190619/

Tree: next
Branch: master
Git Describe: next-20190619
Git Commit: c0e4c41afeef66d21dc5704f614624cecac806ac
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 48 unique boards, 19 SoC families, 13 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          meson8b-odroidc1:
              lab-baylibre: new failure (last pass: next-20190618)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          meson8b-odroidc1:
              lab-baylibre: new failure (last pass: next-20190618)

    qcom_defconfig:
        gcc-8:
          qcom-msm8974-sony-xperia-castor:
              lab-bjorn: failing since 1 day (last pass: next-20190617 - fi=
rst fail: next-20190618)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-msm8974-sony-xperia-castor: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-ifc6410: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
