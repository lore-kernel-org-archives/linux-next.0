From: Eric Paris <eparis@parisplace.org>
Subject: Re: linux-next: Tree for May 29 (__rdmsr_on_cpu() OOPS)
Date: Mon, 1 Jun 2009 15:55:22 -0400
Message-ID: <7e0fb38c0906011255o25f2e852r6ba469c8345e8c77@mail.gmail.com>
References: <20090529145018.ff547ea1.sfr@canb.auug.org.au>
	 <200905302137.57644.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757130AbZFATzb@vger.kernel.org>
In-Reply-To: <200905302137.57644.bzolnier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <borislav.petkov@amd.com>
List-Id: linux-next.vger.kernel.org

On Sat, May 30, 2009 at 3:37 PM, Bartlomiej Zolnierkiewicz
<bzolnier@gmail.com> wrote:

> [ Borislav, feel free to fold it into the above change or replace by
> =A0a more complete one if needed (there may be more rv fields needing
> =A0initialization). ]
>
> From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> Subject: [PATCH] x86: MSR: fix __rdmsr_on_cpu() OOPS
>
> {rd,wr}msr_on_cpu() need to explicitly initalize rv.msrs
> (since rv is allocated on the stack).
>
> Cc: Borislav Petkov <borislav.petkov@amd.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

Still broken in 0601, none of my systems will even boot without this pa=
tch.

Tested-by: Eric Paris <eparis@redhat.com>

> ---
> =A0arch/x86/lib/msr.c | =A0 =A02 ++
> =A01 file changed, 2 insertions(+)
>
> Index: b/arch/x86/lib/msr.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/arch/x86/lib/msr.c
> +++ b/arch/x86/lib/msr.c
> @@ -44,6 +44,7 @@ int rdmsr_on_cpu(unsigned int cpu, u32 m
> =A0 =A0 =A0 =A0int err;
> =A0 =A0 =A0 =A0struct msr_info rv;
>
> + =A0 =A0 =A0 rv.msrs =A0 =3D NULL;
> =A0 =A0 =A0 =A0rv.msr_no =3D msr_no;
> =A0 =A0 =A0 =A0err =3D smp_call_function_single(cpu, __rdmsr_on_cpu, =
&rv, 1);
> =A0 =A0 =A0 =A0*l =3D rv.reg.l;
> @@ -58,6 +59,7 @@ int wrmsr_on_cpu(unsigned int cpu, u32 m
> =A0 =A0 =A0 =A0int err;
> =A0 =A0 =A0 =A0struct msr_info rv;
>
> + =A0 =A0 =A0 rv.msrs =A0 =3D NULL;
> =A0 =A0 =A0 =A0rv.msr_no =3D msr_no;
> =A0 =A0 =A0 =A0rv.reg.l =3D l;
> =A0 =A0 =A0 =A0rv.reg.h =3D h;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
