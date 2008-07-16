From: =?UTF-8?B?RnLDqWTDqXJpYyBXZWlzYmVja2Vy?= <fweisbec@gmail.com>
Subject: Re: today's linux-next fails to boot
Date: Wed, 16 Jul 2008 23:57:51 +0200
Message-ID: <487E6EDF.7050905@gmail.com>
References: <4877400B.1000400@gmail.com>  <s5hy747rvpr.wl%tiwai@suse.de> <1216242664.3218.14.camel@dhcppc2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.187]:59257 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754961AbYGPV5z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Jul 2008 17:57:55 -0400
Received: by fk-out-0910.google.com with SMTP id 18so3609413fkq.5
        for <linux-next@vger.kernel.org>; Wed, 16 Jul 2008 14:57:53 -0700 (PDT)
In-Reply-To: <1216242664.3218.14.camel@dhcppc2>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Takashi Iwai <tiwai@suse.de>, =?UTF-8?B?VMO2csO2ayBFZHdpbg==?= <edwintorok@gmail.com>, Ingo Molnar <mingo@elte.hu>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Thomas Meyer a =C3=A9crit :
> Am Samstag, den 12.07.2008, 17:03 +0200 schrieb Takashi Iwai:
>  =20
>> At Fri, 11 Jul 2008 14:12:11 +0300,
>> T=C3=B6r=C3=B6k Edwin wrote:
>>    =20
>>> Today's linux-next tree (commit
>>> 93847083e4791567931bd17c039cc35881cdad29) fails to boot:
>>> [built with gcc-4.2.4-3]
>>>
>>> BUG: Int 14: CR2 b0049dea
>>>      EDI 00000082 ESI 00000000 EBP c059be88 ESP c059be5c
>>>      EBX f000ec62 EDX 0000000e ECX c0595480 EAX f000ec62
>>>      err 00000000 EIP c0181ca0  CS 00000060 flg 00010082
>>> Stack:   00000040 c06a2ba0 000080d0 c0595480 c0000f19c c000f180 c05=
81120
>>> c059bea8
>>>          c02bf19b 00000000 00000080 c059beb8 c0000f194 c000f180 000=
0000a
>>> c059beb8
>>>          c03a1059 00000000 00000000 c059bed8 c05c4c7c  0009efff 000=
00000
>>> c04f4df4
>>>
>>> I get this as soon as I boot from grub2, strangely the error messag=
e is
>>> at the bottom of the screen, and I can't see the full message (scro=
lling
>>> won't work).
>>>
>>> The last kernel I built & booted was 2.6.26-rc8 from Linus's tree. =
I
>>> will try to built&boot 2.6.26-rc9, and then bisect.
>>>
>>> This happens on 32-bit Dell Inspiron 6400 (Intel Core Duo T2300 @1.=
66
>>> Ghz CPU),  Intel ICH-7 chipset, and a seagate SATA drive.=20
>>> I will provide  full hardware details once I bisected the problem.
>>>
>>> Meanwhile, if somebody has an idea as to what is wrong?
>>>      =20
>> [Added Ingo to Cc]
>>
>> I get the boot problem on i386 with 2008-07-11 linux-next tree, too.
>> In my case, no error appears on the screen, just staying blank and
>> dead.  It seems stopping at the very beginning, soon after GRUB, so
>> could be the same reason.
>>
>> The same config worked fine with yesterday's tree (2008-07-10) on th=
e
>> same machine.=20
>> Also, today's tree works on x86-64 (but on another machine).
>>
>>    =20
>
> I have got the same problem as Edwin T=C3=96R=C3=96K: From next-20080=
710 to next-20080711 the kernel fails to boot.
> EIP seems to be in function kmem_cache_alloc.
>
> This is also true for next-20080716.
> I didn't try the kernels > next-20080711 and < next-20080716.
>
> Any news on this bug?
>  =20
Yes a fix has been released:
http://article.gmane.org/gmane.linux.kernel.kexec/1882

But I don't know when it will be applied....
