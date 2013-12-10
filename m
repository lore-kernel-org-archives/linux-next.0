From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Tue, 10 Dec 2013 09:50:30 +0100
Message-ID: <CACRpkdYznRuiwgbZMZqz9UDsgPiOgs7t8i8cVm+d4ykhMXMz2Q@mail.gmail.com>
References: <20131210140218.645eaf6983481bafe5833eef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:58558 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750887Ab3LJIua (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2013 03:50:30 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so4965482obc.6
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2013 00:50:30 -0800 (PST)
In-Reply-To: <20131210140218.645eaf6983481bafe5833eef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 10, 2013 at 4:02 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> sound/soc/fsl/eukrea-tlv320.c:28:28: fatal error: asm/mach-types.h: No such file or directory
>  #include <asm/mach-types.h>
>                             ^

It is trying to include an ARM-only file in an x86_64 compile...
I think the Kconfig for that driver needs a

depends on ARM

Yours,
Linus Walleij
