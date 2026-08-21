Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B653B379998;
	Fri, 21 Aug 2026 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341386; cv=none; b=mXn37XjvGeyyJgc8hGFepp8hj7OXwFyLEC70+uTG0gPmO1Q5KZANbx4tcXQyYAIXepawVh8nyHWlC3Z2dPuj6qEgwJGffJ8aJvybuoII7TIOvrcKygcP2fa95tZt4NbUkYvA93bjzRVVRtx/nmorwLR06NBUfaknQukWZ9YdZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341386; c=relaxed/simple;
	bh=G0svtlu1QmxLiarmrO1zKwVAI3q88e0H/dtteetL69k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ewsNb/te6Ub1EXAw3jZIqZoHp9pjQCm67zpyQMG6KQjbxOxLz4U0QXI1a9n4VKA0Cy74JZKRc/MeMUMxUZVzOQTLvSxW5Xvz+bTIWpBA8tk/oLk6Ef6DLCXEY6r6NGE6Vikd9oKk/Y+mr5rs78gdzAPGTAckfioGT7jXx9t4Ajk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=qqg6a3Ne; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="qqg6a3Ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787341375; x=1787946175; i=spasswolf@web.de;
	bh=L/wGrymbJre+BwdT2dFIcH2imnHsz2YncuuQg3ewfY4=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qqg6a3NeAuN36Jwbo0hDEgF1VCfqZakng2bsvOcGOQ4amRXdKcY+j/8/2VG7fAqJ
	 c0nNNE0E8ROKKkIEBXrEc9ZDJuszDmJlA2WoSTAcixTn6ARDAexezS0BxCsZnjz08
	 dd/E+mQztHKXXiBQbM5ZuNDVNW5h2akgVobc6/9MdMgbwK9IlI25K1PgP5vm/giJ9
	 e2UkxB8jm49ZiIqrlNAxO2BlViR442gd+5MYV/VOin0Bpig1DF3HVOrRin7hsbu4b
	 anSBDZfv7+gSYZ7g+/Hf3apeZqrXLcO4EEL/8l0Y0l01oYkHxIFK3UIs0O8055gce
	 9B5ZK9/s9yIZjhHEPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3m59-1wyKDc2d1v-00Bfy1; Fri, 21
 Aug 2026 21:42:55 +0200
Message-ID: <7ac562a41bc25f459c2102a01f2d07f2437984b8.camel@web.de>
Subject: Re: [PATCH 1/8] display: fix blend_mode for non-overlay planes
From: Bert Karwatzki <spasswolf@web.de>
To: Joshua Peisach <jpeisach@ubuntu.com>, linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, Leo Li	 <Sunpeng.Li@amd.com>, Alex Hung
 <alex.hung@amd.com>, 	amd-gfx@lists.freedesktop.org, Jesse Zhang
 <jesse.zhang@amd.com>, Amber Lin	 <Amber.Lin@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, amd-gfx	
 <amd-gfx-bounces@lists.freedesktop.org>, spasswolf@web.de
Date: Fri, 21 Aug 2026 21:42:52 +0200
In-Reply-To: <DKUUGMJ1H5N5.2FRQG3ZKH6SNB@ubuntu.com>
References: <514c5423b98376e2e6f1fe4bb56c0f3607b4cd52.camel@web.de>
	 <20260814151701.65222-1-spasswolf@web.de>
	 <DKUUGMJ1H5N5.2FRQG3ZKH6SNB@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2-10+b1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O+jFhhnhcUrZ1gERpbv9PR2Fcp7lLTp8UzDx1qSErBLirjkrFyI
 z7kh6LKWbHEAxrZJ4bo32KiRk06VgYiTNIppELl72dRYvbqRf02cSRWFFW+4BD08+86tund
 u415Qa7WoqJD/wIRnjjtkdHLmsEDWASUvm6Jf+9xspLlc6sWmq+H+zJjelld/YXIb3M6sLL
 fx5TudJeLjjilHCEHl5Yg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w9SszOOEqzk=;5q4DHI0TJ1Aqbofx6LDB6RSrMjm
 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
 gkFoqoZ5n/2hZixE9ZWQ=

Am Freitag, dem 21.08.2026 um 14:47 -0400 schrieb Joshua Peisach:
> On Fri Aug 14, 2026 at 11:17 AM EDT, Bert Karwatzki wrote:
> > Previously drm_plane_create_blend_mode_property() was only called for
> > planes of type DRM_PLANE_TYPE_OVERLAY. Since commit commit 860e748bddc=
c
> > ("drm: ensure blend mode supported if pixel format with alpha exposed"=
)
> > this results in warnings from validate_blend_mode_for_alpha_formats().
> > We fix this here by calling drm_plane_create_blend_mode_property() for
> > all plane types if the plane is supporting a format with
> > per_pixel_alpha.
> >=20
> > Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c  | 5 ++++-
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +--
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > index 62eac6e65334..a6a54351ea56 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > @@ -755,13 +755,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_ma=
nager *dm,
> >  	struct drm_plane *cursor_plane;
> >  	bool has_degamma;
> >  	int res =3D -ENOMEM;
> > +	struct dc_plane_cap dummy_cap =3D {
> > +		.per_pixel_alpha =3D 1,
> > +	};
> > =20
> >  	cursor_plane =3D kzalloc_obj(*cursor_plane);
> >  	if (!cursor_plane)
> >  		goto fail;
> > =20
> >  	cursor_plane->type =3D DRM_PLANE_TYPE_CURSOR;
> > -	res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, NULL);
> > +	res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, &dummy_cap);
> > =20
> >  	acrtc =3D kzalloc_obj(struct amdgpu_crtc);
> >  	if (!acrtc)
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b=
/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 824ef3ce5de0..4c0c6a8a0dac 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -2208,8 +2208,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_m=
anager *dm,
> >  	if (res)
> >  		return res;
> > =20
> > -	if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY &&
> > -	    plane_cap && plane_cap->per_pixel_alpha) {
> > +	if (plane_cap && plane_cap->per_pixel_alpha) {
> >  		unsigned int blend_caps =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> >  					  BIT(DRM_MODE_BLEND_PREMULTI) |
> >  					  BIT(DRM_MODE_BLEND_COVERAGE);
>=20
> Not sure where the full patch set is, but this does make the warning
> go away.
>=20
> Tested-by: Joshua Peisach <jpeisach@ubuntu.com>

This is actually the only patch, the 1/8 is an artifact from using=20
git format-patch which I forgot to remove.

Bert Karwatzki
