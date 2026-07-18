Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5203D1F1304;
	Sat, 18 Jul 2026 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784366483; cv=none; b=cepu7v2YY9Ar8WKnMi1F+iO6RJpyluwjl17vsnZPyqA2XAS5gqJlJ2CKnm0eBQ7D5fbAcnRFE0oKTAgHOy5xq0D4JAxqRxpK6jT582yQkKxCtG0PMHKXbu1RT6NQpN3FstW9mY7y0TeGPIN3gePI22NIDH1A0H/6oTpXUT59Bgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784366483; c=relaxed/simple;
	bh=t0EUQ9Al5N5wc8x9D6FEpm7dCTB09CNqNPCeu/77gAU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kZUxz+sVBNyFkuatrryBci4742/TMRBVd7MCFK9EtOwC+nbWdgn6paEw7bTiQrwAl9J5q5xplzA5x0jeBLBkuPJU16JtNr+kfzTYBY8/EkMeYGCDcAU9JCmedfXMviv3XHaqbhd0FHmRKUwgWaFO+WOxIo91Gb1WHLe/d58+M2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=Tg4ArzJL; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="Tg4ArzJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784366479; x=1784971279; i=spasswolf@web.de;
	bh=Txcj6lg11fs/bItCCmYN6HDREpRxvcKAtvpvqm9w3yU=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Tg4ArzJLmqT4zHpyix6iJ1OAjv1Gib9EZ0Wkp9vr/ejYduFpXrpybzg6To6iyw/U
	 e+rFiTvrBk4F8YMw1Z8y/YB/PiNHhAxYlrpgaDZMf+J0VK3MXgqLX5UqZBTMACpaA
	 G8zcGao2RHUcByrFfwNtpfn5pKfJ03JM/N1/Vo9WuAqD04a5lxfETVZLExGs+hRua
	 oKGc3l9wd+++F50wBXkG+BcRQmnDWeuVPCPULzwzIFVKdVTkQBiu8pbRY2gWwc71O
	 AQEKbUMppVGgH1J+8FL5PUosRIkR61b0gqkBQHv1Kzr3hoSpXCSabrCzISH+I+dCy
	 j6qLlUnqopFWqi/azg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3m9J-1wkC9V47Ot-00BBjJ; Sat, 18
 Jul 2026 11:21:19 +0200
Message-ID: <cd96faf15c338157e49a858f9e4f94acba4c28ab.camel@web.de>
Subject: Re: warnings from validate_blend_mode_for_alpha_formats() in
 next-20260715
From: Bert Karwatzki <spasswolf@web.de>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>, Alex Deucher
	 <alexdeucher@gmail.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Leo
 (Sunpeng) Li" <Sunpeng.Li@amd.com>, Alex Hung <alex.hung@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, Jesse Zhang
	 <jesse.zhang@amd.com>, Amber Lin <Amber.Lin@amd.com>, Mario Limonciello
	 <mario.limonciello@amd.com>, spasswolf@web.de
Date: Sat, 18 Jul 2026 11:21:17 +0200
In-Reply-To: <45d341e6-d438-4e34-bba2-f6d23dbcf7fb@collabora.com>
References: <20260716152933.6744-1-spasswolf@web.de>
		 <CADnq5_PEN=iuspWbQ9C3gJZ5qJVOLmJ5hrsi6FH0Dg2Y_u2mZQ@mail.gmail.com>
		 <45d341e6-d438-4e34-bba2-f6d23dbcf7fb@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L2mAw1aAzvAI8hU9onNPPOqvecXR1Pvp8SNqERZ4jIsar0WPWhN
 IKi5BzFShA6JClwJ/XzqUJJIKvqPdgtZuSeN1HtLmrk8rZahw0EKkaxnvabnF/Vr32bBsuB
 l3MYEjr13cKT5DX69mneIfWR8RBdb0wvwpUoG8N2Q53TBDC6poj24Hqdeub9LR89qjYsZzr
 eRnloXCgz605cfIBXU6WQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fSM4Pr9mJC8=;jr+pwVnjWFEukfrvAAaOvLZtqId
 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
 5bCjJ19T3y4BwrE/lDOMO

