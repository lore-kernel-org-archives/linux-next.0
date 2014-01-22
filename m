From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: randconfig build error with next-20140122, in
 arch/x86/platform/intel-mid/intel-mid.c
Date: Wed, 22 Jan 2014 13:38:40 -0800
Message-ID: <20140122213839.GA26480@psi-dev26.jf.intel.com>
References: <CA+r1ZhgAbZH19kbVfKgeVJ0tPqGpJ86b10GAYaGVgDn2Q58Dyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+r1ZhgAbZH19kbVfKgeVJ0tPqGpJ86b10GAYaGVgDn2Q58Dyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com
List-Id: linux-next.vger.kernel.org

Hi,

On Wed, Jan 22, 2014 at 11:45:42AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> In file included from arch/x86/platform/intel-mid/intel-mid.c:38:0:
> arch/x86/platform/intel-mid/intel_mid_weak_decls.h:17:25: error:
> expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=80=99, =E2=80=98;=E2=80=
=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribute__=E2=80=99 before
> =E2=80=98get_penwell_ops=E2=80=99
>  extern void * __cpuinit get_penwell_ops(void) __attribute__((weak));
>                          ^
> arch/x86/platform/intel-mid/intel_mid_weak_decls.h:18:25: error:
> expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=80=99, =E2=80=98;=E2=80=
=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribute__=E2=80=99 before
> =E2=80=98get_cloverview_ops=E2=80=99
>  extern void * __cpuinit get_cloverview_ops(void) __attribute__((weak=
));
>                          ^
> In file included from arch/x86/platform/intel-mid/intel-mid.c:30:0:
> /home/jim/linux/arch/x86/include/asm/intel-mid.h:74:15: error:
> =E2=80=98get_penwell_ops=E2=80=99 undeclared here (not in a function)
>      [cpuid] =3D get_##cpuname##_ops
>                ^
> /home/jim/linux/arch/x86/include/asm/intel-mid.h:84:2: note: in
> expansion of macro =E2=80=98DECLARE_INTEL_MID_OPS_INIT=E2=80=99
>   DECLARE_INTEL_MID_OPS_INIT(penwell, INTEL_MID_CPU_CHIP_PENWELL), \
>   ^
> arch/x86/platform/intel-mid/intel-mid.c:66:45: note: in expansion of
> macro =E2=80=98INTEL_MID_OPS_INIT=E2=80=99
>  static void *(*get_intel_mid_ops[])(void) =3D INTEL_MID_OPS_INIT;
>                                              ^
> /home/jim/linux/arch/x86/include/asm/intel-mid.h:74:15: error:
> =E2=80=98get_cloverview_ops=E2=80=99 undeclared here (not in a functi=
on)
>      [cpuid] =3D get_##cpuname##_ops
>                ^
> /home/jim/linux/arch/x86/include/asm/intel-mid.h:85:2: note: in
> expansion of macro =E2=80=98DECLARE_INTEL_MID_OPS_INIT=E2=80=99
>   DECLARE_INTEL_MID_OPS_INIT(cloverview, INTEL_MID_CPU_CHIP_CLOVERVIE=
W), \
>   ^
> arch/x86/platform/intel-mid/intel-mid.c:66:45: note: in expansion of
> macro =E2=80=98INTEL_MID_OPS_INIT=E2=80=99
>  static void *(*get_intel_mid_ops[])(void) =3D INTEL_MID_OPS_INIT;
>                                              ^
> make[3]: *** [arch/x86/platform/intel-mid/intel-mid.o] Error 1

I just acked a patch fixing this problem. Please, consider apply this a=
s
fix:
https://lkml.org/lkml/2014/1/22/327

Br, David Cohen
