From: James Hogan <james.hogan@imgtec.com>
Subject: Re: Tegra 30 System hangs because of commit "pinctrl: move subsystem
 mutex to pinctrl_dev struct"
Date: Mon, 29 Apr 2013 20:48:36 +0100
Message-ID: <517ECE94.4020806@imgtec.com>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:29600 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932539Ab3D2Tsm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Apr 2013 15:48:42 -0400
In-Reply-To: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bryan Wu <cooloney@gmail.com>
Cc: patrice.chotard@st.com, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 29/04/13 19:15, Bryan Wu wrote:
> Hi Patrice and Linus,
> 
> I'm running linux-next on my Tegra 30 system everyday. But since
> next-20130426 release, the linux-next kernel will hang on my Tegra 30
> boards like Cardhu and Beaver.
> 
> After some bisect and comparing to next-20130424, I found the commit
> "pinctrl: move subsystem mutex to pinctrl_dev struct" introduced this
> issue. If I simply revert this patch in next-20130429, system boots up
> as before.
> 
> Could you please help to check this?

I spent a while tracking this one down today too, then found it was
already fixed. See the patch "[PATCH, for-next] pinctrl: fix mutex
deadlock in get_pinctrl_dev_from_of_node()" from Daniel Mack.

Cheers
James
