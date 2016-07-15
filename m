From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: manual merge of the clockevents tree with the arm-soc
 tree
Date: Fri, 15 Jul 2016 19:06:57 +0200
Message-ID: <57891831.2080806@linaro.org>
References: <20160707141226.2b9c1e15@canb.auug.org.au>
 <20160711152812.3efd7047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160711152812.3efd7047@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: linux-next.vger.kernel.org

On 07/11/2016 07:28 AM, Stephen Rothwell wrote:
> Hi all,
>=20
> On Thu, 7 Jul 2016 14:12:26 +1000 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>
>> Today's linux-next merge of the clockevents tree got a conflict in:
>>
>>   arch/arm/Kconfig
>>
>> between commit:
>>
>>   c86f51737f8d ("ARM: clps711x: Switch to MULTIPLATFORM")
>>
>> from the arm-soc tree and commit:
>>
>>   250e46aa3bb3 ("clocksource/drivers/clps_711x: Add the COMPILE_TEST=
 option")
>>
>> from the clockevents tree.
>>
>> I fixed it up (I used the arm-soc version of this file and then adde=
d
>> the following merge fix patch) and can carry the fix as necessary. T=
his
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your =
tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particul=
arly
>> complex conflicts.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 7 Jul 2016 13:59:06 +1000
>> Subject: [PATCH] clocksource/drivers/clps_711x: fixup for "ARM: clps=
711x: Switch to MULTIPLATFORM"
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  arch/arm/mach-clps711x/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-clps711x/Kconfig b/arch/arm/mach-clps711x=
/Kconfig
>> index 3b56197ccfd0..dc7c6edeab39 100644
>> --- a/arch/arm/mach-clps711x/Kconfig
>> +++ b/arch/arm/mach-clps711x/Kconfig
>> @@ -3,8 +3,8 @@ menuconfig ARCH_CLPS711X
>>  	depends on ARCH_MULTI_V4T
>>  	select ARCH_REQUIRE_GPIOLIB
>>  	select AUTO_ZRELADDR
>> -	select CLKSRC_MMIO
>>  	select CLKSRC_OF
>> +	select CLPS711X_TIMER
>>  	select COMMON_CLK
>>  	select CPU_ARM720T
>>  	select GENERIC_CLOCKEVENTS
>> --=20
>> 2.8.1
>=20
> This merge fix is now applicable to the merge between the arm-soc tre=
e
> and the tip tree.
>=20
> Also, the clockevents tree needs to be cleaned up as all its commits
> have been added to the tip tree as different commits (but the s
> patches) :-(

I synced the branch with tip/timers/core, no more conflict should happe=
n.

Thanks.

  -- Daniel


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
