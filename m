From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the final tree (gpio
 tree relatred)
Date: Wed, 6 Mar 2013 09:10:42 +0800
Message-ID: <CACxGe6sZKRjSnwa-CHC1OhJoGP-ZQe4H2YbMYjDjNYcSdSyuow@mail.gmail.com>
References: <20130306114452.a041ab0737783f9730c1486e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f173.google.com ([209.85.210.173]:51862 "EHLO
	mail-ia0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756025Ab3CFBLE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Mar 2013 20:11:04 -0500
Received: by mail-ia0-f173.google.com with SMTP id h37so6878089iak.32
        for <linux-next@vger.kernel.org>; Tue, 05 Mar 2013 17:11:02 -0800 (PST)
In-Reply-To: <20130306114452.a041ab0737783f9730c1486e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ian Lartey <ian@slimlogic.co.uk>, Graeme Gregory <gg@slimlogic.co.uk>

On Wed, Mar 6, 2013 at 8:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/gpio/gpio-palmas.c: In function 'palmas_gpio_probe':
> drivers/gpio/gpio-palmas.c:173:2: error: implicit declaration of function 'is_palmas_charger' [-Werror=implicit-function-declaration]
> drivers/gpio/gpio-palmas.c:173:30: error: 'struct palmas' has no member named 'product_id'
>
> Caused by commit 82d4d6637fdf ("gpio/palmas: add in GPIO support for
> palmas charger").  I wonder if this was ever build tested. :-(

Probably not. Looks like this driver doesn't get enabled without the
associated option in MFD. I didn't go searching for it, so my build
tests didn't catch it. I'll drop the patch from my tree. Sorry for the
pain.

g.
