From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Tue, 31 Mar 2015 20:13:19 -0700
Message-ID: <551B624F.9030808@roeck-us.net>
References: <20150401000221.21961ecd@canb.auug.org.au>		 <20150331161640.GA16540@roeck-us.net> <20150331230749.GA6564@kroah.com>	 <1427844281.4256.3.camel@ellerman.id.au> <551B557A.40805@roeck-us.net> <1427857291.4256.8.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427857291.4256.8.camel@ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On 03/31/2015 08:01 PM, Michael Ellerman wrote:
> On Tue, 2015-03-31 at 19:18 -0700, Guenter Roeck wrote:
>> On 03/31/2015 04:24 PM, Michael Ellerman wrote:
>>> On Wed, 2015-04-01 at 01:07 +0200, Greg Kroah-Hartman wrote:
>>>> On Tue, Mar 31, 2015 at 09:16:40AM -0700, Guenter Roeck wrote:
>>>>> alpha:allmodconfig
>>>>> mips:allmodconfig
>>>>>
>>>>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=
=99:
>>>>> samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_=
create=E2=80=99 undeclared
>>>>> (first use in this function)
>>>>>     p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXE=
C);
>>>>>
>>>>> Looks like the kdbus example never worked for the affected archit=
ectures.
>>>>> I don't build allmodconfig for all architectures, so other archit=
ectures
>>>>> may be affected as well.
>>>>
>>>> You need 3.17 kernel headers to have memfd_create, not much the kd=
bus
>>>> test code can do about that.  You might want to update the kernel
>>>> headers for these build boxes.
>>>
>>> Or just 'make headers_install' before building the samples should d=
o it.
>>>
>>
>> Sure, that works so well in a cross build environment.
>
> Well yeah it does, I do it all the time.
>
> But what you mean is that the samples are built with HOSTCC, so havin=
g the
> cross headers doesn't help.
>
> The real problem here is samples, they shouldn't be built with the ke=
rnel, they
> should be a separate thing, like the selftests.
>

I "solved" the problem by disabling CONFIG_SAMPLES in my alpha and mips
builds.

=46WIW, I think (suspect) that the samples builder does the equivalent
of "make headers_install" as part of the build process, but I don't
have time to track it down.

Guenter
