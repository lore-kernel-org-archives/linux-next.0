Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65287C4361B
	for <linux-next@archiver.kernel.org>; Wed,  9 Dec 2020 22:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CB8523C85
	for <linux-next@archiver.kernel.org>; Wed,  9 Dec 2020 22:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388292AbgLIWDc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 9 Dec 2020 17:03:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:54404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729913AbgLIWDc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 17:03:32 -0500
X-Gm-Message-State: AOAM5314iue4pLH38C/GNmMeWMPA93XzCXzUmrDiqDPdfP+srUfTk4N2
        WQYk0GQuHp3eLKcZqQYStsBud3ioinbJe1gQK+o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607551372;
        bh=JCude28q2g6snMRZwQ5K6tbt5uwIDwXDSxW27tRMs30=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hTqckIueLlJLXPjlSYDUELooNVGubLpgntUX9AymJtL8N35F87GtVll3sQj1MuqNx
         8Y8BLAPX1v0lyzs+X9JDnivpvvKtcUbawp8go1Q1k4jDIp2isvUYoozKqi5OroGnrG
         PBXocHP9mk2o3wQdcl6diCtiF0iZrDtPHak4lB/5d7HW935oMMOh5caN4vCYSAAIKi
         0FatXrOUOm1wL5bk4HNvMBZvQhDaAXE8+aR4vgSdqZIlS4DeAYOBc0pIJz2Vxe5KGx
         HKHvd0sSRgQ21Vsnll1y3r3cghrgwCNsKMOc7rYNlNx/EQI3Ge0JLe0XHJs/xaceHn
         /6ZFbXGxU60tw==
X-Google-Smtp-Source: ABdhPJw8goDy0itTA2VI4d3XDkNVE0XD+LpBPhp3NSyXxvqXa/C7Xbi80wm5Nllyk91e1KOMYQV/i52+r+1XI9O3YGc=
X-Received: by 2002:aca:418b:: with SMTP id o133mr3249258oia.67.1607551371422;
 Wed, 09 Dec 2020 14:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20201210083553.73aaf0b4@canb.auug.org.au>
In-Reply-To: <20201210083553.73aaf0b4@canb.auug.org.au>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 9 Dec 2020 23:02:35 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ivVR8oMTjLPbhWbSbtd=q3kB=zhDCmowjVWTe-k1oCQ@mail.gmail.com>
Message-ID: <CAK8P3a0ivVR8oMTjLPbhWbSbtd=q3kB=zhDCmowjVWTe-k1oCQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 9, 2020 at 10:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>   2305d20f251d ("firmware: xilinx: Mark pm_api_features_map with static keyword")
>
> is missing a Signed-off-by from its committer.

Thanks for pointing it out. Just when I apply two last fixes before
sending out the
fixes pull request to Linus, I make a mess of the trivial fix...

       Arnd
