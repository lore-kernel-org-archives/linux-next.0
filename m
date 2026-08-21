Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5CB383987
	for <linux-next@vger.kernel.org>; Fri, 21 Aug 2026 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338068; cv=none; b=a2eEC5/896mBIJhxXVi4sM21qnvT5QcVWJaC0VB65bLe3Hll5+veQSOGALAWdAMhnuuxkfXl2wGe3cFo1/yb5Qbnyp55mhqFDj9INh+kijJeU+g2gY8Y6/gQsA2lEqoMmztl/qutSbp/CTGTkiBLCnaY7Sx7GiNkD+K03e5MO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338068; c=relaxed/simple;
	bh=VcQZG+b7/NPXLeX4Lh9rfN5hnyTJjzRusGZhetMIlC4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fM+byvQ/DZe02KEO7EnIvCmPG7j902olX9J6nuqOd9WNgpXYwWRC5x67B0XwdNlRYjx4sUbzOct2B2cP3JrLGkHnQJ9ZGYun4gPLyP66M8U8c+YaOmtUrEv2fbzMlOIG1o7kuepSCAc5GSeX4Wn5sTAjPhw7FKJLlP1ceBzgYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=EuFZZIjT; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="EuFZZIjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1787338059;
 bh=nsNVBb9noAGwLm3N5qP79tHFDl2D832+fV5F/3bLxPY=;
 b=EuFZZIjTQklL4er1CFjFCZYqlcPofdSOdTisQ+ve7s60fmA0aDkYZYMMcacVQ2+iC2HIKCUu0
 EnWnd93Jt/TfsCyjLDH018NZsvh9kN8LA32mzr6pd85W5CvEvk/8ucA1MjVE05c5UKVymYrihlh
 r9WdGR3ZCa9/prrpJyckwzGgzK5SJc5fgA4bFVDW40I3hvSEowTBcPTTyogOVK2SdB9h2VaXHtW
 v2pL7nvPufq/6sdyqNxCW0SiBY7qD4cT2rXzS7PbZhtralgIrnkPL103moNfXPro2QqAr+5B5d3
 3+NETcdO24f1/FhsVJ689xtNYYkJwKNn6+NA3XNO3DYg==
X-Forward-Email-ID: 6a889d46fb9ca77f277b6258
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 21 Aug 2026 14:47:33 -0400
Message-Id: <DKUUGMJ1H5N5.2FRQG3ZKH6SNB@ubuntu.com>
Cc: <linux-next@vger.kernel.org>, "Alex Deucher"
 <alexander.deucher@amd.com>, "Leandro Ribeiro"
 <leandro.ribeiro@collabora.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Leo Li" <Sunpeng.Li@amd.com>, "Alex Hung"
 <alex.hung@amd.com>, <amd-gfx@lists.freedesktop.org>, "Jesse Zhang"
 <jesse.zhang@amd.com>, "Amber Lin" <Amber.Lin@amd.com>, "Mario Limonciello"
 <mario.limonciello@amd.com>, "amd-gfx"
 <amd-gfx-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] display: fix blend_mode for non-overlay planes
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Bert Karwatzki" <spasswolf@web.de>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <514c5423b98376e2e6f1fe4bb56c0f3607b4cd52.camel@web.de>
 <20260814151701.65222-1-spasswolf@web.de>
In-Reply-To: <20260814151701.65222-1-spasswolf@web.de>

On Fri Aug 14, 2026 at 11:17 AM EDT, Bert Karwatzki wrote:
> Previously drm_plane_create_blend_mode_property() was only called for
> planes of type DRM_PLANE_TYPE_OVERLAY. Since commit commit 860e748bddcc
> ("drm: ensure blend mode supported if pixel format with alpha exposed")
> this results in warnings from validate_blend_mode_for_alpha_formats().
> We fix this here by calling drm_plane_create_blend_mode_property() for
> all plane types if the plane is supporting a format with
> per_pixel_alpha.
>
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c  | 5 ++++-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 62eac6e65334..a6a54351ea56 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -755,13 +755,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manag=
er *dm,
>  	struct drm_plane *cursor_plane;
>  	bool has_degamma;
>  	int res =3D -ENOMEM;
> +	struct dc_plane_cap dummy_cap =3D {
> +		.per_pixel_alpha =3D 1,
> +	};
> =20
>  	cursor_plane =3D kzalloc_obj(*cursor_plane);
>  	if (!cursor_plane)
>  		goto fail;
> =20
>  	cursor_plane->type =3D DRM_PLANE_TYPE_CURSOR;
> -	res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, NULL);
> +	res =3D amdgpu_dm_plane_init(dm, cursor_plane, 0, &dummy_cap);
> =20
>  	acrtc =3D kzalloc_obj(struct amdgpu_crtc);
>  	if (!acrtc)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 824ef3ce5de0..4c0c6a8a0dac 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -2208,8 +2208,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_mana=
ger *dm,
>  	if (res)
>  		return res;
> =20
> -	if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY &&
> -	    plane_cap && plane_cap->per_pixel_alpha) {
> +	if (plane_cap && plane_cap->per_pixel_alpha) {
>  		unsigned int blend_caps =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>  					  BIT(DRM_MODE_BLEND_PREMULTI) |
>  					  BIT(DRM_MODE_BLEND_COVERAGE);

Not sure where the full patch set is, but this does make the warning
go away.

Tested-by: Joshua Peisach <jpeisach@ubuntu.com>
