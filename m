From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on score/paris/..
Date: Thu, 16 Apr 2015 05:47:08 -0700
Message-ID: <552FAF4C.2050202@roeck-us.net>
References: <20150414165000.GA19434@roeck-us.net> <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com> <552E6722.1080507@roeck-us.net> <20150415211956.GA6703@chrystal.uk.oracle.com> <552F13AF.5030606@roeck-us.net> <20150416082116.GB6703@chrystal.uk.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41551 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754620AbbDPMrM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2015 08:47:12 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YijCJ-003BgO-55
	for linux-next@vger.kernel.org; Thu, 16 Apr 2015 12:47:11 +0000
In-Reply-To: <20150416082116.GB6703@chrystal.uk.oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On 04/16/2015 01:21 AM, Quentin Casasnovas wrote:
> On Wed, Apr 15, 2015 at 06:43:11PM -0700, Guenter Roeck wrote:
>>
>> For
>>
>>   >From 2e9abac9cbde18af48951c54d52c9c515f9883a7 Mon Sep 17 00:00:00 2001
>> From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
>> Date: Wed, 15 Apr 2015 22:39:50 +0200
>> Subject: [PATCH] modpost: do not try to match the SHT_NUL section.
>>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>>
>
> Thanks a lot Guenter!
>
>> Let me know if you can find a score toolchain - otherwise I'll make a copy
>> of mine available.
>
> I could not find one, if it's not too much trouble for you to make yours
> available that'd be great.
>

Hi Quentin,

Try http://server.roeck-us.net/qemu/score.tgz. I have it installed in /opt/kernel,
and build the kernel with

PATH=/opt/kernel/score/bin:${PATH}
make ARCH=score CROSS_COMPILE=score-elf-

I don't recall if I built it position independent or not; you'll see.

Hope this helps,
Guenter
