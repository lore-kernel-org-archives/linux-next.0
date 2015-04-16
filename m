From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on score/paris/..
Date: Wed, 15 Apr 2015 18:43:11 -0700
Message-ID: <552F13AF.5030606@roeck-us.net>
References: <20150414165000.GA19434@roeck-us.net> <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com> <552E6722.1080507@roeck-us.net> <20150415211956.GA6703@chrystal.uk.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54000 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416AbbDPBnQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2015 21:43:16 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YiYpn-004KA4-6j
	for linux-next@vger.kernel.org; Thu, 16 Apr 2015 01:43:15 +0000
In-Reply-To: <20150415211956.GA6703@chrystal.uk.oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On 04/15/2015 02:19 PM, Quentin Casasnovas wrote:
> On Wed, Apr 15, 2015 at 06:26:58AM -0700, Guenter Roeck wrote:
>> On 04/15/2015 01:54 AM, Quentin Casasnovas wrote:
>>> The following two patches might (hopefully) fix the build breakage on score
>>> and some other architectures.  I've checked the new __ex_table checker
>>> still works on x86-64 with them (it still detects an entry pointing to
>>> .altinstr_rplacement) and they should apply cleanly on top of Rusty's
>>> module-next branch.
>>>
>>> Thanks to Guenter for the bug analysis and sorry again for the breakage.
>>>
>>> Let me know if this makes things better..
>>>
>>
>> the crash is fixed, but now I get
>>
>> FATAL: The relocation at __ex_table+0x4 references
>> section "" which is not executable, IOW
>> the kernel will fault if it ever tries to
>> jump to it.  Something is seriously wrong
>> and should be fixed.
>>
>> for parisc:defconfig,
>>
>> FATAL: The relocation at __ex_table+0x634 references
>> section "__ex_table" which is not executable, IOW
>> the kernel will fault if it ever tries to
>> jump to it.  Something is seriously wrong
>> and should be fixed.
>>
>> for score:allnoconfig, and
>>
>> FATAL: The relocation at __ex_table+0x8 references
>> section "" which is not executable, IOW
>> it is not possible for the kernel to fault
>> at that address.  Something is seriously wrong
>> and should be fixed.
>>
>> for mn10300:defconfig.
>>
>> While I agree that those should get fixed (if they are real problems,
>> especially the ones for parisc and mn10300), I don't think it is
>> a good idea to fail the build because of it.
>>
>> Note that I did find the problem in the score build; that was a real bug.
>> I don't know what may be wrong with the others.
>>
>
> The attached patch fixes the build failures on parisc and mn10300 on my
> defconfig build and should apply cleanly on top of the previous two.
>
> I'm not able to download the score cross toolchain for the moment but will
> do tomorrow. Guenter, may I ask if there were any other problems than the
> one you fixed in string.S there?
>

For

 >From 2e9abac9cbde18af48951c54d52c9c515f9883a7 Mon Sep 17 00:00:00 2001
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Date: Wed, 15 Apr 2015 22:39:50 +0200
Subject: [PATCH] modpost: do not try to match the SHT_NUL section.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
