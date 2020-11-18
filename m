Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658BAC56202
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 10:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA6FB22228
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 10:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRqvIq63"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgKRKvh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 18 Nov 2020 05:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgKRKvh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 05:51:37 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46971C0613D4;
        Wed, 18 Nov 2020 02:51:37 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id l11so793293plt.1;
        Wed, 18 Nov 2020 02:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t0Vuto0BUviguXwWoDKUrrYjmCgOjaYTtItUfZn24f8=;
        b=aRqvIq63nsVYtqPC1fxcpPY9WaU5nNW89Eb4LqWdUKdAyjtt1srhfUc1ZX0xTNWZL3
         RtQlmqyr6jfS5xfwKfQPrpstXGas3S99+NWUMSppfLZrIpMRo/nLg627CT1Nhlc6nV+8
         xv8ZraHr8bXNd+5wp/asKP99Ub2TmyKXj8WL4XDUTJoYUwKpk2bxF/YhE8oXGM4tkLKK
         EJP74SL4UIPrGFfvPG+fM7ns8Gota9wDbmarN/ukqilw9PC+d5vQJXzje93+zK1w4XKC
         xwocTT5sZe1+KJW5Enp3ufMi1vi13Iw1vxA+/CEDcql/+rLvCTGODQMj6lsPkyjY4yVf
         V3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0Vuto0BUviguXwWoDKUrrYjmCgOjaYTtItUfZn24f8=;
        b=G04o6/2mVmpG2hJkmJqL3BCAPcCV3ZGaNsEZqiSpnA8WTG0C59EzAcQOCaar+ccCTd
         8zMeECZBNfWuFui0aCtpo17WBHoNip7Es3fpuie4j8KnnKsGqRYt1ONf0a9k5bBjP3BB
         LC9FcZ7mCm9lZ3XkP9xmaAorLMeNxmhUmPLj6xynRvBg49d5oFDEorqY/0QpUAsLpbRx
         TV7nWwHBFQJXruTOZVOHXQ2dNYKY91ldGepb9FcqgW0mF88/L97TKp2khlAejjWz6z0A
         05X8qP8z0h4dQxN6UviZGeOgBkRrHRoHQjv1xZ6tRVaWQrwOub/TEHBHMw+SY5giiTjY
         A/jg==
X-Gm-Message-State: AOAM533OGtMlT/xOtEkDMlnT6AyozyihI4Vdn843Ti678PasyRxIssuJ
        D1qkWrQwFAcERNim8lSK5ARIvfJ6sC7KUqtcJ/TYsfvYV1RM6g==
X-Google-Smtp-Source: ABdhPJzg2s+W6+97hC0LdMtXMA4BFRILwDU9cUYcGnPn/uZ+dwsEabPin4jdS7cCNf6gNlRyr+MZdPC/QDhua77vmTE=
X-Received: by 2002:a17:90a:9f8e:: with SMTP id o14mr3325407pjp.181.1605696696846;
 Wed, 18 Nov 2020 02:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20201118142445.461d3792@canb.auug.org.au> <CACRpkdahE38tamkVZLx+m3nkE_dDfaN-u7gEwH48BEnf1BvsFg@mail.gmail.com>
 <CAHp75VevuYCZVPw8HHcaoGdHBvXxHTNnujbf2BUyBECmFHZFDQ@mail.gmail.com>
In-Reply-To: <CAHp75VevuYCZVPw8HHcaoGdHBvXxHTNnujbf2BUyBECmFHZFDQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 Nov 2020 12:52:25 +0200
Message-ID: <CAHp75Vcuxc1Ypo6GV_a2hACWPFqg4m8mZr8mLHD=LgWpLLEWMg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio tree with the kspp-gustavo tree
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 18, 2020 at 11:29 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Nov 18, 2020 at 9:53 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Nov 18, 2020 at 4:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > >   b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang")
> > >
> > > from the kspp-gustavo tree and commit:

Gustavo, one remark though. It's not okay to hide changes from
maintainers. I have checked
b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang") and found
nothing except your SoB.

Please, inform maintainers about changes you are doing in their realm(s).

-- 
With Best Regards,
Andy Shevchenko
