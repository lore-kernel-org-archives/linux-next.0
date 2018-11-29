From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Nov 29 (drm/i915)
Date: Fri, 30 Nov 2018 08:00:42 +1100
Message-ID: <20181130080042.41d1a926@canb.auug.org.au>
References: <20181129161257.4d1b872f@canb.auug.org.au>
        <3b893ae0-9787-e0ca-4aad-c71135c41ce1@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TJS66LrR4lk+lhVP4dLs3+6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3b893ae0-9787-e0ca-4aad-c71135c41ce1@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

--Sig_/TJS66LrR4lk+lhVP4dLs3+6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 29 Nov 2018 09:09:25 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on i386:
>=20
> 248 "multiple definition of ...".  E.g.:
>=20
>   LD [M]  drivers/gpu/drm/i915/i915.o
> ld: drivers/gpu/drm/i915/i915_irq.o: in function `intel_opregion_resume':
> i915_irq.c:(.text+0x58f0): multiple definition of `intel_opregion_resume'=
; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined =
here
> ld: drivers/gpu/drm/i915/i915_irq.o: in function `intel_opregion_suspend':
> i915_irq.c:(.text+0x5900): multiple definition of `intel_opregion_suspend=
'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first defined=
 here
> ld: drivers/gpu/drm/i915/i915_memcpy.o: in function `intel_opregion_resum=
e':
> i915_memcpy.c:(.text+0xa0): multiple definition of `intel_opregion_resume=
'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined=
 here
> ld: drivers/gpu/drm/i915/i915_memcpy.o: in function `intel_opregion_suspe=
nd':
> i915_memcpy.c:(.text+0xb0): multiple definition of `intel_opregion_suspen=
d'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first define=
d here
> ld: drivers/gpu/drm/i915/i915_mm.o: in function `intel_opregion_resume':
> i915_mm.c:(.text+0x30): multiple definition of `intel_opregion_resume'; d=
rivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined here
> ld: drivers/gpu/drm/i915/i915_mm.o: in function `intel_opregion_suspend':
> i915_mm.c:(.text+0x40): multiple definition of `intel_opregion_suspend'; =
drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first defined he=
re
> ld: drivers/gpu/drm/i915/i915_params.o: in function `intel_opregion_resum=
e':
> i915_params.c:(.text+0x0): multiple definition of `intel_opregion_resume'=
; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined =
here
> ld: drivers/gpu/drm/i915/i915_params.o: in function `intel_opregion_suspe=
nd':
> i915_params.c:(.text+0x10): multiple definition of `intel_opregion_suspen=
d'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first define=
d here
> ld: drivers/gpu/drm/i915/i915_pci.o: in function `intel_opregion_resume':
> i915_pci.c:(.text+0xb0): multiple definition of `intel_opregion_resume'; =
drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined he=
re
> ld: drivers/gpu/drm/i915/i915_pci.o: in function `intel_opregion_suspend':
> i915_pci.c:(.text+0xc0): multiple definition of `intel_opregion_suspend';=
 drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first defined h=
ere
> ld: drivers/gpu/drm/i915/i915_suspend.o: in function `intel_opregion_resu=
me':
> i915_suspend.c:(.text+0x110): multiple definition of `intel_opregion_resu=
me'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defin=
ed here
> ld: drivers/gpu/drm/i915/i915_suspend.o: in function `intel_opregion_susp=
end':
> i915_suspend.c:(.text+0x120): multiple definition of `intel_opregion_susp=
end'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first defi=
ned here
> ld: drivers/gpu/drm/i915/i915_sysfs.o: in function `intel_opregion_resume=
':
> i915_sysfs.c:(.text+0x710): multiple definition of `intel_opregion_resume=
'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined=
 here
> ld: drivers/gpu/drm/i915/i915_sysfs.o: in function `intel_opregion_suspen=
d':
> i915_sysfs.c:(.text+0x720): multiple definition of `intel_opregion_suspen=
d'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first define=
d here
> ld: drivers/gpu/drm/i915/intel_csr.o: in function `intel_opregion_resume':
> intel_csr.c:(.text+0x3c0): multiple definition of `intel_opregion_resume'=
; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined =
here
> ld: drivers/gpu/drm/i915/intel_csr.o: in function `intel_opregion_suspend=
':
> intel_csr.c:(.text+0x3d0): multiple definition of `intel_opregion_suspend=
'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first defined=
 here
> ld: drivers/gpu/drm/i915/intel_device_info.o: in function `intel_opregion=
_resume':
> intel_device_info.c:(.text+0x14c0): multiple definition of `intel_opregio=
n_resume'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first=
 defined here
> ld: drivers/gpu/drm/i915/intel_device_info.o: in function `intel_opregion=
_suspend':
> intel_device_info.c:(.text+0x14d0): multiple definition of `intel_opregio=
n_suspend'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): firs=
t defined here
> ld: drivers/gpu/drm/i915/intel_pm.o: in function `intel_opregion_resume':
> intel_pm.c:(.text+0xad70): multiple definition of `intel_opregion_resume'=
; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first defined =
here
> ld: drivers/gpu/drm/i915/intel_pm.o: in function `intel_opregion_suspend':
> intel_pm.c:(.text+0xad80): multiple definition of `intel_opregion_suspend=
'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first defined=
 here
> ld: drivers/gpu/drm/i915/intel_runtime_pm.o: in function `intel_opregion_=
resume':
> intel_runtime_pm.c:(.text+0x2cb0): multiple definition of `intel_opregion=
_resume'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d40): first =
defined here
> ld: drivers/gpu/drm/i915/intel_runtime_pm.o: in function `intel_opregion_=
suspend':
> intel_runtime_pm.c:(.text+0x2cc0): multiple definition of `intel_opregion=
_suspend'; drivers/gpu/drm/i915/i915_drv.o:i915_drv.c:(.text+0x2d50): first=
 defined here

Caused by commit

  a950adc6c343 ("drm/i915: Stop calling intel_opregion unregister/register =
in suspend/resume")

which forgot the "static inline" on the stub versions ...

--=20
Cheers,
Stephen Rothwell

--Sig_/TJS66LrR4lk+lhVP4dLs3+6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwAU3oACgkQAVBC80lX
0GwSYwgAjkkv4eH7Qo1GFworz2e3kDt4jrGCWIxmrNyj32oWvvrPgtO8zQQPUFDS
sFn8ujRom68KXvwoc96zcwnQXhNh152xP+Z29c6irs+dq72539JknOH7TXPx/BvX
SsZAt/eF/x5WcrdBlM3A/eEhscZ2qJvWrX7A0ww+DFMnkYxEIdkEQU5uazt+2SRI
Kw5LrDJ+AvzRQIv+Bcd7oejy044nuFM9CO6Uiw7w2qTj6I8+Pww2KbdNMk+2pQJc
+3T73FV42OvnurxJ1hPTXDPVq4nto/fhZP7BRkuC4fOOFZktVsQBueV8YhIq6//W
92HgysiLKUQ8l+9cE+WOTP90AxGCmA==
=iwx2
-----END PGP SIGNATURE-----

--Sig_/TJS66LrR4lk+lhVP4dLs3+6--
