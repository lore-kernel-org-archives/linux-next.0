From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
Date: Fri, 24 May 2019 20:15:48 +1000
Message-ID: <20190524201548.2e8594a2@canb.auug.org.au>
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
        <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rSQC7uUY/cTRnE+r_IeEC2W"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/rSQC7uUY/cTRnE+r_IeEC2W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 24 May 2019 10:09:28 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 24, 2019 at 12:29 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > After merging the drm-fixes tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In functio=
n 'load_dmcu_fw':
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:667:7: erro=
r: implicit declaration of function 'ASICREV_IS_PICASSO'; did you mean 'ASI=
CREV_IS_VEGA12_P'? [-Werror=3Dimplicit-function-declaration]
> >    if (ASICREV_IS_PICASSO(adev->external_rev_id))
> >        ^~~~~~~~~~~~~~~~~~
> >        ASICREV_IS_VEGA12_P
> >
> > Caused by commit
> >
> >   55143dc23ca4 ("drm/amd/display: Don't load DMCU for Raven 1")
> >
> > I have reverted that commit for today. =20
>=20
> Seems to compile fine here, and Dave just sent out the pull so I guess
> works for him too. What's your .config?

See above "x86_64 allmodconfig"

Looking at it closely now, I can't see how that error comes about.

Ah, in the drm-fixes tree, the definition of  is protected by

  #if defined(CONFIG_DRM_AMD_DC_DCN1_01)

which gets removed in the amdgpu tree (merged later).  So I can only
presume that CONFIG_DRM_AMD_DC_DCN1_01 was not set for the build I did.

config DRM_AMD_DC
        bool "AMD DC - Enable new display engine"
        default y
        select DRM_AMD_DC_DCN1_0 if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_EN=
ABLE_
COMPARISONS)KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS
        select DRM_AMD_DC_DCN1_01 if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_E=
NABLE_COMPARISONS)

So maybe KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS are set for
allmodconfig.  I no longer have the actual .config file any more, sorry.
--=20
Cheers,
Stephen Rothwell

--Sig_/rSQC7uUY/cTRnE+r_IeEC2W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznxFQACgkQAVBC80lX
0Gypwgf/STyYQBgEHIh//OujCBOU8bO67LU4z2tVmUbYrxl9cEokB6gPMzl8RtLv
frnLT2kR5tQQ3qgB4uXALZixuW0cttJE/RSagDVnSMApTsORyTYAQyAhlKUg+QNx
w8AQe5BvPCEEWwwuhFJBNo0Fm+ETu1AzgeAyrfEZtPA5/PElaBz/kA+BTIP1ABeU
hxHFc+q/Zyu2eyVIxQRBrpg+A8SzyIC5iZDaASjz/K9M++HQvVROmel0mUeiVlam
yfyjAd7aONCgmZNtbf02QVomIb9tHTdTre3tMIjiGfwsDkEGFoCDvMGX7aAZtfl3
0obMRQylr3KYFRTQ78iR9tPibMfNVA==
=rRUW
-----END PGP SIGNATURE-----

--Sig_/rSQC7uUY/cTRnE+r_IeEC2W--
