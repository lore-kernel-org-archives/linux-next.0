From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the at91 tree with the arm-soc tree
Date: Thu, 24 Nov 2011 11:47:36 +0100
Message-ID: <4ECE20C8.70400@atmel.com>
References: <20111124121611.fe102955910da2b603032d07@canb.auug.org.au> <20111124095603.GA5048@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from newsmtp5.atmel.com ([204.2.163.5]:56361 "EHLO
	sjogate2.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751974Ab1KXKsJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Nov 2011 05:48:09 -0500
In-Reply-To: <20111124095603.GA5048@totoro>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jamie Iles <jamie@jamieiles.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On 11/24/2011 10:56 AM, Jamie Iles :
> Hi Stephen,
> 
> On Thu, Nov 24, 2011 at 12:16:11PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the at91 tree got conflicts in
>> arch/arm/mach-at91/board-cap9adk.c, arch/arm/mach-at91/board-cpu9krea.c,
>> arch/arm/mach-at91/board-cpuat91.c,
>> arch/arm/mach-at91/board-snapper9260.c and
>> arch/arm/mach-at91/include/mach/board.h between commit 84e0cdb0a262
>> ("macb: unify at91 and avr32 platform data") from the arm-soc tree and
>> commit 1509f4847dd1 ("at91/boards: use -EINVAL for invalid gpio") from
>> the at91 tree.
>>
>> I fixed them up (see below) and can carry the fix as necessary.
>>
>> However, it looks to me that struct macb_platform_data (in
>> include/linux/platform_data/macb.h) will need its phy_irq_pin members
>> changed to int as well (which may have other consequences).
> 
> That looks correct to me.  I've just posted a patch to convert 
> phy_irq_pin to an int and from inspection that shouldn't break anything 
> by itself.

Good, I will Acknowledge it.

> The macb driver doesn't currently use the phy_irq_pin member, but the 
> at91_ether driver does and that compares to 0 for no IRQ so the 
> assignment of -EINVAL _could_.

Yes indeed, I have a patch to address that and I send it now. However, I
guess that this will go on top of Jean-Christophe's gpio patch series.

Best regards,
-- 
Nicolas Ferre
