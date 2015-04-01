From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Tue, 31 Mar 2015 19:17:36 -0700
Message-ID: <551B5540.60606@roeck-us.net>
References: <20150401000221.21961ecd@canb.auug.org.au> <20150331161640.GA16540@roeck-us.net> <20150331230749.GA6564@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150331230749.GA6564@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On 03/31/2015 04:07 PM, Greg Kroah-Hartman wrote:
> On Tue, Mar 31, 2015 at 09:16:40AM -0700, Guenter Roeck wrote:
>> On Wed, Apr 01, 2015 at 12:02:21AM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20150330:
>>>
>>> The arm64 tree gained a conflict against the arm-soc tree.
>>>
>>> The idle tree gained a build failure so I used the version from
>>> next-20150327.
>>>
>>> The tip tree gained conflicts against the pm tree.
>>>
>>> The akpm tree gained a conflict against the mips tree.
>>>
>>> Non-merge commits (relative to Linus' tree): 7277
>>>   6623 files changed, 304342 insertions(+), 138111 deletions(-)
>>>
>>> -------------------------------------------------------------------=
---------
>>>
>>
>> Build results:
>> 	total: 121 pass: 94 fail: 27
>> Failed builds:
>> 	alpha:allmodconfig
>> 	arm:rpc_defconfig
>> 	arm64:defconfig
>> 	cris:defconfig
>> 	cris:etrax-100lx_defconfig
>> 	cris:allnoconfig
>> 	frv:defconfig
>> 	i386:allyesconfig
>> 	i386:allmodconfig
>> 	ia64:defconfig
>> 	m32r:defconfig
>> 	m68k:defconfig
>> 	m68k:allmodconfig
>> 	m68k:sun3_defconfig
>> 	m68k:m5272c3_defconfig
>> 	m68k:m5307c3_defconfig
>> 	m68k:m5249evb_defconfig
>> 	m68k:m5407c3_defconfig
>> 	m68k:m5475evb_defconfig
>> 	mips:allmodconfig
>> 	parisc:defconfig
>> 	parisc:generic-32bit_defconfig
>> 	parisc:a500_defconfig
>> 	parisc:generic-64bit_defconfig
>> 	x86_64:allyesconfig
>> 	xtensa:defconfig
>> 	xtensa:allmodconfig
>>
>> ---
>> alpha:allmodconfig
>> mips:allmodconfig
>>
>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99=
:
>> samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_cre=
ate=E2=80=99 undeclared
>> (first use in this function)
>>    p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>>
>> Looks like the kdbus example never worked for the affected architect=
ures.
>> I don't build allmodconfig for all architectures, so other architect=
ures
>> may be affected as well.
>
> You need 3.17 kernel headers to have memfd_create, not much the kdbus
> test code can do about that.  You might want to update the kernel
> headers for these build boxes.
>

Seems there are brand-new requirements for kernel builds. The toolchain=
 determines
the headers used, not the native kernel (which, FWIW, is 3.19). You mig=
ht want
to document somewhere that "allmodconfig" and possibly "allyesconfig" n=
ow only
builds if the toolchain is based on 3.17+ kernel headers.

I think I'll just drop those allmodconfig builds instead, or find a mea=
ns to drop
the samples/kdbus builds. Sorry, my time is limited. Building toolchain=
s costs a
lot of time, which I simply don't have. Keep in mind that I am doing al=
l this on
my own spare time. You are putting a lot of burden on people doing test=
 builds.

Guenter
