Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4AB3FC5DD
	for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693301; cv=none; b=SksU03zS5zzjFXG4OOqVoXy1+8D0KLgCk7dJY6HXHKBcgp8dF6dLR8lDu7yq7+Mx+HuiRvLlybbjhJkk3mrwlfT6OE2orfi1lacKPPMdoKp7WMNfX6A8ij6Blw6h3wz+ZI1TfsrtHbqDeZuUpo3CNnON4mv8pbu7j6zE3iAqvuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693301; c=relaxed/simple;
	bh=mh9a2Z7pFjZriVLIoAOGfQ3SYOOIiAwUd+FR41EgS4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbtYl3YNBnEBQBIndqDD5RlB2n4FB2Pf/+mC37W/cZm0l+aV/pZTmFQunXR3jeu+Tluh3+6WibdWcACs1tlpYyKTkftBAiDrAQx5y+XBOjBsNti1fphWB7UHrXDvS5fGSzSeyoPWKtFoXw8PVwTOS++OZtUC/4wTljDGY2oHjEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfkfUw7i; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfkfUw7i"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15d47266baso19242966b.3
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 14:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693298; x=1788298098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7kSIlJJ84PkNx03WFsQm+QKg/9aYj9/q0trDx0cIE8=;
        b=FfkfUw7iqfuA9bqH0rdJOlEYIXxT/XwRb723ocnykvl1HeEM14OokuQPLGlxgCyYFs
         /oYnN6Us19EPvEIjvE67soABVtSTPtzfLqQoygF0tG4nyXbau40fTfScpI4kcsB86HvG
         hs/931bkzSMENu7Gb5j/tOT2sYp/rOOgQMT/ZVObi/Pknlom/jU1mRerzo6KAc1EEKqX
         LwjeiTQB5nquhw07LLGs0b6Mo3IxsfnSw160MYAujmBT7RdlnWowLJmsFmP52z+iP0WZ
         LVoLz1l9+b2R9cgE8KMh4FUrBuRwOotPY9UcQC9jX8J4D1OyhItKF/Udw/Gstc0XSi2Q
         +HQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693298; x=1788298098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7kSIlJJ84PkNx03WFsQm+QKg/9aYj9/q0trDx0cIE8=;
        b=s0yuzZBwpuNK51AR1dHZjBqCJ16+JsWYxgwN/QQJKh8ImkZ/09EHpVQ4x7zQgrf52L
         dledOYzq1trG/nSUrtYjlL35H4Dq2NquDq1pGN7Ot824u73K/XeHpyTdUeyBH1pomO0Y
         nDmz/lsllKVfQrX7gZzXvU5LLBNF+GZQqU+msbSl2yGPG1Tmh4v6tdorkLiMgbm2WnvK
         vkl7n8I6HYMREntFIGTXCHnoEzb9IuxbFfuBrxHLBPS/M1BisMdFxk14ic4XNqO20DVe
         2av8Ce4ZPE+EvsT4vkK7PYV20btiijBdh8mFmwLeEgEobzaO7NLJYk0UkmSLcBXoxEbx
         vpBw==
X-Forwarded-Encrypted: i=1; AHgh+RoPoO2ZyCIGZrQtGJWAVuxSRK5ZFSCZw1MJdxsYUDhT/qb18pdX+AJ7yZahQw8SUYfhyo2H7ddSMSmG@vger.kernel.org
X-Gm-Message-State: AFuF++lZuQpBn+sNu4eeKUsLW82CWEMFItc28R+X2xEm9antQn1r0Mtx
	vTZKzxWpSaHlKaSGciT+vArWeIcM49XNytS++TUEf3QHoiCWkg66GKn1
