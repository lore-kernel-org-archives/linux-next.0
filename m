From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: Tree for May 29 (__rdmsr_on_cpu() OOPS)
Date: Tue, 2 Jun 2009 16:13:25 +0200
Message-ID: <20090602141325.GB13792@aftab>
References: <20090529145018.ff547ea1.sfr@canb.auug.org.au> <200905302137.57644.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:55398 "EHLO
	TX2EHSOBE004.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753764AbZFBONt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2009 10:13:49 -0400
Content-Disposition: inline
In-Reply-To: <200905302137.57644.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi,

On Sat, May 30, 2009 at 09:37:57PM +0200, Bartlomiej Zolnierkiewicz wro=
te:
>=20
> next-20090529 oopses in __rdmsr_on_cpu() on my Pentium M laptop.
>=20
> .jpg + .config:
> http://www.kernel.org/pub/linux/kernel/people/bart/next-20090529-oops=
=2E*
>=20
> (gdb) l *0xc023410f
> 0xc023410f is in __rdmsr_on_cpu (arch/x86/lib/msr.c:25).
> 20              if (rv->msrs)
> 21                      reg =3D &rv->msrs[this_cpu - rv->off];
> 22              else
> 23                      reg =3D &rv->reg;
> 24
> 25              rdmsr(rv->msr_no, reg->l, reg->h);
> 26      }
> 27
> 28      static void __wrmsr_on_cpu(void *info)
> 29      {
>=20
> Thus the problem seems to be introduced by:
>=20
> commit 23d19840368b2787d2da97ad0f0f29248503648a
> Author: Borislav Petkov <borislav.petkov@amd.com>
> Date:   Fri May 22 13:52:19 2009 +0200
>=20
>     x86: MSR: add methods for writing of an MSR on several CPUs
> ...
>=20
> and indeed the following patch fixes it:
>=20
> [ Borislav, feel free to fold it into the above change or replace by
>   a more complete one if needed (there may be more rv fields needing
>   initialization). ]
>=20
> From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> Subject: [PATCH] x86: MSR: fix __rdmsr_on_cpu() OOPS
>=20
> {rd,wr}msr_on_cpu() need to explicitly initalize rv.msrs
> (since rv is allocated on the stack).
>=20
> Cc: Borislav Petkov <borislav.petkov@amd.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

Thanks.

I went and zeroed out the whole struct so that no stale data sneaks
in. I'm still adding your S-O-B to the patch, if you don't mind, that
is.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
