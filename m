From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Tue, 11 Aug 2015 08:51:08 +1000
Message-ID: <20150811085108.43baa983@canb.auug.org.au>
References: <20150810150741.5969efdb@canb.auug.org.au>
	<20150810054652.GA26735@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46770 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754832AbbHJWvM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Aug 2015 18:51:12 -0400
In-Reply-To: <20150810054652.GA26735@dtor-ws>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>

Hi Dmitry,

On Sun, 9 Aug 2015 22:46:52 -0700 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Thank you for the patch. I think we actually want GPIOD_OUT_LOW and kill
> the "else" branch altogether, like below.

I will use your patch from today.  Thanks.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
