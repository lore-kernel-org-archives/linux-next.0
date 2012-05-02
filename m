From: Ryan Mallon <rmallon@gmail.com>
Subject: Re: Request for inclusion of ep93xx tree in linux-next
Date: Wed, 02 May 2012 16:30:39 +1000
Message-ID: <4FA0D48F.2090800@gmail.com>
References: <4F9F16A9.9090108@gmail.com> <201205010836.28365.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:40163 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753560Ab2EBGaq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 May 2012 02:30:46 -0400
Received: by gghe5 with SMTP id e5so23033ggh.19
        for <linux-next@vger.kernel.org>; Tue, 01 May 2012 23:30:45 -0700 (PDT)
In-Reply-To: <201205010836.28365.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, arm@kernel.org, Mika Westerberg <mika.westerberg@iki.fi>, linux-next@vger.kernel.org, H Hartley Sweeten <hartleys@visionengravers.com>, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>

On 01/05/12 18:36, Arnd Bergmann wrote:

> On Monday 30 April 2012, Ryan Mallon wrote:
>> Hi Stephen,
>>
>> Can you please add the following branches:
>>
>>   ep93xx-cleanup
>>   ep93xx-fixes
>>
>> from the ep93xx git tree:
>>
>>   git://github.com/RyanMallon/linux-ep93xx.git
>>
>> To linux-next. Both branches are stable and based on v3.4-rc2. Testing
>> for the tree is covered by the arm ep93xx_defconfig.
>>
> 
> Hi Ryan,
> 
> just for your convenience, it helps if you have only one branch that
> you get included into linux-next and that combines various branches
> which you intend to send to arm-soc. That frees you from the need to
> notify Stephen every time you want to have another branch included.


Thanks for the tip. I leave the branches as is for the moment. If I end
up adding any additional branches to my tree, then I will look at
creating an ep93xx-for-next branch then. In this case, should the
for-next branch just be a regular merge of all the other branches I
have? How do I make it verifiable that everything from the other
branches has been being tested in the for-next branch?

Thanks,
~Ryan
