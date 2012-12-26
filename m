From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the pinctrl tree
Date: Wed, 26 Dec 2012 01:34:29 +0100
Message-ID: <CACRpkdb50D+PMNf9sPTGUs9fsE-QOP0aWB+_aQ6ZpqLuFkvjUg@mail.gmail.com>
References: <20121221132014.0bf8772fb3e48c51cec1548a@canb.auug.org.au>
	<027101cddf2c$b4f2f9b0$1ed8ed10$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:42193 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618Ab2LZAea (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Dec 2012 19:34:30 -0500
Received: by mail-ia0-f174.google.com with SMTP id y25so6650917iay.19
        for <linux-next@vger.kernel.org>; Tue, 25 Dec 2012 16:34:29 -0800 (PST)
In-Reply-To: <027101cddf2c$b4f2f9b0$1ed8ed10$@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

On Fri, Dec 21, 2012 at 4:38 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Stephen Rothwell wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the arm-soc tree got conflicts in
>> drivers/pinctrl/pinctrl-exynos5440.c and
>> drivers/pinctrl/pinctrl-samsung.c between commit e5b4c9d4ab55 ("pinctrl:
>> exynos5440: Fix compile error in pinctrl-exynos5440/samsung.c") from the
>> pinctrl tree and commit d5fd5da290ce ("pinctrl: exynos5440/samsung:
>> Staticize pcfgs") from the arm-soc tree.
>>
> Oops, the commit d5fd5da290ce already sent to Linus Torvalds via arm-soc
> tree today. In addition, I applied with Linus Walleij's ack ;-)
>
> Linus Walleij, please drop the patch in your tree. Sorry I didn't notify
> about that when I got the patch from Choi.

OK dropped it, sorry for the delay...

Yours,
Linus Walleij
