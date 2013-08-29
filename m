From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with Linus' tree
Date: Thu, 29 Aug 2013 09:34:45 +0200
Message-ID: <CACRpkdaPsV8OePLn0gOC8wc5Ew94KL1CUmngdrdF4M++xk9Ekg@mail.gmail.com>
References: <20130829171704.7a7630dd19d19ccdb9aaf384@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:56986 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753191Ab3H2Heq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 03:34:46 -0400
Received: by mail-ob0-f172.google.com with SMTP id er7so73310obc.17
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2013 00:34:45 -0700 (PDT)
In-Reply-To: <20130829171704.7a7630dd19d19ccdb9aaf384@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@stericsson.com>, Sherman Yin <syin@broadcom.com>

On Thu, Aug 29, 2013 at 9:17 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> Today's linux-next merge of the pinctrl tree got a conflict in
> drivers/pinctrl/pinctrl-sunxi.c between commit 1bee963db9dd ("pinctrl:
> sunxi: Add spinlocks") from Linus' tree and commit 03b054e9696c
> ("pinctrl: Pass all configs to driver on pin_config_set()") from the
> pinctrl tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Hm yeah I think I should just merge in the latest -rc to smoothen
this over, as both conflicting patches come from my tree...

Yours,
Linus Walleij
