Return-Path: <SRS0=qG1S=BA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E44C433E8
	for <linux-next@archiver.kernel.org>; Tue, 21 Jul 2020 15:07:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 862D922C9E
	for <linux-next@archiver.kernel.org>; Tue, 21 Jul 2020 15:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3eKj4HP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgGUPHJ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 21 Jul 2020 11:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728342AbgGUPHJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2020 11:07:09 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BE0C061794
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2020 08:07:09 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id b205so4625873vkb.8
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2020 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TttBCUltyx/MCWMitfeQkl3FeqjlrfXX2hlzOjft3gI=;
        b=D3eKj4HPsOHwmNcKBkkKHMp/Nw4v+PtZNvUvy9OCmKmt50IQB66eZhlGVpfuSSN2Bg
         T2UT3+3DIUMb7A2Asnw0uwt24qGEzz1SG+BRpOMYwy2SYdUif4guHSIbLxDl+/+sH3Y4
         CvYzHfRtb7SoVx7L1bgkQugm28VObydby3vyYyPm9M9W/K3UY/2PECza1kxPVLyRQAQM
         KbPZCX9Y8PJG9fIdzoFuIuTk4INnppNRBGQGHv+dECgCenOGGC5Hef3GOA0Bfbi5GWB1
         Rv1Tkiciurwlm/64PG6nCmYQ2gJFKeTOuhgeaWPfTJhaDuMdvmxyL/VZesijSYiWXI8F
         dVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TttBCUltyx/MCWMitfeQkl3FeqjlrfXX2hlzOjft3gI=;
        b=m1G3e4vR55yv1noW6FDm3toeNS1KS9PN8MEBEpvgSQ2DDHymiKYEHfcvbbpvPqs1d3
         nY+62QmE8mx58mYrDNdSBUx4xMOASFmDG8j7j/swWLXjN0y27leqS8WtibCwiwdT5N5w
         /JoPYB70c6L7oukXlHuLYlJo31gWdCVn61VIqEb1gVKKcYNXLMh6isITXwvW8g4/Fn84
         4uZLJqAFaWEWRuG8xirLx4NlHjaatQppBCYGUxhGzqFXvu6PrLFfWqFly1CBt5Clik9I
         bpS/P0056Cglw5Zx2fQJnmRLe/+xhXHDin2/PqnM8enUkYy4sS72gw6yCI+I3cOxKirC
         aNNA==
X-Gm-Message-State: AOAM531KkBk0T2o3jEYBOuJ5KUnN5+OHnd8G8gD6fz4TKkHEMqtkDG31
        O/6gHoOZxWWpvYT5wAY77XAnCDbvM1+oBHRT5SX/V0gPJ+RNcQ==
X-Google-Smtp-Source: ABdhPJyXrQnOSY70aA2W5YyJyUTuOwuINYI8oRmcOBhWqk7PPLA/W1YNwyaAqdJBPEct0LUz8fOq1mDkQge2T8RitkM=
X-Received: by 2002:a1f:5e14:: with SMTP id s20mr14805414vkb.63.1595344027281;
 Tue, 21 Jul 2020 08:07:07 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 21 Jul 2020 20:36:55 +0530
Message-ID: <CA+G9fYtYPA7jHPNB5D+JFHpmtB5+Wj+YG8W33GhffHjmFaMiUg@mail.gmail.com>
Subject: arm: tinyconfig: entry-common.S:156: Error: r13 not allowed here --
 `bic tsk,sp,#(((1<<12)<<1)-1)&~63'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>, vladimir.murzin@arm.com,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This might add little value.

arm build sets failed on linux next 20200721.
The defconfig ( +config fragments ) builds PASS.
The tinyconfig and allnoconfig FAILED with gcc-8, gcc-9 and gcc-10.

make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j32 ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- HOSTCC=gcc CC="sccache
arm-linux-gnueabihf-gcc" O=build zImage
#
../arch/arm/kernel/entry-common.S: Assembler messages:
../arch/arm/kernel/entry-common.S:156: Error: r13 not allowed here --
`bic tsk,sp,#(((1<<12)<<1)-1)&~63'
../arch/arm/kernel/entry-common.S:243: Error: r13 not allowed here --
`bic tsk,sp,#(((1<<12)<<1)-1)&~63'
make[3]: *** [../scripts/Makefile.build:361:
arch/arm/kernel/entry-common.o] Error 1
../arch/arm/kernel/entry-v7m.S: Assembler messages:
../arch/arm/kernel/entry-v7m.S:60: Error: r13 not allowed here -- `bic
tsk,sp,#(((1<<12)<<1)-1)&~63'
../arch/arm/kernel/entry-v7m.S:86: Error: r13 not allowed here -- `bic
tsk,sp,#(((1<<12)<<1)-1)&~63'
make[3]: *** [../scripts/Makefile.build:361:
arch/arm/kernel/entry-v7m.o] Error 1

full build link,
https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/648560264

-- 
Linaro LKFT
https://lkft.linaro.org
