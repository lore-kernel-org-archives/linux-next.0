From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 17 (mfd/tps65217.c)
Date: Tue, 21 Aug 2012 10:51:37 -0700
Message-ID: <5033CAA9.9000101@xenotime.net>
References: <20120717154153.b10774cb005add05e4c4e5f6@canb.auug.org.au> <5005DDA7.6050401@xenotime.net> <501C0A21.2010905@xenotime.net> <331ABD5ECB02734CA317220B2BBEABC13EA0B471@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy11-pub.bluehost.com ([173.254.64.10]:46180 "HELO
	oproxy11-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751497Ab2HURvm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Aug 2012 13:51:42 -0400
In-Reply-To: <331ABD5ECB02734CA317220B2BBEABC13EA0B471@DBDE01.ent.ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "AnilKumar, Chimata" <anilkumar@ti.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

On 08/05/2012 11:38 PM, AnilKumar, Chimata wrote:

> On Fri, Aug 03, 2012 at 22:58:01, Randy Dunlap wrote:
>> On 07/17/2012 02:48 PM, Randy Dunlap wrote:
>>
>>> On 07/16/2012 10:41 PM, Stephen Rothwell wrote:
>>>
>>>> Hi all,
>>>>
>>>> Changes since 20120716:
>>>>
>>>
>>>
>>> on i386:
>>>
>>> drivers/built-in.o: In function `tps65217_probe':
>>> tps65217.c:(.devinit.text+0x13e37): undefined reference to `of_regulator_match'
>>>
>>>
>>> Full randconfig file is attached.
>>> CONFIG_REGULATOR is not enabled.
>>>
>>
>>
>> This build error is still present in linux-next of 20120803.
>>
> 
> This will be fixed with this patch
> https://patchwork.kernel.org/patch/1220151/
> 
> Today, I will submit v2 for this


This build still fails in linux-next 20120821.

-- 
~Randy
