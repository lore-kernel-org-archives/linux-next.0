From: Paul Gortmaker <paul.gortmaker@gmail.com>
Subject: Re: [PATCH/RFC] rapidio: temporarily exclude FSL_RIO from 64 bit builds
Date: Sun, 26 Feb 2012 20:26:47 -0500
Message-ID: <CAP=VYLroaEKncpy7VBobJdXijnDS5UdTV7qPG2A--SicnGvFSg@mail.gmail.com>
References: <1329865853-17277-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:48003 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753666Ab2B0B0r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 26 Feb 2012 20:26:47 -0500
Received: by daed14 with SMTP id d14so543570dae.19
        for <linux-next@vger.kernel.org>; Sun, 26 Feb 2012 17:26:47 -0800 (PST)
In-Reply-To: <1329865853-17277-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: linuxppc-dev@lists.ozlabs.org, Gang.Liu@freescale.com, linux-next@vger.kernel.org

Hi Ben,

Given a week has passed with the absence of any feedback
with respect to SRIO on 64 bit, are you OK with applying the
below patch[1] pretty much as-is?

Thanks,
Paul.

[1] http://patchwork.ozlabs.org/patch/142383/

---

On Tue, Feb 21, 2012 at 6:10 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> The following are seen while using the corenet64_smp_defconfig:
>
> arch/powerpc/sysdev/fsl_rmu.c:315: error: cast from pointer to intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:320: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:320: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:320: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:330: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:332: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:339: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:340: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:341: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:348: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:348: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:348: error: cast to pointer from intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:659: error: cast from pointer to intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:659: error: format '%8.8x' expects type=
 'unsigned int', but argument 5 has type 'size_t'
> arch/powerpc/sysdev/fsl_rmu.c:985: error: cast from pointer to intege=
r of different size
> arch/powerpc/sysdev/fsl_rmu.c:997: error: cast to pointer from intege=
r of different size
>
> A quick inspection of the code leaves one with the impression
> that it was not explicitly written with 64 bit support in mind,
> so just block that as a possible config selection for now.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> ---
>
> [This is seen in linux-next -- not sure if this is the right way to g=
o
> =A0but at least it will give the issue some visibility to the right p=
pl.]
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 75f061e..5ad8013 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -773,7 +773,7 @@ config RAPIDIO
>
> =A0config FSL_RIO
> =A0 =A0 =A0 =A0bool "Freescale Embedded SRIO Controller support"
> - =A0 =A0 =A0 depends on RAPIDIO && HAS_RAPIDIO
> + =A0 =A0 =A0 depends on RAPIDIO && HAS_RAPIDIO && (BROKEN || !PPC64)
> =A0 =A0 =A0 =A0default "n"
> =A0 =A0 =A0 =A0---help---
> =A0 =A0 =A0 =A0 =A0Include support for RapidIO controller on Freescal=
e embedded
> --
> 1.7.9.1
>
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
