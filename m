From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Build issue with linux next. duplicate member _count in mm_types.h
Date: Thu, 07 Jul 2011 15:05:32 +0200
Message-ID: <4E15AF1C.7080103@example.com>
References: <4E143120.2020501@cam.ac.uk> <alpine.DEB.2.00.1107060933460.17202@router.home>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1107060933460.17202@router.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Lameter <cl@linux.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On 06.07.2011 16:46, Christoph Lameter wrote:
> On Wed, 6 Jul 2011, Jonathan Cameron wrote:
>
>> Getting:
>>
>>    CHK     include/linux/version.h
>>    CHK     include/generated/utsrelease.h
>> make[1]: `include/generated/mach-types.h' is up to date.
>>    CC      arch/arm/kernel/asm-offsets.s
>> In file included from include/linux/sched.h:64:0,
>>                   from arch/arm/kernel/asm-offsets.c:13:
>> include/linux/mm_types.h:74:15: error: duplicate member '_count'
>> make[1]: *** [arch/arm/kernel/asm-offsets.s] Error 1
>> make: *** [prepare0] Error 2

I have the same error on x86_64. I'll try again withj your patch.

Regards,

Piotr Hosowicz

--=20
Zatrzymuje si=EA samoch=F3d na sejmowym parkingu. Podchodzi do niego=20
ochroniarz i m=F3wi:
- Pan tu parkuje?! Tu Sejm ... Ministrowie, politycy, pos=B3owiei ...
- Dzi=EAki, w=B3=B1cz=EA alarm.
NP: Nemo -
NB: 3.0.0-rc6
