Return-Path: <SRS0=AjV7=V3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24A1C0650F
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 10:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7844B2089E
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 10:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HRkCSNBy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbfG3KuM (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 30 Jul 2019 06:50:12 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:44761 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729654AbfG3KuJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jul 2019 06:50:09 -0400
Received: by mail-lf1-f52.google.com with SMTP id r15so27389571lfm.11
        for <linux-next@vger.kernel.org>; Tue, 30 Jul 2019 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=F31cQ0ne3p3xFuaSlxROjZYeTvKp+9tCo1IZnDyB5kc=;
        b=HRkCSNByu31f39s+lOU22nTucb6QbcbWxwwj2ZbJu2tlOmUkF6O1+iJIl6/diz7cjg
         VJ144Pqm1gbPTn1+ZPtAKLEjE7uhacH6kI7XZaj5nsEooGsiyEsFUT2qdQqLNRMurpZA
         NGSIC3XDmnQdAJOWMInyzabVKWoeGcS/K3+4nJ7RcucAwhGOpxPVD2pZfD4+1slua4f4
         ZwN9ay3V3Jgh6yIYHl+k6FMe66BVMzDCRsvS7wpUqsXSaswZbsSls5E28EfPSZEO6wcN
         LfzadRc9jB/AVts4r+OUvrgBhohfoKa+tsEuimsamKkhxylbovNJwMwJmdclpDIuTMj0
         lMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=F31cQ0ne3p3xFuaSlxROjZYeTvKp+9tCo1IZnDyB5kc=;
        b=Oj3dt35LlbONtkjjnTOahxgINVRJ9tC7kGKzyXQZ3ynydGdUKZbnwBrb7GbH8DuYmT
         I5tduZM4tPR9ppphpVwhAl/CMPuS09F5llVT2W3sTl+ovvFhgK+sy2ipbyj9/g/0SJqJ
         pwqoGO1XwYwguBA0WPab/LQkMOd19dxXwSU1akD638BBXx1d8fIJ2wsWZVr1QsuiIpx7
         4J7PMz67zslVjPU6FmdNGkBBCy7zrABlPYScp+TcFUycZ/jIKMVIshRG/b1mYhm/YzUo
         GAEmbkTcJq7k95T18HwLISix9qM4MXb5FkII4Z6RrQEshrY3/P20E2c0oCGbrJLonK2I
         p0IA==
X-Gm-Message-State: APjAAAWdwA2lGl5VifbJFeZeF5QSUu9/umOST112F/7K7dnYz1fyGTyv
        +ARTOZChJlhefkP/ytFXqigNk5sBofgkJyV9o/Qa5i43BpA=
X-Google-Smtp-Source: APXvYqy3j01W1DiK77paO5P6wAyETN2Q1v+EqaF8qkc9KhP+lBvg1oeHOI1YhDj6KVh1ScwmIbAm5j/jergMRP5DZrE=
X-Received: by 2002:a19:ed0c:: with SMTP id y12mr246679lfy.191.1564483806778;
 Tue, 30 Jul 2019 03:50:06 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 30 Jul 2019 16:19:55 +0530
Message-ID: <CA+G9fYtWFhak1_N1sAJk=HGo+yzYvrU9DDfZRV_3a8C9JUMT0Q@mail.gmail.com>
Subject: linux-next 20190730: undefined reference to `gpiod_get_from_of_node'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        open list <linux-kernel@vger.kernel.org>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Today's linux next 20190730 build broken for x86_64 and i386.

drivers/gpio/gpiolib-devres.o: In function `devm_gpiod_get_from_of_node':
gpiolib-devres.c:(.text+0x203): undefined reference to `gpiod_get_from_of_node'
Makefile:1063: recipe for target 'vmlinux' failed
make[1]: *** [vmlinux] Error 1

Full build log link,
https://ci.linaro.org/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=intel-corei7-64,label=docker-lkft/574/consoleText

Best regards
Naresh Kamboju
