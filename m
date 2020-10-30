Return-Path: <SRS0=1Blo=EF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FB4C388F9
	for <linux-next@archiver.kernel.org>; Fri, 30 Oct 2020 10:30:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7443F221FA
	for <linux-next@archiver.kernel.org>; Fri, 30 Oct 2020 10:30:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NR8L81S9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgJ3KaA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 30 Oct 2020 06:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgJ3KaA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Oct 2020 06:30:00 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D105C0613CF
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 03:29:58 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id n5so6037050ile.7
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=9sx1pWoZJXcLY5Wm9TAUSmY3vOK4DUm68sL/ca16vuM=;
        b=NR8L81S9+Q2rXA+eNj78mO7XRQt/RQds0XcWiIlxQrVyNS5GfvcsC4N6yEaw/f8ASU
         s1m7i8Y+7SbD4J7dAmapYnZlltdUG/gVaPWBLa5DciSelzGlDb4qFKHJxhhksIajQ3P1
         OH23wga6hVxGgb6M9F79k86YLkAf7XIVFvrwyt9Kc8eK7/KC+hcZCMuGZzLBPO4jZG1m
         XzFwzagCmUmBPdx62fq2AGUwhruZGjTYo6sVz7mgGW+X9iJaETPm1vsTB0wnvj1mig2g
         MeJ0D+uWfjT8t9XQsPkACY7Mdbu3JT+qtdhKxL8YfQ48DWL0j6q07HPYCE9rNVhbYR9m
         1W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9sx1pWoZJXcLY5Wm9TAUSmY3vOK4DUm68sL/ca16vuM=;
        b=fBXsHXD2LU9XDxkxAwGMwwqwJtOlfBoo9HQOaHMHhrVIGmZmy4hP84XWQNw8emklP4
         PgsCXEp/sAzXpwwkCAgMf/JNs0cd4EATXb3PNmiDy/rA969wvCPSoB/+7BJ8cUBcJfuI
         Eo4jWgX+yLCj3z370gYHye0JTrGDuS06tp+wFkc7Jn8VDhYZmKP3zYoxbmC3+Nb+gU9n
         19PSSpp2LebmT3fxLoRCzKwmNLM8oFKw1ruRXHOka/UePDbi3ynJl/FXMZwDalcNnxzD
         n2yjqI7XoF65ulKYCtjBQh3Vmvb6FmtmkG+cBG4urOW9SYfO8Y4tkzSaeLGO5v4aoY1A
         PBUA==
X-Gm-Message-State: AOAM5305N6vWsuodxu/+gd5sBIomiNsg9OIaRqsUGQUY1sv6Flnfz7gl
        FODSPu+1vriZgPfP4QPw/xWbVQoqanrPToFxx2qJHC8h+1E9ZQBC
X-Google-Smtp-Source: ABdhPJwKPzdHqKZmTe0eTTdzPBkY2P1Ps01r+uZ6c9N+iLdEzFKoIHdfBMck7ydrFn1gCt7CIdg8r7pdE9inLUPmDxw=
X-Received: by 2002:a92:9ed1:: with SMTP id s78mr1294883ilk.71.1604053796854;
 Fri, 30 Oct 2020 03:29:56 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 30 Oct 2020 15:59:45 +0530
Message-ID: <CA+G9fYth+F1TnG6GQNKtrxvChvX9m+nGa8LKFG18WCzsqNJg5w@mail.gmail.com>
Subject: arc: kernel/entry.S:310: Error: inappropriate arguments for opcode 'and'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-snps-arc@lists.infradead.org, lkft-triage@lists.linaro.org
Cc:     Christian Brauner <christian@brauner.io>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vineet Gupta <vgupta@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

arc defconfig build failed on linux next 20201030 with gcc-8 and gcc-9.

make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arc
CROSS_COMPILE=arc-elf32- HOSTCC=gcc CC="sccache arc-elf32-gcc" O=build
uImage
#
../arch/arc/kernel/entry.S: Assembler messages:
../arch/arc/kernel/entry.S:310: Error: inappropriate arguments for opcode 'and'
make[3]: *** [../scripts/Makefile.build:364:
arch/arc/kernel/entry-arcv2.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

-- 
Linaro LKFT
https://lkft.linaro.org
