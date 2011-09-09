From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: at91 next tree
Date: Fri, 09 Sep 2011 14:14:19 +0200
Message-ID: <4E6A031B.6020804@atmel.com>
References: <20110422155122.GB23775@game.jcrosoft.org> <20110423095558.99ee7136.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from newsmtp5.atmel.com ([204.2.163.5]:14888 "EHLO
	sjogate2.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933308Ab1IIMOg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Sep 2011 08:14:36 -0400
In-Reply-To: <20110423095558.99ee7136.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, Russell King <rmk@arm.linux.org.uk>, Patrice VILCHEZ <patrice.vilchez@atmel.com>, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>

Stephen,

Le 23/04/2011 01:55, Stephen Rothwell :
> Hi,
> 
> On Fri, 22 Apr 2011 17:51:22 +0200 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> wrote:
>>
>> 	I'd like to known how we could get the at91 at91-next branch pull
>> 	in the next tree automaticaly?
> 
> You request it :-)
> 
>> 	git://github.com/at91linux/linux-2.6-at91.git at91-next
> 
> I have added that tree to linux-next.

Can you please move our at91-next branch that is included currently in
linux-next to the "2.6-less" github tree?

git://github.com/at91linux/linux-at91.git

(I hope that the merge conflicts that you have just resolved will not
suffer from this move: but as commits are the same, I am pretty sure
that it will be transparent).

Thanks for your help, best regards,
-- 
Nicolas Ferre
