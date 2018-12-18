From: <Andrei.Stefanescu@microchip.com>
Subject: Re: linux-next: Tree for Dec 17 (regulator/mcp16502.c)
Date: Tue, 18 Dec 2018 09:28:28 +0000
Message-ID: <366d42a1-ce66-c2ec-3007-40c72bd41a93@microchip.com>
References: <20181217220914.29144a09@canb.auug.org.au>
 <c7bd09d3-3c04-327e-6c0b-89ee058cced8@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c7bd09d3-3c04-327e-6c0b-89ee058cced8@infradead.org>
Content-Language: en-US
Content-ID: <F7C901288C954F44984E5A5A20E9FFA5@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Randy,

Thank you for the email. The error should be fixed with this patch [1].

Best regards,
Andrei

[1] -=20
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-December/621292.=
html

On 17.12.2018 18:03, Randy Dunlap wrote:
> On 12/17/18 3:09 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20181214:
>>
> on i386:
> # CONFIG_SUSPEND is not set
> CONFIG_PM=3Dy
>
>    CC      drivers/regulator/mcp16502.o
> In file included from ../include/linux/device.h:23:0,
>                   from ../include/linux/gpio/driver.h:5,
>                   from ../include/asm-generic/gpio.h:13,
>                   from ../include/linux/gpio.h:62,
>                   from ../drivers/regulator/mcp16502.c:11:
> ../drivers/regulator/mcp16502.c:527:32: error: 'mcp16502_suspend_noirq' u=
ndeclared here (not in a function)
>    SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mcp16502_suspend_noirq,
>                                  ^
> ../include/linux/pm.h:342:19: note: in definition of macro 'SET_NOIRQ_SYS=
TEM_SLEEP_PM_OPS'
>    .suspend_noirq =3D suspend_fn, \
>                     ^
> ../drivers/regulator/mcp16502.c:528:10: error: 'mcp16502_resume_noirq' un=
declared here (not in a function)
>            mcp16502_resume_noirq)
>            ^
> ../include/linux/pm.h:343:18: note: in definition of macro 'SET_NOIRQ_SYS=
TEM_SLEEP_PM_OPS'
>    .resume_noirq =3D resume_fn, \
>                    ^
>
>
>
