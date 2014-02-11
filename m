From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Tue, 11 Feb 2014 09:21:18 +0100
Message-ID: <CACRpkdbVABu_BFa==ArUzpeR87QyJBLMmngwC_K7foaX4oUTyw@mail.gmail.com>
References: <20140211145606.9e46a881c51e7aa71da43e4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:53748 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750872AbaBKIVT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2014 03:21:19 -0500
Received: by mail-oa0-f42.google.com with SMTP id i7so8841884oag.1
        for <linux-next@vger.kernel.org>; Tue, 11 Feb 2014 00:21:19 -0800 (PST)
In-Reply-To: <20140211145606.9e46a881c51e7aa71da43e4c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>

On Tue, Feb 11, 2014 at 4:56 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> drivers/pinctrl/pinctrl-st.c:407:18: error: 'stid127_delays' undeclared here (not in a function)
>
> Caused by commit cab6bf05bab5 ("pinctrl: st: add stid127 support").

Oh darn, I was waiting for an update of that patch but forgot.

I'll rip out that patch immediately, sorry!

Yours,
Linus Walleij
