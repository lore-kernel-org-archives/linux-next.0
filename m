From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the mfd tree
Date: Wed, 2 May 2012 00:56:24 +0200
Message-ID: <CACRpkdadH_Ju=Nvpem=1nvMBROwjS-ipJcmKTnU9-Hz8SAOBkw@mail.gmail.com>
References: <20120501153441.5e101139fb096ef262ff1d2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:41857 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755564Ab2EAW4Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 May 2012 18:56:25 -0400
Received: by yhmm54 with SMTP id m54so37154yhm.19
        for <linux-next@vger.kernel.org>; Tue, 01 May 2012 15:56:25 -0700 (PDT)
In-Reply-To: <20120501153441.5e101139fb096ef262ff1d2b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-1?B?IlV3ZSBLbGVpbmUtS/ZuaWci?= <u.kleine-koenig@pengutronix.de>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, May 1, 2012 at 7:34 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/mfd/ab5500-core.c between commit 9ea969f0d79d ("mfd: Mark const
> init data with __initconst instead of __initdata for ab5500") from the
> mfd tree and commit f76facc2354b ("mfd/ab5500: delete AB5500 support")
> from the arm-soc tree.
>
> The latter removes the file, so I did that.

That's correct, thanks!

Linus Walleij
