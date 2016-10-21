From: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: Tree for Oct 20 (gpu/drm/i915)
Date: Fri, 21 Oct 2016 11:08:46 +0800
Message-ID: <20161021030846.7b3bz7orhrojqm6f@zhen-hp.sh.intel.com>
References: <20161020142037.709ffeb1@canb.auug.org.au>
 <0c3c853b-3116-2935-c449-f63b21bb569d@infradead.org>
 <CAKMK7uGYS9=2xG8fO_PRcqc_v=FOkKqzgXdZ2C5QtbJvprLDMQ@mail.gmail.com>
 <87twc6q3nk.fsf@intel.com>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6efkugjtbrj5k3ae"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:39862 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751010AbcJUDNK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Oct 2016 23:13:10 -0400
Content-Disposition: inline
In-Reply-To: <87twc6q3nk.fsf@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Randy Dunlap <rdunlap@infradead.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx <intel-gfx@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>


--6efkugjtbrj5k3ae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2016.10.20 21:25:03 +0300, Jani Nikula wrote:
> On Thu, 20 Oct 2016, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Oct 20, 2016 at 7:37 PM, Randy Dunlap <rdunlap@infradead.org> w=
rote:
> >> On 10/19/16 20:20, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20161019:
> >>>
> >>
> >> on i386: when CONFIG_ACPI is not enabled:
> >
> > Adding Zhenyu. Might be good to have a fix just for this that I
> > directly pick up, since I want to tag the first 4.10 pull for Dave
> > Airlie this w/e.
>=20
> How about just this?
>

I'd like to not depend on acpi function any more, so just change that
for memremap. GVT-g driver currently only supports 64BIT kernel so will
fix that dependence. I'll send fix pull for Daniel later.

thanks

> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 6aedc96aa412..94914381e8ef 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -85,7 +85,7 @@ config DRM_I915_USERPTR
> =20
>  config DRM_I915_GVT
>          bool "Enable Intel GVT-g graphics virtualization host support"
> -        depends on DRM_I915
> +        depends on DRM_I915 && ACPI
>          default n
>          help
>  	  Choose this option if you want to enable Intel GVT-g graphics
>=20
>=20
>=20
> > -Daniel
> >
> >> ../drivers/gpu/drm/i915/gvt/opregion.c: In function 'intel_gvt_init_op=
region':
> >> ../drivers/gpu/drm/i915/gvt/opregion.c:183:2: error: implicit declarat=
ion of function 'acpi_os_ioremap' [-Werror=3Dimplicit-function-declaration]
> >>   gvt->opregion.opregion_va =3D acpi_os_ioremap(gvt->opregion.opregion=
_pa,
> >>   ^
> >> ../drivers/gpu/drm/i915/gvt/opregion.c:183:28: warning: assignment mak=
es pointer from integer without a cast [enabled by default]
> >>   gvt->opregion.opregion_va =3D acpi_os_ioremap(gvt->opregion.opregion=
_pa,
> >>                             ^
> >> ../drivers/gpu/drm/i915/gvt/gtt.c: In function 'read_pte64':
> >> ../drivers/gpu/drm/i915/gvt/gtt.c:277:2: warning: left shift count >=
=3D width of type [enabled by default]
> >>   pte |=3D ioread32(addr + 4) << 32;
> >>   ^
> >> ../drivers/gpu/drm/i915/gvt/gtt.c: In function 'gen8_gtt_get_pfn':
> >> ../drivers/gpu/drm/i915/gvt/gtt.c:360:3: warning: left shift count >=
=3D width of type [enabled by default]
> >>    pfn =3D (e->val64 & ADDR_4K_MASK) >> 12;
> >>    ^
> >> ../drivers/gpu/drm/i915/gvt/gtt.c: In function 'gen8_gtt_set_pfn':
> >> ../drivers/gpu/drm/i915/gvt/gtt.c:373:3: warning: left shift count >=
=3D width of type [enabled by default]
> >>    e->val64 &=3D ~ADDR_4K_MASK;
> >>    ^
> >> ../drivers/gpu/drm/i915/gvt/gtt.c:374:3: warning: left shift count >=
=3D width of type [enabled by default]
> >>    pfn &=3D (ADDR_4K_MASK >> 12);
> >>    ^
> >> ../drivers/gpu/drm/i915/gvt/gtt.c: In function 'gen8_gma_to_pml4_index=
':
> >> ../drivers/gpu/drm/i915/gvt/gtt.c:436:1: warning: right shift count >=
=3D width of type [enabled by default]
> >>  DEFINE_PPGTT_GMA_TO_INDEX(gen8, pml4, (gma >> 39 & 0x1ff));
> >>  ^
> >>   CC      drivers/gpu/drm/radeon/si_smc.o
> >> In file included from ../drivers/gpu/drm/i915/i915_drv.h:46:0,
> >>                  from ../drivers/gpu/drm/i915/gvt/gtt.c:36:
> >> ../drivers/gpu/drm/i915/gvt/gtt.c: In function 'intel_gvt_create_scrat=
ch_page':
> >> ../drivers/gpu/drm/i915/gvt/gtt.c:1945:47: warning: cast from pointer =
to integer of different size [-Wpointer-to-int-cast]
> >>    gvt_err("fail to translate vaddr:0x%llx\n", (u64)vaddr);
> >>                                                ^
> >> ../include/drm/drmP.h:201:43: note: in definition of macro 'DRM_ERROR'
> >>   drm_printk(KERN_ERR, DRM_UT_NONE, fmt, ##__VA_ARGS__)
> >>                                            ^
> >> ../drivers/gpu/drm/i915/gvt/gtt.c:1945:3: note: in expansion of macro =
'gvt_err'
> >>    gvt_err("fail to translate vaddr:0x%llx\n", (u64)vaddr);
> >>    ^
> >>
> >>
> >>
> >> --
> >> ~Randy
> >> _______________________________________________
> >> Intel-gfx mailing list
> >> Intel-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>=20
> --=20
> Jani Nikula, Intel Open Source Technology Center

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--6efkugjtbrj5k3ae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEABECAAYFAlgJhr4ACgkQsQQaM014GCcM+wCeJlSy0hKgsJJX9P/ngDdTT4jJ
Qr0An0sM3S6LkfEvOxv9P3zGHqC6PFKm
=TtVh
-----END PGP SIGNATURE-----

--6efkugjtbrj5k3ae--
