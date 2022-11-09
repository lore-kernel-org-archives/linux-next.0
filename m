Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E6CC4332F
	for <linux-next@archiver.kernel.org>; Wed,  9 Nov 2022 08:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiKIIdB (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 9 Nov 2022 03:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiKIIco (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2022 03:32:44 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D5E22BDB
        for <linux-next@vger.kernel.org>; Wed,  9 Nov 2022 00:31:19 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id m22so7513962eji.10
        for <linux-next@vger.kernel.org>; Wed, 09 Nov 2022 00:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1xHWWbiiK/Pvy+0DuJmabIzb5bjUgxiCFd5RDREmog=;
        b=kVSIeK3HgspV1mdpXhzA1BrripthgSeMREB+K9ArgoFecjHGj8PCLukPUsZLqyt8aS
         lVG0afrwNVsjCMdJ7jtR6RA742ZxBt8k5K6HiIHuwcjN3eVjFj5+OcSoKKhj2BDOgv6i
         zhy8fsP7Q8SiYdAlMtwMmZP69Rnv4sCKZ+b4ggvXwkniVDz/cJFIcHnqeMTuKi0ABPi9
         svvQ5YjSoWqgKFIGSLqbSJdSOzfK2HViq3kFay/KCA8GP2yhWxVv9SF3yflVeHvAMBMk
         0wa0Rs1xUm4qsbAKSK48onvXkkxV1VqUSAPz3LQHDsBIUgko7D602br7yBDXTKc8rlXY
         9N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1xHWWbiiK/Pvy+0DuJmabIzb5bjUgxiCFd5RDREmog=;
        b=G+0XsP+TpMxsKkn3HZNyAzQNfDY3TPqgrYgySAI18BGSoVMH8PL9jl2wEUMhbK3tfb
         gZJx07bIhEzvRSdPzzjuS7vsGOX9Gh+SyQH4AOA1ub6C5CwvlPEzXqXJXBAmvVE6eKt1
         EEyJoOtt0mBndFDPmCJceGBt6J5SK4fdcY2y865SCK74PCeGeCxw06Nh2itMnZWpQeGn
         MB47jqRLlbb5/fCu05znN3kn5DKl6SFhAZfKM0HzC8XcB6+07LjpQpB3nninKfZ0b0P2
         MELY7Ym1GCfKSqTsuyTJp9rt8vYfSDWcvYlsMIqkOAHGts+h1VWCfxw8hLo97nJW0TEM
         3BkA==
X-Gm-Message-State: ACrzQf0dMdPc0yYZgeAz9aN33f0n9irB/9wBICXIIV0kOc4gwZ3ra4Jf
        iIOXojb1f+lFIMFg5QgyBNBKDwYU9v1hDxpqOFn0VA==
X-Google-Smtp-Source: AMsMyM5S0pI0Lhb6kU0CQL8E4Q/D4EQYDzZ/ipfZXcrNUfrxHjRIrwrMChdvspsKC740TxNqAu1IhpqHaetzNUcqj0s=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr57279558ejw.203.1667982677745; Wed, 09
 Nov 2022 00:31:17 -0800 (PST)
MIME-Version: 1.0
References: <20221109134644.1621f1e5@canb.auug.org.au>
In-Reply-To: <20221109134644.1621f1e5@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:31:06 +0100
Message-ID: <CACRpkdZOU4afUiTNZV7_dKdMWkVztXKa13EN-qtmWAjY0Ai8OA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 9, 2022 at 3:46 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Fixed by putting in a new v8 version from Yinbo.

Yours,
Linus Walleij
