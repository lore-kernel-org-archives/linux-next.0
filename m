Return-Path: <SRS0=GrK0=DI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655BCC4727C
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 06:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252EA21D7D
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 06:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601533573;
	bh=gVM2lSJpYr4A/OCTAbgS1gfzkmBE/r9dy1cfJh/KIyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=tFk7YvwTb4d6GFj83r+g5JStxNrVao69E8strLOzSkQo8igfuYim1MFKoxjMupFhg
	 MffO0s1NMUHOB4WzE8G4L1LQ+33lHCWZkPR6KpTTzkK5HXt7vKPSp1oxUUdJxRcMva
	 Ge9z5OJkWIhHcc7jmwgPbspm3cPGxaj/qcaxBNlI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgJAG0M (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Oct 2020 02:26:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:41512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAG0M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 02:26:12 -0400
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FBAA21D7D;
        Thu,  1 Oct 2020 06:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601533571;
        bh=gVM2lSJpYr4A/OCTAbgS1gfzkmBE/r9dy1cfJh/KIyw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2iwxiJZlxiwPhNzze7Tok03u4iFNPgmb4qu+NG3dKsOZigTMqE53hk9Ts9DqU5uDd
         VCKhW7/1mpaKHzz+mK3Aqd4/CG++QFFkjbo386bWZnFPSvL2dgBoi727eU3KG7VUlb
         QjFgDhAo0bm77fUjZpht37vExBAAf+VVuCUJEHTs=
Received: by mail-ej1-f41.google.com with SMTP id qp15so5378115ejb.3;
        Wed, 30 Sep 2020 23:26:11 -0700 (PDT)
X-Gm-Message-State: AOAM532048tEyUY/wct1zFYe7s+pTlNPVVpC+SI10QOdbaLs+cqyLPfR
        4oNv9aPFnGVXaZyINnY8gbTrfM8hrKnOODrCuOk=
X-Google-Smtp-Source: ABdhPJyoqoFYnRe71SUdbS5Vy88QbHks1l+087C33Pi1XITMkHO9Jdc4gfaGJl8HPsKRtTiwFcQobuRcN6zRFQ6PsYM=
X-Received: by 2002:a17:906:1a11:: with SMTP id i17mr6353445ejf.381.1601533570039;
 Wed, 30 Sep 2020 23:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201001162237.633d6043@canb.auug.org.au>
In-Reply-To: <20201001162237.633d6043@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 1 Oct 2020 08:25:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdyCYkSE1ie_t5G5X4JStU0zxxuoovLFnUxJP4aQbvM=g@mail.gmail.com>
Message-ID: <CAJKOXPdyCYkSE1ie_t5G5X4JStU0zxxuoovLFnUxJP4aQbvM=g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the mfd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Rob Herring <robherring2@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 1 Oct 2020 at 08:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   Documentation/devicetree/bindings/mfd/syscon.yaml
>
> between commit:
>
>   18394297562a ("dt-bindings: mfd: syscon: Merge Samsung Exynos Sysreg bindings")
>   05027df1b94f ("dt-bindings: mfd: syscon: Document Exynos3 and Exynos5433 compatibles")
>
> from the mfd tree and commit:
>
>   35b096dd6353 ("dt-bindings: mfd: syscon: add some compatible strings for Hisilicon")
>
> from the devicetree tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc Documentation/devicetree/bindings/mfd/syscon.yaml
> index 0f21943dea28,fc2e85004d36..000000000000
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@@ -40,11 -40,10 +40,14 @@@ properties
>                 - allwinner,sun50i-a64-system-controller
>                 - microchip,sparx5-cpu-syscon
>                 - mstar,msc313-pmsleep
>  +              - samsung,exynos3-sysreg
>  +              - samsung,exynos4-sysreg
>  +              - samsung,exynos5-sysreg
>  +              - samsung,exynos5433-sysreg
> -
> +               - hisilicon,hi6220-sramctrl
> +               - hisilicon,pcie-sas-subctrl
> +               - hisilicon,peri-subctrl
> +               - hisilicon,dsa-subctrl

Thanks Stephen, looks good.

Zhei,
However the Huawei compatibles in the original patch were added not
alphabetically which messes the order and increases the possibility of
conflicts. It would be better if the entries were kept ordered.

Best regards,
Krzysztof

>             - const: syscon
>
>         - contains:
