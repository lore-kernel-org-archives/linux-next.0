Return-Path: <SRS0=Vtnz=UZ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42D1C48BD3
	for <linux-next@archiver.kernel.org>; Wed, 26 Jun 2019 14:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89403208CB
	for <linux-next@archiver.kernel.org>; Wed, 26 Jun 2019 14:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j76bodnB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbfFZOLL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 26 Jun 2019 10:11:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41864 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZOLL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2019 10:11:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id 205so2360444ljj.8
        for <linux-next@vger.kernel.org>; Wed, 26 Jun 2019 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZgFMa9Y26kQCWHNOMiCF1qTPzlaDQuATgwwzmRwsuO8=;
        b=j76bodnB5J0pEQD7YCCdT+lcMefBQm3vIuqwobKnnGnPbxOmDElj//6NotynhdX8U2
         K0JFu2W+90LrnMfwQEdwGYWHd14P3beVyR4qQby97mEBtBpV/iluRSwOBr6LjlAevFh6
         VH0StCUrKKckkzZNu/Hfh8NHBQzoIUqaQvhTklvYMEalXQBvggF4jqMovkGJ5Bw91Mv6
         ts3173Q83nCFybDvVWbttJ1dhg0elmsugM69fHWtZoCFcFCSoP+xfj5Ly7y0OQ+fmucp
         Nc/AfWWS2Kgmb2STnlETIrDnfz9UYfnpvHpuxPlhBk5LjEIumuObs7j9W4VGPDQwmojI
         aUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZgFMa9Y26kQCWHNOMiCF1qTPzlaDQuATgwwzmRwsuO8=;
        b=b439pmb5Ppk2yn9hG1IElxxKFBzhb+LLD20fG1har894AdKRsV6NB118Et8Av3D6xd
         D0hUGOIGf7GxegStfjoILP0dCk/yG7Obqn64N0huE8LU0/hG5S2ifUbn7RDrDISCN47J
         I6zpbQ204bbdtjDJVPCR+efdS8c3V+KnzzOmg9qXdxTUIxw7Cl9469rJLWw1AKlG2SSY
         cWF1xJfV/m6NSWlXblNAyvNzRC/1TUY2LK/9FwKYROpZ6V6YhRRNM+wUicTcgHOnV51N
         U6ZuDbHT6FGikoBKNpIfrgLDvo8BSo4xOFme6OfbLqWXQhhIqHdr4SaxGzlSgjZ/KxyE
         AR5w==
X-Gm-Message-State: APjAAAXa4knJvre65TLNRM26aUI56DlSy2juWjeN1S673OE4ZomMOZKt
        bhWdi+JG9RyEcqYr/iWu4I5OYx1oTwEGgNDo9zUbaA==
X-Google-Smtp-Source: APXvYqzMnWdtbJcUq8EUwMWYCTDwVph/PVgkZMkdDc2sOwi2XRH4GT/0UaU1fJ6GixYV5fCVdWOf8+4XDJzn4k27zGA=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr3170958ljm.180.1561558268960;
 Wed, 26 Jun 2019 07:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190626235011.7b449eb0@canb.auug.org.au>
In-Reply-To: <20190626235011.7b449eb0@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Jun 2019 16:10:56 +0200
Message-ID: <CACRpkdaHyb=o=9YzSvKWRbbyPCbsOUxC=zoz+acnTWNvp=vu5w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 26, 2019 at 3:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
>
>   99fd24aa4a45 ("pinctrl: mediatek: Ignore interrupts that are wake only during resume")
>
> Fixes tag
>
>   Fixes: bf22ff45bed ("genirq: Avoid unnecessary low level irq function calls")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks Stephen, fixed this.

Yours,
Linus Walleij
