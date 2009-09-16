From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: [PATCH] edac: need to export cpu_llc_id
Date: Wed, 16 Sep 2009 06:41:51 +0200
Message-ID: <20090916044151.GB5767@aftab>
References: <20090916093935.6bc2c91f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]:31335 "EHLO
	TX2EHSOBE010.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761AbZIPEm0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2009 00:42:26 -0400
Content-Disposition: inline
In-Reply-To: <20090916093935.6bc2c91f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

Hi Stephen,

On Wed, Sep 16, 2009 at 09:39:35AM +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> ERROR: "per_cpu__cpu_llc_id" [drivers/edac/edac_core.ko] undefined!
>=20
> Caused by commit b69b29de65fe4078b125acc9dea34be82f7c362c ("EDAC, AMD=
:
> carve out MCi_STATUS decoding").
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kernel/smpboot.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index a25eeec..04c74b4 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -100,6 +100,7 @@ EXPORT_SYMBOL(smp_num_siblings);
> =20
>  /* Last level cache ID of each logical CPU */
>  DEFINE_PER_CPU(u16, cpu_llc_id) =3D BAD_APICID;
> +EXPORT_PER_CPU_SYMBOL(cpu_llc_id);
> =20
>  /* representing HT siblings of each logical CPU */
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
> --=20
> 1.6.3.3

proper fix is at http://marc.info/?l=3Dlinux-kernel&m=3D125302459621925

we still have to figure out who's gonna pick it up. Ingo?

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Andrew Bowd, Thomas M. McCoy, Giuliano=
 Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
