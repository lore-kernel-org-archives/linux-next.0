From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: linux-next: manual merge of the sound-asoc tree with the drm-misc
 tree
Date: Wed, 18 Oct 2017 14:30:50 +0000
Message-ID: <BN6PR12MB16527C9DCEEA4D46EEF1AA90F74D0@BN6PR12MB1652.namprd12.prod.outlook.com>
References: <20171018095733.2ffvg6ty6kn2lfdf@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-sn1nam02on0079.outbound.protection.outlook.com ([104.47.36.79]:18944
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751343AbdJROa4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Oct 2017 10:30:56 -0400
In-Reply-To: <20171018095733.2ffvg6ty6kn2lfdf@sirena.co.uk>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Mark Brown' <broonie@kernel.org>, "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "Zhu, Rex" <Rex.Zhu@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Wednesday, October 18, 2017 5:58 AM
> To: Deucher, Alexander; Mukunda, Vijendar; Zhu, Rex; Daniel Vetter; Intel
> Graphics; DRI; Liam Girdwood
> Cc: Linux-Next Mailing List; Linux Kernel Mailing List
> Subject: linux-next: manual merge of the sound-asoc tree with the drm-mis=
c
> tree
>=20
> Hi all,
>=20
> Today's linux-next merge of the sound-asoc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/include/amd_shared.h
>=20
> between commit:
>=20
>   cfa289fd4986c ("drm/amdgpu: rename amdgpu_dpm_funcs to
> amd_pm_funcs")
>=20
> from the drm-misc tree and commit:
>=20
>   1e4448648333a ("drm/amdgpu Moving amdgpu asic types to a separate
> file")

The patch below effectively reverts 1e4448648333a.  If you drop the patch b=
elow, you should be fine.

Alex

>=20
> from the sound-asoc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/amd/include/amd_shared.h
> index de6fc2731b98,3a49fbd8baf8..000000000000
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@@ -23,37 -23,10 +23,39 @@@
>   #ifndef __AMD_SHARED_H__
>   #define __AMD_SHARED_H__
>=20
> - #define AMD_MAX_USEC_TIMEOUT		200000  /* 200 ms */
> + #include <drm/amd_asic_type.h>
>=20
>  +struct seq_file;
>  +
>  +/*
>  + * Supported ASIC types
>  + */
>  +enum amd_asic_type {
>  +	CHIP_TAHITI =3D 0,
>  +	CHIP_PITCAIRN,
>  +	CHIP_VERDE,
>  +	CHIP_OLAND,
>  +	CHIP_HAINAN,
>  +	CHIP_BONAIRE,
>  +	CHIP_KAVERI,
>  +	CHIP_KABINI,
>  +	CHIP_HAWAII,
>  +	CHIP_MULLINS,
>  +	CHIP_TOPAZ,
>  +	CHIP_TONGA,
>  +	CHIP_FIJI,
>  +	CHIP_CARRIZO,
>  +	CHIP_STONEY,
>  +	CHIP_POLARIS10,
>  +	CHIP_POLARIS11,
>  +	CHIP_POLARIS12,
>  +	CHIP_VEGA10,
>  +	CHIP_RAVEN,
>  +	CHIP_LAST,
>  +};
>  +
> + #define AMD_MAX_USEC_TIMEOUT		200000  /* 200 ms */
> +
>   /*
>    * Chip flags
>    */
