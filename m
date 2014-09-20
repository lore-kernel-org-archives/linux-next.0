From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Sep 19
Date: Fri, 19 Sep 2014 19:40:45 -0700
Message-ID: <541CE92D.70301@roeck-us.net>
References: <541CC721.2010207@roeck-us.net>	<541CD3C3.3010905@infradead.org>	<525DB349B3FB5444AE057A887CB2A8D88EF892@nice.asicdesigners.com> <20140919.220856.2166907140359359148.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59519 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758216AbaITCkz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Sep 2014 22:40:55 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1XVAbX-003Wfy-Bz
	for linux-next@vger.kernel.org; Sat, 20 Sep 2014 02:40:55 +0000
In-Reply-To: <20140919.220856.2166907140359359148.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, anish@chelsio.com
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, JBottomley@parallels.com, mchan@broadcom.com

On 09/19/2014 07:08 PM, David Miller wrote:
> From: Anish Bhatt <anish@chelsio.com>
> Date: Sat, 20 Sep 2014 01:43:05 +0000
>
>> Original config causing issues can be seen here :
>> https://lkml.org/lkml/2014/9/9/500
>>
>> As CNIC depends on IPV6, CNIC can be only compiled as a module when IPV6 is
>> compiled as a module. This was the patch I originally commited. Previous
>> behaviour was to disable all ipv6 code in such a case. However, having bnx2fc/i
>>   as built-in overrides CNIC's tristate from m to built-in (as they select CNIC),
>>   causing build issues. As far as I know, there is no way to control the state
>> that select sets.
>
> Really, nothing that has dependencies should be "select"'d, ever.
>
> What people hack up is that they try to do this, and "make it work"
> by "select"'ing all of the selected object's dependencies.  And
> then you have to do this recursively for dependencies which have
> dependencies.
>
> This is really incredibly stupid.
>
> And once something in that chain gains a new dependency, all of
> these "select" instances break.
>
> I really want all of these netlink users to "depend" on "NET"
> rather than "select" it, and so on and so forth down to the
> users of these netlink using subsystems.
>

Sure, that makes sense on some level, but you would have to make sure
that any changes made are clean and don't break existing configurations,
and/or you would have to make sure that all affected configurations are
updated as needed. A single-line change in a configuration file, to hell
with the consequences, just doesn't cut it.

We already know that 11 out of 55 mips configurations are broken in
linux-next. I don't even want to know what else is broken. That is
a pretty high price to pay to achieve purity.

Guenter
