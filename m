From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: New build failures in Sep 25 tree
Date: Fri, 26 Sep 2014 06:32:33 -0700
Message-ID: <54256AF1.6030800@roeck-us.net>
References: <20140925202559.GA1750@roeck-us.net> <CAMuHMdXE4aU1qZ9iGBT48QfMv5v7gsBZSjL_1_D8p=JBJfeN6A@mail.gmail.com> <20140926075859.GA21697@chokladfabriken.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42674 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755052AbaIZNcv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Sep 2014 09:32:51 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1XXVdi-0018Ms-7o
	for linux-next@vger.kernel.org; Fri, 26 Sep 2014 13:32:50 +0000
In-Reply-To: <20140926075859.GA21697@chokladfabriken.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ulf Hansson <ulf.hansson@linaro.org>, Vineet Gupta <vgupta@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, linux <linux@lists.openrisc.net>, Eric Paris <eparis@redhat.com>

On 09/26/2014 12:59 AM, Stefan Kristiansson wrote:
> On Fri, Sep 26, 2014 at 08:30:57AM +0200, Geert Uytterhoeven wrote:
>> Hi G=FCnther,
>>
>> [cc openrisc]
>>
>> On Thu, Sep 25, 2014 at 10:25 PM, Guenter Roeck <linux@roeck-us.net>=
 wrote:
>>> New build failures:
>>
>>> openrisc-defconfig
>>>
>>> In file included from arch/openrisc/kernel/signal.c:31:0:
>>> ./arch/openrisc/include/asm/syscall.h: In function 'syscall_get_arc=
h':
>>> ./arch/openrisc/include/asm/syscall.h:77:9: error: 'EM_OPENRISC' un=
declared
>>
>> That's not a new one. It's been failing for half or year or so.
>>
>> If you only see it now, that means something else got fixed ;-)
>>
>
>>From what I can see, it's caused by
> ce5d112827e5 ("ARCH: AUDIT: implement syscall_get_arch for all arches=
")
> that got (re?)introduced two days ago.
>
> To me it seems that the problem is that EM_OPENRISC is
> missing in include/uapi/linux/elf-em.h, but if that's the case,
> I think microblaze have the same problem with that patch applied.
>

Microblaze builds for some reason. But, yes, that commit is from March.
Maybe that is where I remember it from.

You are right, it builds if I add the define. I'll submit a patch to fi=
x
the problem if the resulting image builds.

Guenter
