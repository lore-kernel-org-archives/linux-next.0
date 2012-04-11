From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix build when CONFIG_OF && !CONFIG_PINCTRL
Date: Wed, 11 Apr 2012 10:29:23 +0200
Message-ID: <CACRpkdYAzoiXvTQQCivNnsvmMu_93jWs1rnAqb4R7XGhboWUPA@mail.gmail.com>
References: <1333511636-9987-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:50692 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751821Ab2DKI3Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Apr 2012 04:29:25 -0400
Received: by yenl12 with SMTP id l12so311974yen.19
        for <linux-next@vger.kernel.org>; Wed, 11 Apr 2012 01:29:24 -0700 (PDT)
In-Reply-To: <1333511636-9987-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Warren <swarren@nvidia.com>

On Wed, Apr 4, 2012 at 5:53 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> pinctrl/devicetree.c won't compile when !CONFIG_PINCTRL, since the
> pinctrl headers don't declare some types when !PINCTRL. Make sure
> pinctrl/Makefile only attempts to compile devicetree.c when OF &&
> PINCTRL.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

OK applied this instead of the Kconfig way of fixing things...

Thanks,
Linus Walleij
