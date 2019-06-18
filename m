Return-Path: <SRS0=kTZn=UR=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1270AC31E5B
	for <linux-next@archiver.kernel.org>; Tue, 18 Jun 2019 18:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3FF9206B7
	for <linux-next@archiver.kernel.org>; Tue, 18 Jun 2019 18:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="D6NKatsA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730091AbfFRSBe (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 18 Jun 2019 14:01:34 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40457 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730089AbfFRSBe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jun 2019 14:01:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so481498wre.7
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2019 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FMJGxb7x/gmv8tW9llRgjWfKGJxt1INyvq/Nv30ZT8E=;
        b=D6NKatsAi79httrHISgwzTHbSbFTwQWcgHLYgOcHklu+H10WwFrKmZh8rGDeyJg7R1
         T01slFYBJrOCnaoTpct2ASuCLLPxKG3kCGLpaXfIK+6aMmQLFnSoQegnLQoTg7MyTLjw
         tZf45jZS4/P/qTenLbernJaIiG/JYZ22yrAWRT2yP1j1DbcqnJ3f8LK0e8kWf8DcyQNq
         3GEcagiBoBIIJQxtNxN52cKPuE04mnuyffxovoO7bae5jeUY65q7Qm9RgIq7bjzLUdHa
         S0pMU2m1Zt5/CWveny/PDDXPvKXQdI+KmaQDxorxyyvre//qgv8ITdkls8/tyAmKGa2/
         Q7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FMJGxb7x/gmv8tW9llRgjWfKGJxt1INyvq/Nv30ZT8E=;
        b=CiC8vU5rEMYhnd2QMDEpZ3sVJQg/HbVamAZBRZ5cF0+rrZHG4vi5HDVOUzzW5uFlKq
         t9kIXzVmx6hj/NJhJAfJLbR1Kwhg/yzb3rwBgc9HeyyszW7ItC/3lfrMhvMJ89tHNJde
         4XveCWy3fULVKv6lvfBfRXy58CWxuJX0lXNXrav766eAD2KqxdoOx5ZWryMhFmV/eRmx
         /3l0FIDFf3YZR4ErrBJyf+vECH28jLeyyxiA6PCGRxRS2EZrxam76hJuJIaEnAA0DZA2
         6qRU5FpPHqFc/Q94AQ0ocWo4aKU8d4o8hCQHJQh/GD5/5YLHbENc7tSbSMAw2+5EimaB
         FOBA==
X-Gm-Message-State: APjAAAWLRYlCAQmKiqYWoPsZbeLasKINjPEMKRQ31J9GSo6Bq2zbFSNR
        EDrz/OfxahMvfObdZ6UB/4/k2iICY+aGzA==
X-Google-Smtp-Source: APXvYqwN4J5oZYO/ZOqxo2feQcfxn0VgsYvkYQEjTvSRH/f8ibMQuj6OS5/kaSNSFwCEf979b1dqwQ==
X-Received: by 2002:adf:ec12:: with SMTP id x18mr50154072wrn.145.1560880892127;
        Tue, 18 Jun 2019 11:01:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j189sm4565829wmb.48.2019.06.18.11.01.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 11:01:30 -0700 (PDT)
Message-ID: <5d0926fa.1c69fb81.6140f.9b96@mx.google.com>
Date:   Tue, 18 Jun 2019 11:01:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc5-322-g00ee67ec13c0
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 191 boots: 1 failed,
 190 passed (v5.2-rc5-322-g00ee67ec13c0)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 191 boots: 1 failed, 190 passed (v5.2-rc5-322-g00e=
e67ec13c0)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc5-322-g00ee67ec13c0/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc5-322-g00ee67ec13c0/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc5-322-g00ee67ec13c0
Git Commit: 00ee67ec13c067d3cfa38e886ab46ea7b492e579
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 75 unique boards, 24 SoC families, 20 builds out of 223

Boot Failure Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

---
For more info write to <info@kernelci.org>
