Return-Path: <SRS0=z0z5=UY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69CAC48BD4
	for <linux-next@archiver.kernel.org>; Tue, 25 Jun 2019 12:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D5A8204EC
	for <linux-next@archiver.kernel.org>; Tue, 25 Jun 2019 12:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNl/mGWj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfFYMPr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 25 Jun 2019 08:15:47 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:39099 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfFYMPq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jun 2019 08:15:46 -0400
Received: by mail-lj1-f172.google.com with SMTP id v18so16012756ljh.6
        for <linux-next@vger.kernel.org>; Tue, 25 Jun 2019 05:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVlWq4/BQqPztpggKPVINKm79Md9jcyn8aLuG6vQHeI=;
        b=HNl/mGWjPeSUSyZPUQ3OIUZOZVm1mrWsmFnYUAyU0sRMt0h3xZg6iFoJZhCd0kpB9T
         YVZ5nb7hekT/jUMtDCgo9uakv52Ycack+GTiDPVhQe0ZSzMrXBFU3N8iCGyjlGlBpyWQ
         xwe1gfIKloF+vx0ToCo6T5NwymDJRiMDcbqLvhO9v5cwgMR+MdTUWwwQHbq4Mi3DOiuN
         5At2NCKTGpXGu3mJ7LinfKJyxodOMzGThecgErtqhXnS78mQtEXT2wqTrvecQhcw1qc9
         5ZRuyml9RJFnVwgvaZhW+hnJGx5xuvADpACshvskksBt4BXQfmcunaXvx0asqwE1+X2p
         lG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVlWq4/BQqPztpggKPVINKm79Md9jcyn8aLuG6vQHeI=;
        b=mesqrKclfxYN4yILUO9fFfvwQUyf48npaL4a6TQjs24OkGk5rFLwNhH9W4XfCfBxhr
         i/wBIQXRKnJPMM8lPiUHJggMtHA9c4fJDQpo6y4ZeEibt/YJvRDtH2bUHTgx1RrhGPTl
         i15LdZuRlsTsUAaEjabLlpPWWvV8rdxQ3SrgdysP5I8kY3blMglngrlCBUZ78CbWZOSG
         wrXxFc3LbM8CScVaF80Jn8JcQodnZp75YIVzp/vlDoEskL/hTdGtnFuFaOYp9nnAvUhU
         e4pilp4xY925lv9GMwl1BlGv/ykfwsjHzvbSX3efGIL0bl7kJEjAuYvDHj8q7xBXu3Zu
         3kWw==
X-Gm-Message-State: APjAAAWf4sl5gzEGsUrXmA0RVCWA0Jb7M/LCAsuhW3n94l7faeh9Qltf
        1SCtFT/Gl7qXP4kFhtC1NZ5C7fEIFWAaJj6tb8ZeSO1Z
X-Google-Smtp-Source: APXvYqzSMkStoB94Pyqkd+inwH/OGb0QJP1ACp2mHcaMCKQSrBuxEtKDFylVLcPdIM6MsEMan9Oxg8W/mIhMgAxRn2Y=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr52310157ljm.69.1561464944810;
 Tue, 25 Jun 2019 05:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190620210834.7f952c18@canb.auug.org.au>
In-Reply-To: <20190620210834.7f952c18@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:15:33 +0200
Message-ID: <CACRpkdZoyh5cae3hhOO0ZbmCr4BevUX20FR-nHVPT4qW=ncJvQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 20, 2019 at 1:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
>
>   905dade66268 ("pinctrl: mcp23s08: Fix add_data and irqchip_add_nested call order")
>
> Fixes tag
>
>   Fixes: 02e389e63 ("pinctrl: mcp23s08: fix irq setup order")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks Stephen.
I fixed it up!

Yours,
Linus Walleij
