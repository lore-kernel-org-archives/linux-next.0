Return-Path: <SRS0=yqjD=XC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD5CC433EF
	for <linux-next@archiver.kernel.org>; Sat,  7 Sep 2019 23:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9292121835
	for <linux-next@archiver.kernel.org>; Sat,  7 Sep 2019 23:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEYzz/Mm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfIGXRA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 7 Sep 2019 19:17:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45325 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfIGXQ5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 Sep 2019 19:16:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id l1so9230880lji.12
        for <linux-next@vger.kernel.org>; Sat, 07 Sep 2019 16:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9X3MKRZqOo2i+lBy2G/QGJAeOe0J15Q83MeqXScx3cw=;
        b=CEYzz/MmRgqZr7zKGlzRuwOB/YJc8yJbxOzgvmGryCwopa2g/e/AIlPD+SkmY0Wl4M
         9F2cHsH3JOzdGpdacMDzn1HkMQmMsObFxUDUXwsxXL36+RII4K3D2Q/soWoGpUdzAGLd
         61g53edF66mG2Rs9aCBDDs7s+K8o3b3q5Jz2BFom+x+CD7vgthL5XfbIk0u5oGR57oj9
         yKouEjP3H3dBOeE4r2sUMmLLkG3qGz3yRfcr/YPTQGQH4VCzqMWMG1nDOFdik3GXcwV0
         mDstjobZRUu1u7cylBhxPJJQ2m6BYItJW2ZZsQveLSi8JUC7KjYRwErxu8Jy7dx/nMnF
         oZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9X3MKRZqOo2i+lBy2G/QGJAeOe0J15Q83MeqXScx3cw=;
        b=cIfv/FNkJXHPCGvdMKcryxtGL44w2G0Fif/1VX8Bw1QPdFzSy17/dO9nrbLIE3uP2p
         YDCf/qsBibdbwT8NiRRB3p2lScQn9v6/e9r6CNDiXS4nKGSetbMzYlwUQ+RI1KGoSPEH
         D4UDcbYN3IwskdcK3idkQAH4K487plGNdkWa0LCabPxuVIP96dmvOO3aZimfbj8u0BoS
         i/vF6DTz5DZEu79HtqXVgIyc+vDnsBqaNf+uTHLyqKi+XZNnrzl6sl3Nj+5thUm9N7xO
         lqFeOArLZwFlbSg2PfeB2sN0Nc57r7yNtkZO1Bzab8DhUz1biu0c2GhmxhLr2eXbklg3
         Zlbw==
X-Gm-Message-State: APjAAAV7wC/InTi0o1Kwh3LMRPOuitbHPXVEycFwq119PWRRaZ0rYJYn
        A2L+HDdarDNa8vAtZVK3B0LldNPTnypCDo7gWPrnLQ==
X-Google-Smtp-Source: APXvYqzYsR5xXNtHIykfabC3Q23kUEYzNOjacszj2IiGRhPXodUhW/vFEvfKRFkUbKVcmWLetYb679KGODk59RjIXW0=
X-Received: by 2002:a2e:654a:: with SMTP id z71mr10575644ljb.37.1567898215290;
 Sat, 07 Sep 2019 16:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190907010534.23713-1-jhubbard@nvidia.com>
In-Reply-To: <20190907010534.23713-1-jhubbard@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 8 Sep 2019 00:16:41 +0100
Message-ID: <CACRpkdbmw-EOm5Os=BjoX1G+ZDxRGnJ3Zd3BWtDksnQ46aJ_JA@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix build failure: gpiochip_[un]lock*() static/non-static
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Sep 7, 2019 at 2:05 AM John Hubbard <jhubbard@nvidia.com> wrote:

> While building with !CONFIG_GPIOLIB, I experienced a build failure,
> because driver.h in that configuration supplies both a static and
> a non-static version of these routines:

I think this is fixed in my latest version of the "devel" branch?

Yours,
Linus Walleij
