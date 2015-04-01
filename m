From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 01 Apr 2015 05:23:53 -0700
Message-ID: <551BE359.2050400@roeck-us.net>
References: <20150401000221.21961ecd@canb.auug.org.au> <20150331161640.GA16540@roeck-us.net> <20150331230749.GA6564@kroah.com> <551B5540.60606@roeck-us.net> <20150401080806.GY24899@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150401080806.GY24899@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On 04/01/2015 01:08 AM, Russell King - ARM Linux wrote:
> On Tue, Mar 31, 2015 at 07:17:36PM -0700, Guenter Roeck wrote:
>> On 03/31/2015 04:07 PM, Greg Kroah-Hartman wrote:
>>> You need 3.17 kernel headers to have memfd_create, not much the kdbus
>>> test code can do about that.  You might want to update the kernel
>>> headers for these build boxes.
>>>
>>
>> Seems there are brand-new requirements for kernel builds. The toolchain determines
>> the headers used, not the native kernel (which, FWIW, is 3.19). You might want
>> to document somewhere that "allmodconfig" and possibly "allyesconfig" now only
>> builds if the toolchain is based on 3.17+ kernel headers.
>>
>> I think I'll just drop those allmodconfig builds instead, or find a means to drop
>> the samples/kdbus builds. Sorry, my time is limited. Building toolchains costs a
>> lot of time, which I simply don't have. Keep in mind that I am doing all this on
>> my own spare time. You are putting a lot of burden on people doing test builds.
>
> You _can_ avoid it by seeding those configurations.  You place the
> options you want to force to a specific value in a file, and then
> do:
>
> make allmodconfig KCONFIG_ALLCONFIG=seed-config-file
>
> So, to turn off samples:
>
> CONFIG_SAMPLES=n
>
> in seed-config-file.  Hence, you can still do an allmodconfig build but
> without building the samples subdir.
>
I am doing it more complicated (so far), by using sed to manipulate the config file
after it was created, but that is better - I'll switch to that method.

Thanks!

Guenter
