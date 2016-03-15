From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 14
Date: Mon, 14 Mar 2016 19:31:53 -0700
Message-ID: <56E77419.1010302@roeck-us.net>
References: <20160314174037.0097df55@canb.auug.org.au>
 <20160314143729.GA31845@roeck-us.net>
 <1457999708.8059.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457999708.8059.1.camel@ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Scott Wood <oss@buserror.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 03/14/2016 04:55 PM, Michael Ellerman wrote:
> On Mon, 2016-03-14 at 07:37 -0700, Guenter Roeck wrote:
>> On Mon, Mar 14, 2016 at 05:40:37PM +1100, Stephen Rothwell wrote:
>>
>> To give people an idea what to expect in the merge window, here are my current
>> build and runtime test results. Some of the runtime failures are due to the
>> newly introduced i2c bug, but many (including the arm64 boot failures) have
>> been around for a while.
>>
>> Qemu test results:
>> 	total: 96 pass: 69 fail: 27
>> Failed tests:
> ...
>> 	powerpc:mpc8544ds:mpc85xx_smp_defconfig
>> 	powerpc:mpc8544ds:mpc85xx_defconfig
>> 	powerpc:smp:ppc64_e5500_defconfig
>
> These are all an i2c crash, which I assume is the one you mention above.
>
>> 	powerpc:nosmp:ppc64_e5500_defconfig
>
> This seems to be caused by:
>
>    arch/powerpc/sysdev/fsl_rcpm.c:32:2: error: implicit declaration of function 'get_hard_smp_processor_id' [-Werror=implicit-function-declaration]
>
> ie. that driver doesn't build for SMP=n.
>

Maybe it should include <asm/smp.h> to get the UP definition.

Guenter
