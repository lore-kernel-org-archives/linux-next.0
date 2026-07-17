Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B3942A156
	for <linux-next@vger.kernel.org>; Fri, 17 Jul 2026 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300127; cv=pass; b=AoIkO0UvCwf8m+wKy4FB3ga0ynK3U9iiaALLSuQMbF1EmDlJDFpirOF97kCgFpe6BBXPW3vvv5sJyZugN+HQNZU/Z/xVKUnGe3CsL4oiK2btrJvIQVPU1HVzyJsJ0eB0yVvuTdsUFvSXpmvwzyRIrN2jotUyevEvOueVyKZkcPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300127; c=relaxed/simple;
	bh=TL2Yn2ZZ1JSOYsrQDJ0uDpVFxnQNntrnQvLpE4CAV7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYBnLYpeGMF0qjJHDVix6ZrGr8OyS7gex/pIBxBXe8p5MZdb+K6EPENQfStg7UTmx5afcfaHkKwSPPv78mxwDDeIxko/ymyx+mFuRndIWCEbu4v/QqFds3Rzd4kB4Mg8TeEPAzUtXcIBKBMPOwnesk0zhbYFa8gczrgZF1MRCn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2/K8Tqk; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2/K8Tqk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccae46de39so13975945ad.3
        for <linux-next@vger.kernel.org>; Fri, 17 Jul 2026 07:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784300124; cv=none;
        d=google.com; s=arc-20260327;
        b=UgQy8w95lDJp922Isk3oQLf4GHBrZ0HFotliLYsoW5ayr1UOL8uw96pHkBP1nOLlSE
         BtZ89z1hD+Y3QmTfEO9k+Z8ts90kkfWcZXJ7wOjIepQP7NYdNqXea8XoMgEMbYW4X6rX
         BxfD1jueZe/UvDbSzWTk/8a2AyjMcfoKSBCvu9MslDz/KFLs6OtNMK5SMEhA0VV/5gZw
         amS0E6/HPefB/lHhlWE88cmqM6OEvk5gaRUycGDN5kebQdzdbrhrN1dbu4nIiIvyKbrY
         +YWJlLl1QN+h9b40OjXmkrntyZjwlFHRHjYHGWZVAZUXy6F+IGVYwQPWbL6TIF6v5nwH
         b1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ar+1Hu+PGKB3bctJhS4XtPd2fbL2DABSj6SyXwdhS78=;
        fh=7hpvIORSMnlI7/6HgXGXlaaPCnK7ORqMKZQAsXsA/h4=;
        b=LQ397OkdAg5OD5cLShcKbRkph021k0bPMH/0n4EoBu5lZBB7T1Z9RirNzCieQ60oWj
         l4RmHRaW/x0ErMGS/UzYpQ/ZHKa/4hE/+vBwUu+/IhJj1mvWVAuG9BxRM2Xm8irwhP9p
         uRrYNgQjqM0ZQv6nEUfmmvkO7d3VAK6abhgkb3LFMsVzlVDDhFF0Bk2cpuEKsYKawKE0
         GhpiY+MNH+e/dlGvdgGdcU9QHch+xeJuJ8kAb2R8OQFwPmmqOMXfn0LfS9/5vco3Wc/f
         eRWsZhdBX55L0HC6aO+fNOCtsvbi9WyGkiCJyISSYgXpGAd0wOmBQ0UquoItcop3zEMs
         /rjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784300124; x=1784904924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ar+1Hu+PGKB3bctJhS4XtPd2fbL2DABSj6SyXwdhS78=;
        b=X2/K8Tqk+um76GIkeNUdMSu7XsKjirF9kkCMNH72MYSX8okPtubW2RMbXqWc/WdvdS
         Vmz971QCceLDJ0Am4dTfZqhCk1tRJglu6LtUpZBVObtLH92zZUq5heaShbMA5bZvefVW
         wGjwHNWT1O9a0U8YdImKX5bqfaERJza8CVcbXxbH+/dg6WgrXTTa6fqXgNbV10/PYxem
         ++6xhAu2baziZHIdaxB9CpeKVup7V2EIKk+1yR2/H6siSFS2/nmev/Jla4GVDDhpuj6H
         T7gYL8KPioWgE420Jy75+O/mfGIZpJk0lgWQNN8ME0fd96QGs7bg6js7cyL6BoS7IwUj
         kkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300124; x=1784904924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ar+1Hu+PGKB3bctJhS4XtPd2fbL2DABSj6SyXwdhS78=;
        b=lvRfhcW6SXQyci+FdIb+S2CCfazA/GTQ8Qm563bSBWl386O3DzCYjRqG55JhZK7ee0
         1u0IvEPFYfYBM3X72QCuzTZtBzi+SVMsOAOFRVU9MTT2cM3N/Xq+TXu+xlQlCFCN6yBz
         p0WSsVeEMEW5CPB58pmcAk33q+AE6C+AB0W171XlZ7eCcrJH0A1viP0SoXrdFqe+onco
         Fuml2qSQZUz512zxvz9vqlrAM/4iMkexNWR8jzBdy7qmy8p9BH7AGNutABasmAL8ecKO
         dvk2rvEkZyo0PqsS/dq/BGVIZEYyIk00Yf5juQY03lHh9Qf8jQUeISk8EWu+GAbQqRQd
         TrHw==
