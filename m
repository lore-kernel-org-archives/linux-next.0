From: Rob Lee <rob.lee@linaro.org>
Subject: Re: linux-next: manual merge of the cpuidle-cons tree with the
 arm-soc tree
Date: Fri, 9 Mar 2012 16:26:00 -0600
Message-ID: <CAMXH7KE5En7U-2zydT3MfJ7C7B164-zsQuBoHMUqzD-Kb_nh1w@mail.gmail.com>
References: <20120309183732.512d3676599da324f4747219@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120309183732.512d3676599da324f4747219@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Hello Stephen,

Yes, your resolution looks correct to me.

Thanks,
Rob Lee


On Fri, Mar 9, 2012 at 1:37 AM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Rob,
>
> Today's linux-next merge of the cpuidle-cons tree got a conflict in
> arch/arm/mach-at91/cpuidle.c between commit 00482a4078f4 ("ARM: at91:
> implement the standby function for pm/cpuidle") from the arm-soc tree=
 and
> commit 7a1f6e72dce1 ("ARM: at91: Consolidate time keeping and irq
> enable") from the cpuidle-cons tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessar=
y.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc arch/arm/mach-at91/cpuidle.c
> index 555d956,d40b3f3..0000000
> --- a/arch/arm/mach-at91/cpuidle.c
> +++ b/arch/arm/mach-at91/cpuidle.c
> @@@ -37,23 -33,15 +33,8 @@@ static int at91_enter_idle(struct cpuid
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct cpuidle_driver =
*drv,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index=
)
> =A0{
> - =A0 =A0 =A0 struct timeval before, after;
> - =A0 =A0 =A0 int idle_time;
> -
> - =A0 =A0 =A0 local_irq_disable();
> - =A0 =A0 =A0 do_gettimeofday(&before);
> - =A0 =A0 =A0 if (index =3D=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Wait for interrupt state */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_do_idle();
> - =A0 =A0 =A0 else if (index =3D=3D 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 at91_standby();
> =A0- =A0 =A0 =A0u32 saved_lpr;
> =A0-
> =A0- =A0 =A0 =A0__asm__("b 1f; .align 5; 1:\n"
> =A0- =A0 =A0 =A0" =A0 =A0 =A0 mcr p15, 0, r0, c7, c10, 4"); =A0 /* dr=
ain write buffer */
> =A0-
> =A0- =A0 =A0 =A0saved_lpr =3D sdram_selfrefresh_enable();
> =A0- =A0 =A0 =A0cpu_do_idle();
> =A0- =A0 =A0 =A0sdram_selfrefresh_disable(saved_lpr);
> ++ =A0 =A0 =A0at91_standby();
>
> - =A0 =A0 =A0 do_gettimeofday(&after);
> - =A0 =A0 =A0 local_irq_enable();
> - =A0 =A0 =A0 idle_time =3D (after.tv_sec - before.tv_sec) * USEC_PER=
_SEC +
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (after.tv_usec - before=
=2Etv_usec);
> -
> - =A0 =A0 =A0 dev->last_residency =3D idle_time;
> =A0 =A0 =A0 =A0return index;
> =A0}
>