Am Freitag, dem 17.07.2026 um 19:54 -0300 schrieb Leandro Ribeiro:
>=20
> On 7/17/26 11:55 AM, Alex Deucher wrote:
> > + Some display folks
> >=20
> > On Fri, Jul 17, 2026 at 9:04=E2=80=AFAM Bert Karwatzki <spasswolf@web.=
de> wrote:
> > >=20
> > > commit 860e748bddcc ("drm: ensure blend mode supported if pixel form=
at with alpha exposed")
> > > introduces validate_blend_mode_for_alpha_formats() which prints warn=
ings for amdpgu as
> > > amdgpu only set blend_mode_property for planes of type DRM_PLANE_TYP=
E_OVERLAY. I tried to fix
> > > this by removing he (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY) chec=
k in amdgpu_dm_plane_init():
> > >=20
> > >         printk(KERN_INFO "%s: plane=3D%px plane->type=3D0x%x plane_c=
ap=3D%px\n", __func__, plane, plane->type, plane_cap);
> > >         if (plane_cap)
> > >                 printk(KERN_INFO "%s: per_pixel_alpha =3D%u\n", __fu=
nc__, plane_cap->per_pixel_alpha);
> > >         if (plane_cap && plane_cap->per_pixel_alpha) {
> > >                 unsigned int blend_caps =3D BIT(DRM_MODE_BLEND_PIXEL=
_NONE) |
> > >                                           BIT(DRM_MODE_BLEND_PREMULT=
I) |
> > >                                           BIT(DRM_MODE_BLEND_COVERAG=
E);
> > >=20
> > >                 printk(KERN_INFO "%s: creating alpha and blend mode =
properties for plane %px\n", __func__, plane);
> > >                 drm_plane_create_alpha_property(plane);
> > >                 drm_plane_create_blend_mode_property(plane, blend_ca=
ps);
> > >         }
> > >=20
> > > But this does not completely silence the warnings becuase for planes=
 of type DRM_PLANE_TYPE_CURSOR plane_cap is NULL.
> > > Is this a problem that should be fixed in amdgpu or is should valida=
te_blend_mode_for_alpha_formats() only be called
> > > for planes of certain types?
>=20
> IMO validate_blend_mode_for_alpha_formats() should be called for all
> types of planes. I can't think of anything special about a cursor plane
> that would justify it being allowed to expose formats with alpha but not
> the blend mode property.
>=20
> I'm not familiar with the AMD codebase to suggest the best fix, but the
> driver would need some way to know whether cursor planes are exposing
> formats with alpha.
>=20
> > >=20
> > > Bert Karwatzki
> > >=20

So I looked through the code and found that the cursor planes are initiall=
ized by=C2=A0
amdgpu_dm_crtc_init() which calls amdgpu_dm_plane_init() with plane_cap =
=3D NULL.
So I was able to silence the warning by introducing a dummy_plane_cap in a=
mdgpu_dm_crtc_init()
and dropping the plane->type check in amdgpu_dm_plane_init().

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/driv=
ers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index d63688b9d93d..7fb118444d14 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -731,13 +731,17 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manage=
r *dm,
        struct drm_plane *cursor_plane;
        bool has_degamma;
        int res =3D -ENOMEM;
+       struct dc_plane_cap dummy_cap =3D {
+               .type =3D DC_PLANE_TYPE_DCE_RGB,
+               .per_pixel_alpha =3D 1,
+       };
=20
        cursor_plane =3D kzalloc_obj(*cursor_plane);
        if (!cursor_plane)
                goto fail;
=20
        cursor_plane->type =3D DRM_PLANE_TYPE_CURSOR;
-       res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, NULL);
+       res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, &dummy_cap);
=20
        acrtc =3D kzalloc_obj(struct amdgpu_crtc);
        if (!acrtc)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 26f35434a92f..20785fb451dd 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1932,8 +1932,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manag=
er *dm,
        if (res)
                return res;
=20
-       if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY &&
-           plane_cap && plane_cap->per_pixel_alpha) {
+       if (plane_cap && plane_cap->per_pixel_alpha) {
                unsigned int blend_caps =3D BIT(DRM_MODE_BLEND_PIXEL_NONE)=
 |
                                          BIT(DRM_MODE_BLEND_PREMULTI) |
                                          BIT(DRM_MODE_BLEND_COVERAGE);

One can probably also omit the .type field in the dummy_cap struct and
also does not have to check if plance_cap is NULL anymore.

Bert Karwatzki
