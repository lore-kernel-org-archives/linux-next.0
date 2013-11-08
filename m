From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915/opregion: fix build error on CONFIG_ACPI=n
Date: Fri, 8 Nov 2013 19:33:15 +0100
Message-ID: <20131108183315.GF14082@phenom.ffwll.local>
References: <CA+r1ZhjcFpr5KKVX0pLCOP8cAyZoiYO=UyqYMJtNSV-Kt_p7xQ@mail.gmail.com>
 <1383898231-23234-1-git-send-email-jani.nikula@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:39796 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757969Ab3KHScr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2013 13:32:47 -0500
Received: by mail-ea0-f173.google.com with SMTP id g10so1299751eak.4
        for <linux-next@vger.kernel.org>; Fri, 08 Nov 2013 10:32:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1383898231-23234-1-git-send-email-jani.nikula@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org

On Fri, Nov 08, 2013 at 10:10:31AM +0200, Jani Nikula wrote:
> Fix CONFIG_ACPI=3Dn build fail
>=20
>   CC      drivers/gpu/drm/i915/intel_opregion.o
> drivers/gpu/drm/i915/intel_opregion.c: In function =E2=80=98intel_opr=
egion_setup=E2=80=99:
> drivers/gpu/drm/i915/intel_opregion.c:879:2: error: =E2=80=98asle_wor=
k=E2=80=99 undeclared (first use in this function)
> drivers/gpu/drm/i915/intel_opregion.c:879:2: note: each undeclared id=
entifier is reported only once for each function it appears in
> make[4]: *** [drivers/gpu/drm/i915/intel_opregion.o] Error 1
>=20
> introduced in
> commit 91a60f20712179e56b7a6c3d332a5f6f9a54aa11
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Thu Oct 31 18:55:48 2013 +0200
>=20
>     drm/i915: move opregion asle request handling to a work queue
>=20
> Reported-by: Jim Davis <jim.epost@gmail.com>
> Reference: http://lkml.kernel.org/r/CA+r1ZhjcFpr5KKVX0pLCOP8cAyZoiYO=3D=
UyqYMJtNSV-Kt_p7xQ@mail.gmail.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Picked up for -fixes, thanks for the patch.
-Daniel

> ---
>  drivers/gpu/drm/i915/intel_opregion.c |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_opregion.c b/drivers/gpu/drm/=
i915/intel_opregion.c
> index 91b68dc..1b2f41c 100644
> --- a/drivers/gpu/drm/i915/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/intel_opregion.c
> @@ -876,7 +876,9 @@ int intel_opregion_setup(struct drm_device *dev)
>  		return -ENOTSUPP;
>  	}
> =20
> +#ifdef CONFIG_ACPI
>  	INIT_WORK(&opregion->asle_work, asle_work);
> +#endif
> =20
>  	base =3D acpi_os_ioremap(asls, OPREGION_SIZE);
>  	if (!base)
> --=20
> 1.7.9.5
>=20

--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
