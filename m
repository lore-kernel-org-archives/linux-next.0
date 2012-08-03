From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 17 (mfd/tps65217.c)
Date: Fri, 03 Aug 2012 10:28:01 -0700
Message-ID: <501C0A21.2010905@xenotime.net>
References: <20120717154153.b10774cb005add05e4c4e5f6@canb.auug.org.au> <5005DDA7.6050401@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:32835 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752557Ab2HCR3Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Aug 2012 13:29:16 -0400
In-Reply-To: <5005DDA7.6050401@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, AnilKumar Ch <anilkumar@ti.com>

On 07/17/2012 02:48 PM, Randy Dunlap wrote:

> On 07/16/2012 10:41 PM, Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> Changes since 20120716:
>>
> 
> 
> on i386:
> 
> drivers/built-in.o: In function `tps65217_probe':
> tps65217.c:(.devinit.text+0x13e37): undefined reference to `of_regulator_match'
> 
> 
> Full randconfig file is attached.
> CONFIG_REGULATOR is not enabled.
> 


This build error is still present in linux-next of 20120803.


-- 
~Randy
