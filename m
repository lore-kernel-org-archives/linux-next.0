From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drivers/pinctrl: grab default handles from device core
Date: Fri, 11 Jan 2013 21:45:21 +0100
Message-ID: <CACRpkdbFH6RCEEnXO=A9FVa0B5rtE9RkjXz9Hhy+w7NvwcBCgg@mail.gmail.com>
References: <1355343907-11535-1-git-send-email-linus.walleij@stericsson.com>
	<50EF27B4.60608@wwwdotorg.org>
	<CACRpkdZ0b=ZohgaBH3qPH_O5TiWmXJXs6872D+YPVA9g4BssYg@mail.gmail.com>
	<9702060.jEbHySsCv0@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:65444 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753523Ab3AKUpV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jan 2013 15:45:21 -0500
Received: by mail-ie0-f169.google.com with SMTP id c14so2911056ieb.28
        for <linux-next@vger.kernel.org>; Fri, 11 Jan 2013 12:45:21 -0800 (PST)
In-Reply-To: <9702060.jEbHySsCv0@avalon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>, Stephen Warren <swarren@wwwdotorg.org>, Greg KH <gregkh@linuxfoundation.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Kevin Hilman <khilman@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King <linux@arm.linux.org.uk>, Benoit Cousson <b-cousson@ti.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Felipe Balbi <balbi@ti.com>, Rickard Andersson <rickard.andersson@stericsson.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Mitch Bradley <wmb@firmworks.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-next@vger.kernel.org

On Fri, Jan 11, 2013 at 9:36 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> I've sent several patch series for the SH PFC (Pin Function Controller) to the
> linux-sh mailing list. One of the series included pinctrl core patches for
> easier testing, but I made it clear that they should *not* be pushed to
> mainline through the SH tree.

No big deal, what fun is linux-next if we don't break it ;-)

Yours,
Linus Walleij
