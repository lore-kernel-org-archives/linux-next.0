From: Chris Ball <cjb@laptop.org>
Subject: Re: [PATCH 6.2/7] MMC: mmci: Enable Device Tree support for ux500
Date: Tue, 08 May 2012 20:29:06 -0400
Message-ID: <87sjfap57x.fsf@laptop.org>
References: <1334325909-5779-1-git-send-email-lee.jones@linaro.org>
	<1334325909-5779-7-git-send-email-lee.jones@linaro.org>
	<CACRpkdYyP=V=aXtDuo_W4oDxH0UkQKq1x1HKG_z=zWHoWng6JQ@mail.gmail.com>
	<4F8BE5B0.4000900@linaro.org>
	<20120425185747.GC24211@n2100.arm.linux.org.uk>
	<4FA29E46.6040204@linaro.org>
	<20120503151253.GE897@n2100.arm.linux.org.uk>
	<4FA2A4A8.9010208@linaro.org>
	<20120503163008.GF897@n2100.arm.linux.org.uk>
	<4FA2B4A3.2040402@linaro.org>
	<20120503164501.GG897@n2100.arm.linux.org.uk>
	<8762cdur7o.fsf@laptop.org> <4FA3D720.7010004@linaro.org>
	<87mx5ot6vp.fsf@laptop.org> <4FA3DC27.6030204@linaro.org>
	<CAP=VYLoLgLmwWTWrJrMBCRLD_BjupjmfV2me6TDeej=ZS=W7hw@mail.gmail.com>
	<4FA90127.1050107@linaro.org> <878vh2rhlh.fsf@laptop.org>
	<4FA918BA.3080303@linaro.org>
	<CAP=VYLoz0o7qh9TNgWPatAsSjtoKoyaBUW7L+3q1w0PsLkOMOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:60663 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752416Ab2EIA3G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 May 2012 20:29:06 -0400
In-Reply-To: <CAP=VYLoz0o7qh9TNgWPatAsSjtoKoyaBUW7L+3q1w0PsLkOMOQ@mail.gmail.com>
	(Paul Gortmaker's message of "Tue, 8 May 2012 19:58:49 -0400")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Lee Jones <lee.jones@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linus.walleij@stericsson.com, arnd@arndb.de, Linus Walleij <linus.walleij@linaro.org>, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

Hi Paul,

On Tue, May 08 2012, Paul Gortmaker wrote:
> On Tue, May 8, 2012 at 8:59 AM, Lee Jones <lee.jones@linaro.org> wrote:
>> Here you go Chris.
>>
>> From: Lee Jones <lee.jones@linaro.org>
>> Date: Tue, 8 May 2012 13:40:02 +0100
>> Subject: [PATCH] MMC: mmci: Fix compiler error when CONFIG_OF is not set
>>
>> error: implicit declaration of function 'mmci_dt_populate_generic_pdata'
>>
>> This is due to the '#if CONFIG_OF' guards placed around
>> mmci_dt_populate_generic_pdata(), but not around the call to it. We
>> repair this by inserting a stub which elegantly returns when CONFIG_OF
>> is not set.
>>
>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Please if possible, do not neglect to add the Reported-by: line when
> appropriate.  I've been at this long enough that it really won't change
> my life any if it is there or not there, but for someone new to linux, it
> might make the difference between an "I'm glad I reported that" vs.
> a "Screw them, I'm not reporting anything else in the future."

Agreed -- I added a Reported-by line when I applied the patch:

http://git.kernel.org/?p=linux/kernel/git/cjb/mmc.git;a=commit;h=c0a120a4bc68f5dc5f5238e76013cc18bac0ffed

Thanks,

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
