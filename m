From: =?UTF-8?B?VMO2csO2ayBFZHdpbg==?= <edwintorok@gmail.com>
Subject: Re: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 18:27:15 +0300
Message-ID: <48777BD3.4010204@gmail.com>
References: <4877400B.1000400@gmail.com> <s5hy747rvpr.wl%tiwai@suse.de>	 <48775C69.6050107@gmail.com> <20080711135937.GA25004@elte.hu>	 <487772B6.4090100@gmail.com>	 <19f34abd0807110754n1a095671ua9132471b6a81540@mail.gmail.com> <19f34abd0807110800o5b283f00n4be7449ed3b06e5a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:62943 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758604AbYGKP1Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 11:27:25 -0400
Received: by yw-out-2324.google.com with SMTP id 9so1925647ywe.1
        for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 08:27:19 -0700 (PDT)
In-Reply-To: <19f34abd0807110800o5b283f00n4be7449ed3b06e5a@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

On 2008-07-11 18:00, Vegard Nossum wrote:
>> On Fri, Jul 11, 2008 at 4:48 PM, T=C3=B6r=C3=B6k Edwin <edwintorok@g=
mail.com> wrote:
>>    =20
>>>> One really simple way of getting some more info out of this is to =
take
>>>> the EIP value (here c0181ca0) and run it through addr2line:
>>>>
>>>>     $ addr2line -e vmlinux -i c0181ca0
>>>>        =20
>>> Thanks for the hint, I rebuilt a failing kernel, and this is what
>>> addr2line says:
>>>
>>> $ addr2line -e vmlinux -i c0181ca0
>>>
>>> ??:0
>>> $ addr2line -e vmlinux -f c0181ca0
>>> kmem_cache_alloc
>>> ??:0
>>>      =20
>
> BTW, did the new kernel fail in exactly the same place?=20

Yep, I am using ccache, same sources -> same binary.

addr2line -i now says:
/var/local/src/linux-2.6.git/linux-2.6/mm/slub.c:1648
/var/local/src/linux-2.6.git/linux-2.6/mm/slub.c:1662

Strangely the EIP is the same even after rebuilding with debug info.

Since tip/master supports the latency tracing features, I won't dig
further into the linux-next problem now
(we'll know tomorrow if the commits in tip solve the boot problem).

Best regards,
--Edwin
