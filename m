Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9727AC433F5
	for <linux-next@archiver.kernel.org>; Fri, 22 Apr 2022 22:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbiDVWN0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 22 Apr 2022 18:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiDVWMT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Apr 2022 18:12:19 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5A32E70BC
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 13:59:07 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id p65so16602484ybp.9
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xebxWNQuYNsiULkvsP8Xksi7ExUdkFx9hBwHBb7lxno=;
        b=fkxfcmkFOeL+3mJt+dM8xgC1BKfKmamAcSRTx467jTB3uqfbflUzssUVzH02MVcGYq
         A+OYzIgydCo/ZfHCesO5ybzjSIk+U9cDZ57szKpkov5OtuLSH3B2DvMfOQkmgMwFOUld
         8HUKJu0gt/C4yqGw4RgPcAhjg1Z+oHc8kFbnSfSVbEv++nCZk3vnnmQz8rkSYGiRp8RG
         I4LsW3JUK3CuvDRWEtNvkdNjhFNInwsd+u4xMcYTYXnEUmouZ7j126Azkyz6lGozfAd4
         VubeH+5EHzENhqjtgidGRv5AhFNNzZ6ZpcnKrjieD2EA+mH8i+1m+UflPQpmrbxCTPvx
         /QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xebxWNQuYNsiULkvsP8Xksi7ExUdkFx9hBwHBb7lxno=;
        b=PrVBsKVPCyztCfFa9DY14VcgmFizGAN/KWZgBwOmm8kgVU4pWlMPnWY96VGMEPe1EI
         cIXobOdotqt3k5MV0PGVvRw6MYIcx3RVBTEVCLBbLztKDKJH2Y3EEaGb9lhiUuB78P6u
         fBGndhH/LqAtuYUjlT8tOPZoj39IdLPeEtoJRAyZLi7l0Y7KAv74KQ7bZNUoZp2iHhrq
         VL62+qTFK/AeTP6p1ExP2jbQzvD0n+h22IgvqLjr/r063jRsojj8pProVhfnqQ1KXYcf
         QZrfwMnXcyjD4An2GK2LC/PrF3p1e1selnsd58jEgH729daa12aRkjnOuUJES8PLAXi9
         3cvg==
X-Gm-Message-State: AOAM5306H6pHwenD3DqgeO2g3jiq6vXaaub3lAmthNaMvvuxeomUlOas
        VmJbt27VhN5E6g9ggrlBn345qZbjPqM8OfEnuACAUSA4U1Y=
X-Google-Smtp-Source: ABdhPJz6RHpkF4rIoCwoW3SD2TC5w8sxV/THHy1ewo+Nh1dqN167FqRmTsmEvmNqeKeg57QSnhU1jtx9DmxLtB8AxGM=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr6429543ybr.295.1650661146776; Fri, 22
 Apr 2022 13:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220422083216.304dd75c@canb.auug.org.au>
In-Reply-To: <20220422083216.304dd75c@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 22:58:55 +0200
Message-ID: <CACRpkdav4Lj9mbrk6cracB9+7V+4JUNqsX4ntcbuYTxaHru51w@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 22, 2022 at 12:32 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commit
>
>   c04c391aa743 ("dt-bindings: pinctrl: add rockchip,rk3036-pinctrl compatible string")
>
> is missing a Signed-off-by from its committer.

Thanks Stephen, fixed it up in-place.

Yours,
Linus Walleij
