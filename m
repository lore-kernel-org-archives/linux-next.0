Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABBFC433E0
	for <linux-next@archiver.kernel.org>; Tue,  2 Feb 2021 10:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1C7664F54
	for <linux-next@archiver.kernel.org>; Tue,  2 Feb 2021 10:10:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhBBKKL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 2 Feb 2021 05:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBBKKB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 05:10:01 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73643C06174A
        for <linux-next@vger.kernel.org>; Tue,  2 Feb 2021 02:09:21 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id i8so12567300ejc.7
        for <linux-next@vger.kernel.org>; Tue, 02 Feb 2021 02:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ROBpI0H1sH3Bdn16B+TcSkCCiBYHadxhxvAD8liGX80=;
        b=lINFXTSGlw9ytH/IKb+fRhxjL5/GRVo7vTrGMKkL5BJlu30jPX+4hlHNEzk9Ql/RCl
         8DYktJzZDSP1enoE5Rffjpd2Mm8KpWxGHF5XK4wjlfgQkHIybTslr9s/3zGZ8CA9LbYq
         rMpYS+xL0e/ko2wUOuQp7qLX6FDWEhC2oQJ790AweKmMTVibonDsvOIkJXRYgGbvyK5f
         2yroGAwhkYWv1S4c/5qf/Sk7JO200ZHHjHoZuSz+ZXocbJHBjaXketoN6lwpr3N4EhhA
         /oUmWJ5qgeOMP543QKbJxj0v324VM9xzUWXGQdOEm/rFWnYnQs1y+ELlTIkQrct7Oxo1
         Uu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ROBpI0H1sH3Bdn16B+TcSkCCiBYHadxhxvAD8liGX80=;
        b=HLg12GqolkpBrj3wyU6sGaVUnCx1UozPjBzFulb0MOGf7NxiGJ3l2U4vIRAXOhwPj9
         sSVJBERSt9RxSmGXpNSkezDLCRNB/jRPOZbDeAtggQcU8RDH0VV2F+9SAhW2gljiTI6n
         MOnAKVHiz1DgO4Fb0btie72sWdrYEiImuMrULHEtJpHfgLAJj9GowyIxmo4WcljGZN/W
         Rz8MfQVBtMLejxKu9CKHW+A9/QAsI2zGivQHEJ0sMwKZZf0HEb+Jejaq5kesOutxpcfc
         xarGswArkEiyvyH/VIbknXiYzhjQxASSrdg1gGaDL3QdlPcRp129lBZuClg21km6p5gC
         Tsiw==
X-Gm-Message-State: AOAM533dp6yi6d0TWLAVJPXoRi7B+jimjJh8VflknE00d6nIrWlJCf6T
        0rVz/955GnDBUA7MRRk90izcMFry4dFo/Wit7RB+dg==
X-Google-Smtp-Source: ABdhPJzJhQtkmR40mYYncH/1EWrcijaBMdpdpRAHB6Uis0vGexLR6D/RbuikRBHcznR/q0gIzovWB4LZRvUpTuTVpkc=
X-Received: by 2002:a17:906:3885:: with SMTP id q5mr22075171ejd.105.1612260560155;
 Tue, 02 Feb 2021 02:09:20 -0800 (PST)
MIME-Version: 1.0
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 2 Feb 2021 11:09:08 +0100
Message-ID: <CADYN=9Ljjx6GRPk45jkY1N7dVDOFFjMB8yy5QRzVE-1tzEnUjw@mail.gmail.com>
Subject: arch/arm64/kernel/mte.c:121:15: error: 'mte_enable_kernel_sync'
 undeclared here (not in a function); did you mean 'mte_enable_kernel'?
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

I've seen this failure on tag next-20210202:
arch/arm64/kernel/mte.c:121:15: error: 'mte_enable_kernel_sync'
undeclared here (not in a function); did you mean 'mte_enable_kernel'?

I think it may be a merge conflict that didn't get resolved correctly?


The below change fixed the issue:

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 275b5d0f38b8..8f5bd1293496 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -118,7 +118,7 @@ void mte_set_report_once(bool state)
 {
  WRITE_ONCE(report_fault_once, state);
 }
-EXPORT_SYMBOL(mte_enable_kernel_sync);
+EXPORT_SYMBOL(mte_enable_kernel);
 EXPORT_SYMBOL(mte_set_report_once);

 bool mte_report_once(void)


Cheers,
Anders
