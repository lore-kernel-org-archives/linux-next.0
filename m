From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Tue, 31 Mar 2015 19:45:48 -0700
Message-ID: <551B5BDC.5060706@roeck-us.net>
References: <20150401000221.21961ecd@canb.auug.org.au>	<20150331161640.GA16540@roeck-us.net>	<20150331230749.GA6564@kroah.com> <20150401104233.563d0022@canb.auug.org.au> <551B56E0.7090209@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <551B56E0.7090209@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On 03/31/2015 07:24 PM, Guenter Roeck wrote:
> On 03/31/2015 04:42 PM, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> On Wed, 1 Apr 2015 01:07:49 +0200 Greg Kroah-Hartman <gregkh@linuxfo=
undation.org> wrote:
>>>
>>> On Tue, Mar 31, 2015 at 09:16:40AM -0700, Guenter Roeck wrote:
>>>>
>>>> alpha:allmodconfig
>>>> mips:allmodconfig
>>>>
>>>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=
=99:
>>>> samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_c=
reate=E2=80=99 undeclared
>>>> (first use in this function)
>>>>    p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC)=
;
>>>>
>>>> Looks like the kdbus example never worked for the affected archite=
ctures.
>>>> I don't build allmodconfig for all architectures, so other archite=
ctures
>>>> may be affected as well.
>>>
>>> You need 3.17 kernel headers to have memfd_create, not much the kdb=
us
>>> test code can do about that.  You might want to update the kernel
>>> headers for these build boxes.
>>>
>>> Or have we not hooked up memfd for alpha and mips?
>>
>> alpha has no definition for __NR_memfd_create and doesn't use
>> asm-generic/unistd.h.
>>
>> mips has a definition for __NR_memfd_create if _MIPS_SIM =3D=3D
>> _MIPS_SIM_ABI32, _MIPS_SIM_ABI64 or _MIPS_SIM_NABI32 (is there any
>> other alternative?).
>>
>
> Guess you are saying that those examples won't build even with a
> newer toolchain. Good that I already decided not to re-build my
> toolchains ;-).
>
> Now I am left with the question if the samples build should be
> masked for alpha and mips, or if I should drop building samples
> from my 'allmodconfig' builds. I think I'll do the latter;
> there seems to be an expectation that samples are built with
> a recent toolchain, and I can not keep rebuilding toolchains for
> the rest of my life.
>

Weird - the kdbus sample doesn't have its own configuration option,
unlike other samples. So it's all or nothing for alpha and mips.

Guenter
