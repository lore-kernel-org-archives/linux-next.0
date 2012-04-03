From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Apr 2 (uml)
Date: Tue, 03 Apr 2012 08:28:13 -0700
Message-ID: <4F7B170D.7070800@xenotime.net>
References: <20120402135538.502e6c73f0cb3e6ae0b3436f@canb.auug.org.au> <4F79C68C.1070100@xenotime.net> <4F79CCE1.4040709@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:44387 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753031Ab2DCP2U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Apr 2012 11:28:20 -0400
In-Reply-To: <4F79CCE1.4040709@nod.at>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 04/02/2012 08:59 AM, Richard Weinberger wrote:

> On 02.04.2012 17:32, Randy Dunlap wrote:
>> On 04/01/2012 08:55 PM, Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> The merge window has closed, so -next is open for busniess.
>>>
>>> Changes since 20120330:
>>
>>
>>
>> uml defconfig on x86_64:
>>
>>    CC      arch/um/drivers/mconsole_kern.o
>> arch/um/drivers/mconsole_kern.c: In function 'stack_proc':
>> arch/um/drivers/mconsole_kern.c:707:2: error: implicit declaration of function 'switch_to'
>> make[2]: *** [arch/um/drivers/mconsole_kern.o] Error 1
>>
>>
> 
> Already fixed:
> http://comments.gmane.org/gmane.linux.kernel/1274493


and linux-next still has this build error.

Can that patch show up in linux-next, please?

-- 
~Randy
