From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix build when CONFIG_OF && !CONFIG_PINCTRL
Date: Tue, 10 Apr 2012 10:53:34 +0200
Message-ID: <CACRpkdbceDUOj4GoAH6FXpMQt6QQopRQsXbfKW9PDTkgk+gZkQ@mail.gmail.com>
References: <1333511636-9987-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:39722 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753153Ab2DJIxe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Apr 2012 04:53:34 -0400
Received: by yhmm54 with SMTP id m54so2171983yhm.19
        for <linux-next@vger.kernel.org>; Tue, 10 Apr 2012 01:53:34 -0700 (PDT)
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

I fixed this other Kconfig patch to address the same problem.

If you think this approach is better let me know...

Yours,
Linus Walleij