X-Gm-Gg: AR+sD118IK7o7fZqAyS/Nz7GsNv+omxF7rlxXgtJoqmxipLuF5SBKV4Es8KW3HLcvq4
	cwdqdVY85s690CUsUmOqnqZsW9YB+mzRzYNYoSA8jir5ngyW2jXlQjX3vCUdLGCTSQUY2NpadUD
	Dn/Sosqb3RsyvpbweJwC9QQk8ekNVFmWSGFzyp7ZrzYldjtGryl5qOcxVNk30d7jiEPPIh8VtJf
	KFyHqX2pCz8ybRyE2SWQSb3hqacuAMwKxF+IbH755fqxsqV1JQIzcFhA7hDBFp6fFf/WFFT67US
	lA8BxJdp11J9/eQPZX/NFWHUc1u+OSvVS4x3FTa/JnUxqtaeoe2FDr5tnvzBSTjmOShYzlwxUo/
	eQdVvGHlrvkSldeT+dHhL01p83mD21KSZkUaYafs+5fPIFWExoV8+aUESNYFtSSu4j6/4NeAFup
	jXEKGQm0LvsX95udrRR2jeDk+2zKj22SNvyLbOqW2GUAjIyltep8S/g4UrQWuGuOpknkU8VHrOV
	4NKRop7fWIxCj7Ucvl4sUUT6q4SWh43i4WROqJO4D5yfFNVTBnO76nmdeBr
X-Received: by 2002:a17:907:e1d3:20b0:c25:d03:6794 with SMTP id a640c23a62f3a-c250d036dcdmr100923466b.16.1787693298421;
        Tue, 25 Aug 2026 14:28:18 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef4d2sm101774366b.59.2026.08.25.14.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:28:17 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: spasswolf@web.de,
	alexander.deucher@amd.com
Cc: regressions@lists.linux.dev,
	leandro.ribeiro@collabora.com,
	mwen@igalia.com,
	alex.hung@amd.com,
	mario.limonciello@amd.com,
	jesse.zhang@amd.com,
	Amber.Lin@amd.com,
	amd-gfx@lists.freedesktop.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: warnings from validate_blend_mode_for_alpha_formats() in next-20260715
Date: Wed, 26 Aug 2026 02:28:15 +0500
Message-ID: <20260825212815.48959-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716152933.6744-1-spasswolf@web.de>
References: <20260716152933.6744-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is not a linux-next-only issue any more: 860e748bddcc came in with the
drm-next pull of the 7.3 merge window, so it now warns on plain mainline. Here
it fires 16 times on every boot - 8 per GPU, on the 4 primary and 4 cursor
planes of each of the two cards in this machine:

  [PLANE:44:plane-0] pixel format with alpha exposed but blend mode not setup
  WARNING: drivers/gpu/drm/drm_mode_config.c:872 at drm_mode_config_validate+0xa16/0x13b0

I ran into it on 7.2.0-2709dd5ae32f, bisected it to 860e748bddcc and confirmed
by reverting that commit, before I found this thread. Hardware:
0000:03:00.0 Navi 31 (DCN 3.2) and 0000:0f:00.0 Raphael iGPU (DCN 3.1.5).

Nobody has put this on regzbot yet, so:

#regzbot introduced: 860e748bddcc
#regzbot title: drm: WARNING at drm_mode_config_validate() for planes exposing alpha without a blend mode property
#regzbot monitor: https://lore.kernel.org/all/20260813143605.106104-1-mwen@igalia.com/

Status as far as I can see it: Melissa Wen's v3 series (monitored above) fixes
amdgpu for both DCN and DCE, has Reviewed-by from Alex Hung and Tested-by from
Daniel Wheeler, and I tested it here too - the warnings are gone on both GPUs.
It is in neither linux-next nor amd-staging-drm-next so far. 271e90eb5f9f
("drm: use drm_warn() in validate_blend_mode_for_alpha_formats()") turns the
splat into a plain warning and went to drm-next on 2026-08-20 as part of
drm-misc-next-fixes-2026-08-20, but has not reached mainline either. Other
drivers are being fixed in separate threads (imx dcss, rockchip, vkms).

Since this was introduced during the 7.3 merge window, the fixes should land
in 7.3 rather than wait for the next one.

-- 
Thanks,
Mikhail
