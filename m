From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 18 (__modver_version_show)
Date: Wed, 19 Jan 2011 08:12:19 -0800
Message-ID: <4D370D63.5070503@oracle.com>
References: <20110118122139.6c2a6f2f.sfr@canb.auug.org.au>	<20110118091749.ac5823df.randy.dunlap@oracle.com> <20110119160951.2a14d0a0.sfr@canb.auug.org.au> <4D370CE6.3000505@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:27000 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753988Ab1ASQOJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Jan 2011 11:14:09 -0500
In-Reply-To: <4D370CE6.3000505@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 01/19/11 08:10, Randy Dunlap wrote:
> On 01/18/11 21:09, Stephen Rothwell wrote:
>> Hi Randy,
>>
>> On Tue, 18 Jan 2011 09:17:49 -0800 Randy Dunlap <randy.dunlap@oracle.com> wrote:
>>>
>>> I'm seeing this on several builds (i386 and x86_64):
>>>
>>> lib/built-in.o:(__modver+0x8): undefined reference to `__modver_version_show'
>>> lib/built-in.o:(__modver+0x2c): undefined reference to `__modver_version_show'
>>>
>>> It looks like the compiler or linker is dropping that function from the
>>> build since it cannot see any references to it...
>>> At least __modver_version_show is not in the kernel/params.o file.
>>
>> Do these builds have CONFIG_SYSFS set?
>>
> 
> Yes, they all do (50 random builds have CONFIG_SYSFS=y).

Gawd, what bad grepping this morning.

You hit the nail.  They do not have SYSFS enabled.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
