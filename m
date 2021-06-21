Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A111BC4743C
	for <linux-next@archiver.kernel.org>; Mon, 21 Jun 2021 10:56:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 804AD611BD
	for <linux-next@archiver.kernel.org>; Mon, 21 Jun 2021 10:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhFUK7F (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 21 Jun 2021 06:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhFUK7E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 06:59:04 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB761C061574;
        Mon, 21 Jun 2021 03:56:49 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g24so9716986pji.4;
        Mon, 21 Jun 2021 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GdSirJES7B1+22y5mydDEyMVMUgqLhZgeXCo6ocm6Tg=;
        b=ukE4uT1tMT0nHKzWpmnDwTMW5ziHzyfJfSrNUM2chiWb0X4aj0/dZ/TKGLlLiyNElV
         hlNh87XHvXiFdsOXr2F37pDvvxvZoVkXBqIvzRD716AOkZP5juPvEFT8ymr8zWI4kGFt
         mk4uJXlxlSrPx9/QlDsi5P7oDbEfxLPfXwLk3m/E9E4GPR36Ag4y6S/ggb9HFk6kO4K0
         sRv1a2MhYgJweeYJkGg7HqkI5/UgQZwwgYTCh23dT7jcmvh2OaCrKXR1dQ5BnMSjsDi8
         Zb+aemAKs6FH5ejZEM3/TGgvg+OilI+VHHGAbQLl921fZ+H2r5JSiurqXviSB2KoWKmM
         aq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GdSirJES7B1+22y5mydDEyMVMUgqLhZgeXCo6ocm6Tg=;
        b=NATLNF1fx01ftLmM4axR3JDdkzSZU9H/oEcx5bsX18dBYtDvFxEtfQm5gQNDzfzt+E
         XQv0UtMyJEiknMKlRzwuHuoOYNW3T4RcytH9aIsG16PTVj3iXZgK35NeMul1NhgxlFpH
         /LdwEK2BRwXcQnu4R92OGALvwMkCMX33YCo9VWc6THy/QnHIhL8Xg7eUdeE++FMK7WjQ
         Z3xLHJ4Kvb9buoetFtpC3qPhIWDBBG3KnwLcZFgm/7vdhjgJOtGzo36iWxCgZdUB/5WY
         n3v0w5jjrme3znNrGf+WRVAwyaIXy6Y0QnXceXfMW0QnthQ8oeWMzlXasQkmUlq6aydg
         X5Cg==
X-Gm-Message-State: AOAM533VwL6Hyp4QrLj/VWbKNIeAaM8chdxIk6EA898nNe9Brxpe7UJ/
        EYYuhHgMD4LRugQePPDPN0GEx0F0z9Nt+szx/EbpImMtILk=
X-Google-Smtp-Source: ABdhPJymctgxhIT4X+hm8R361mafQr0+PIVLbDv6OAcZd/soTOxY6lMv4qPdjCoJNA3908ou5S5n0Q+Rk1FHcE6t2HY=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr38265326pja.181.1624273009482;
 Mon, 21 Jun 2021 03:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210621141110.548ec3d0@canb.auug.org.au>
In-Reply-To: <20210621141110.548ec3d0@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Jun 2021 13:56:13 +0300
Message-ID: <CAHp75VcJKX4xzP1PrCBixDzgGBGwVvbV3YtMebKxpRoi1_EhaA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the ide and
 kspp-gustavo trees
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, David Miller <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Finn Thain <fthain@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 21, 2021 at 7:13 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:


>   2c8cbe0b2971 ("IDE SUBSYSTEM: Replace HTTP links with HTTPS ones")
>   9a51ffe845e4 ("ide: use generic power management")
>   f9e09a0711ca ("ide: sc1200: use generic power management")
>   d41b375134a9 ("ide: delkin_cb: use generic power management")
>   6800cd8cbc6e ("ide-acpi: use %*ph to print small buffer")
>   731d5f441e1c ("ide: Fix fall-through warnings for Clang")
>
> from the ide and kspp-gustavo trees and commits:

As far as I can tell the IDE hasn't sent PR to LInus for a long time
(like a few release cycles). I don't know what happened there, though.

-- 
With Best Regards,
Andy Shevchenko
