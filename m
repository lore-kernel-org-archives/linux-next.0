Return-Path: <SRS0=1ly7=US=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B184EC43613
	for <linux-next@archiver.kernel.org>; Wed, 19 Jun 2019 23:28:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89268214AF
	for <linux-next@archiver.kernel.org>; Wed, 19 Jun 2019 23:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="JssdqdFm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfFSX2X (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 19 Jun 2019 19:28:23 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:44686 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfFSX2X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Jun 2019 19:28:23 -0400
Received: by mail-wr1-f51.google.com with SMTP id r16so966259wrl.11
        for <linux-next@vger.kernel.org>; Wed, 19 Jun 2019 16:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2qld8ZXb9FYzhWoXi24zIZ/gJH4fBSUCqq2W8GdCt10=;
        b=JssdqdFm98unm2Dwn8i15vEosV8wyvZiQzR8O3VtfA1HGretgnOdlW7cYe9v35VvNI
         nxyoPAnwWhLMzZ0XmoIudsuY9J7EqpGwmr9kZmHpKJk3FmpPLkstNCd0tyDYz2a8I60D
         HtC+rreiz3qRAnJWXHSaNfWCAuNYUD8F6+PjFO7TamgrAUZLRTNaGAQaHhUkYfxRrvLp
         bUyI9l/tKD6Vs8KKYfAIcQvCXt7DlNqJM3BiJCT6ejm9JDDs1KQTF4LREAauyOI/esz7
         /IezLsuKBR2Y5t+Krldc6/4Bul/sCUx9aBh35uDhgjWtMUruj1clzR41EFkQ6t5oDZmO
         suhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2qld8ZXb9FYzhWoXi24zIZ/gJH4fBSUCqq2W8GdCt10=;
        b=WWsDLPYWDnrezmXfMJxeFFlSfeOAjCq3KCNsOCso6oGPcUMfcsJfGu0s5lrw9FaKp2
         qxA1jAcAvPhEZAl5ptouyBtMGeQI4XefUgap2c0E4aRjwJxAzHtOBi5Cwi1HpT9TQdG6
         rPs/zbI8j6eOj8b7kEkbZg5rCcHah8Cgl+dOsPmmCEWwmNwZKtM/WR0wvW/c2+KcW4pU
         YpEQBp2LlwiRMEPZEJJVpioQ1AQgUcmcxPdHmn5sNcLKKAPZw34UnADhXL3rvyH9onds
         Q5KlERUYg17Yz1luQeSQMpM++JBOeQmx7S4vM3131oIsd4JNkV/Ty7TetWigOaGmk8Cc
         zVAg==
X-Gm-Message-State: APjAAAUtGtdaF3jexS3emQbrZLK9VYGWkbD3Q2ruuHVw/cStdqRjCU8s
        7q1y41ksL+2uSOXp7mSbqWDBCGC+rsTzDg==
X-Google-Smtp-Source: APXvYqwbimYjOhs23FJtCzGVKriH783Mj0jz6nnChH9MOz7a4OVjhGaMWv2o+ZoiVYwy9bjBVFzlqA==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr28799856wrq.171.1560986900532;
        Wed, 19 Jun 2019 16:28:20 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a3sm1733783wmb.35.2019.06.19.16.28.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 16:28:19 -0700 (PDT)
Message-ID: <5d0ac513.1c69fb81.33206.96d7@mx.google.com>
Date:   Wed, 19 Jun 2019 16:28:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc5-374-gae1b7dafef4c
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 228 boots: 0 failed,
 206 passed with 20 offline, 2 untried/unknown (v5.2-rc5-374-gae1b7dafef4c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 228 boots: 0 failed, 206 passed with 20 offline, 2=
 untried/unknown (v5.2-rc5-374-gae1b7dafef4c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc5-374-gae1b7dafef4c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc5-374-gae1b7dafef4c/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc5-374-gae1b7dafef4c
Git Commit: ae1b7dafef4c037bad8a67077b0c0b90e772958c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 24 SoC families, 20 builds out of 223

Offline Platforms:

arm:

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-ifc6410: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            tegra30-beaver: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

---
For more info write to <info@kernelci.org>
