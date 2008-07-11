From: =?ISO-8859-1?Q?T=F6r=F6k_Edwin?= <edwintorok@gmail.com>
Subject: Re: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 17:48:22 +0300
Message-ID: <487772B6.4090100@gmail.com>
References: <4877400B.1000400@gmail.com> <s5hy747rvpr.wl%tiwai@suse.de> <48775C69.6050107@gmail.com> <20080711135937.GA25004@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.189]:43134 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753856AbYGKOs0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 10:48:26 -0400
Received: by mu-out-0910.google.com with SMTP id w8so1246265mue.1
        for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 07:48:25 -0700 (PDT)
In-Reply-To: <20080711135937.GA25004@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@gmail.com>

On 2008-07-11 16:59, Ingo Molnar wrote:
> * T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:
>
>  =20
>>> [Added Ingo to Cc]
>>>
>>> I get the boot problem on i386 with 2008-07-11 linux-next tree, too=
=2E
>>> In my case, no error appears on the screen, just staying blank and
>>> dead.  It seems stopping at the very beginning, soon after GRUB, so
>>> could be the same reason.
>>>  =20
>>>      =20
>> I don't see any boot messages on the screen, I get that BUG message =
as
>> soon as grub's menu dissapears.
>> I have bisected it to this range so far:
>> git-bisect good aa03060a78c1aec53075a0c8ca7be19cedfbea8f
>> git-bisect bad b1611c0058bc6635e7257e755c3f194933a7a6df
>>
>> Should I continue to bisect?
>>    =20
>
> could you check latest tip/master, does it boot fine with the same=20
> config?
>  =20

tip/master boots fine.

On 2008-07-11 16:36, Vegard Nossum wrote:
> One really simple way of getting some more info out of this is to tak=
e
> the EIP value (here c0181ca0) and run it through addr2line:
>
>     $ addr2line -e vmlinux -i c0181ca0

Thanks for the hint, I rebuilt a failing kernel, and this is what
addr2line says:

$ addr2line -e vmlinux -i c0181ca0

??:0
$ addr2line -e vmlinux -f c0181ca0
kmem_cache_alloc
??:0

Best regards,
--Edwin