X-Forwarded-Encrypted: i=1; AHgh+RrG3k+u4S8G9DiFb6Ib4CUrkamB3Bm4RABC3petStHlMVfmQHw0x2sPQErGVPVJP8tC5seYIwax1UYc@vger.kernel.org
X-Gm-Message-State: AOJu0YyWI0ZcWkbN0VoQKx+1MZaj5p7x7qR6lnjCepDykWv2TB1trZQQ
	LY3dBhLUY6BFUHoel86tSwxky7zO1dr4OC9HQoBxxdgQ7/t9NY+P4xEl/HNYps1VMLkagi3fLmJ
	8Y/z5gyHqXYa8Oc7jiTK2p42FonG7uGw=
X-Gm-Gg: AfdE7clQxPRLwMiZwgzDVKCSjNhtMg/aWkaqLvP5cJpJ3lofRGLFwuxXY/n5f7bpNyr
	UkI3nXvuZLU5djTl1yyBAUySvxFTE9/i+9zwFb6RKMuxGY5TyDgujOEw0EdCPeWkAkUORzXH5S+
	juy7zjiLgNVKS2pH70y54ou3I2PhbYoLrjtyHR/iLoBo5oZCfGOvpjcZLDHKhVgi+CpXGGmdB0K
	8+Y38uUvlgRuT8W2xdrZV2Nz4xDKdXkfWF5VGMxW1pQzWacXpX7kqOUYOkHWnFOFiRtZj7rGJkm
	1KbmkwjR6dzyR8rEZzgTrNHqyO52WNInVfn++LUxUR4haSxhq3pkN+kE8sc=
X-Received: by 2002:a17:902:d4c9:b0:2ca:ecf6:9105 with SMTP id
 d9443c01a7336-2cf3485978amr26279085ad.1.1784300123950; Fri, 17 Jul 2026
 07:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716152933.6744-1-spasswolf@web.de>
In-Reply-To: <20260716152933.6744-1-spasswolf@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Jul 2026 10:55:11 -0400
X-Gm-Features: AUfX_mwnPugTm_pl4sjXfiipoM2X5NDIEbYMRhDvStaI7DQRbBnnWEYgh9sQs-I
Message-ID: <CADnq5_PEN=iuspWbQ9C3gJZ5qJVOLmJ5hrsi6FH0Dg2Y_u2mZQ@mail.gmail.com>
Subject: Re: warnings from validate_blend_mode_for_alpha_formats() in next-20260715
To: Bert Karwatzki <spasswolf@web.de>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
	"Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, Alex Hung <alex.hung@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	Leandro Ribeiro <leandro.ribeiro@collabora.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, 
	Jesse Zhang <jesse.zhang@amd.com>, Amber Lin <Amber.Lin@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Some display folks

On Fri, Jul 17, 2026 at 9:04=E2=80=AFAM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
> commit 860e748bddcc ("drm: ensure blend mode supported if pixel format wi=
th alpha exposed")
> introduces validate_blend_mode_for_alpha_formats() which prints warnings =
for amdpgu as
> amdgpu only set blend_mode_property for planes of type DRM_PLANE_TYPE_OVE=
RLAY. I tried to fix
> this by removing he (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY) check in =
amdgpu_dm_plane_init():
>
>         printk(KERN_INFO "%s: plane=3D%px plane->type=3D0x%x plane_cap=3D=
%px\n", __func__, plane, plane->type, plane_cap);
>         if (plane_cap)
>                 printk(KERN_INFO "%s: per_pixel_alpha =3D%u\n", __func__,=
 plane_cap->per_pixel_alpha);
>         if (plane_cap && plane_cap->per_pixel_alpha) {
>                 unsigned int blend_caps =3D BIT(DRM_MODE_BLEND_PIXEL_NONE=
) |
>                                           BIT(DRM_MODE_BLEND_PREMULTI) |
>                                           BIT(DRM_MODE_BLEND_COVERAGE);
>
>                 printk(KERN_INFO "%s: creating alpha and blend mode prope=
rties for plane %px\n", __func__, plane);
>                 drm_plane_create_alpha_property(plane);
>                 drm_plane_create_blend_mode_property(plane, blend_caps);
>         }
>
> But this does not completely silence the warnings becuase for planes of t=
ype DRM_PLANE_TYPE_CURSOR plane_cap is NULL.
> Is this a problem that should be fixed in amdgpu or is should validate_bl=
end_mode_for_alpha_formats() only be called
> for planes of certain types?
>
> Bert Karwatzki
>
