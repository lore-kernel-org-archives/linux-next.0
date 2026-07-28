Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE38135A53
	for <linux-next@vger.kernel.org>; Tue, 28 Jul 2026 00:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199920; cv=none; b=Fe5xBwsoOkK9pOWhmsKoFQ4NWs1wcvhrPh3M2nHF4eOTzhl/b4zjK0+/h5PvPcRFSn3v80eb1EdrvCfLR2tdSPzDxeP5ED/fgM6W6YwCOphFLigoxSypxbIJGk9Zmuzrc1+sstTAikwTZZA16dIvJb0BtyH9vtNPH5gxu7PqBos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199920; c=relaxed/simple;
	bh=Z5GRTOSO0S9G9u7VZF3YwLNRY4a8OnVa7f57JM8Jl3E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sNS721alkqul+aqU4u1YnrvXQwafwigqj/mZS8nmd7yGJ7b9+NEWkVtlPekHSmrHmn/3nTPzRKiqyo7i0BKh58VyQ+qp5u8//E4yVx45OFIxYxJQxMqCsNmHwrHy0zksm7AlEWblRZWm4Vz1JSvCNDjxciYmNw6pSGrYQQ4WdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izMqkOr5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izMqkOr5"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so29067261fa.3
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2026 17:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785199917; x=1785804717; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YyiWxM0l+pV+N+P60T/IcxD0yZfdk4dsxpPoSCJ6HvA=;
        b=izMqkOr5JFmy/U1v9D9OCEyK+91238U8oTepcOD0103u9VQqrDl4zdDFZCbDKsu5of
         a4M0bNkVRNws/F3rVejHqxHHvwtox4fcxDMOd9LZzUMtIv8JpxkZ44vY253xIeHqO+yY
         ovxH4lgLNPX+GqVu1y0pH0orLx9A/Li9PdJElxUm2ryWLVgrB+xXtEZyqrGLs0QW53Kt
         C+OzDFUm+KgVqhTlSkc/0y/W/6iUkQFA+Haeb6UjoUk1WkZs9oXrtvUBQfxPRRh7Vk08
         JoRGPyM1XEfrEoS43COSVUtuDGwR8bEQDDnEwnvBsc58pDzh1wBKH3YtLy8YnVKrDPyh
         srUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785199917; x=1785804717;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyiWxM0l+pV+N+P60T/IcxD0yZfdk4dsxpPoSCJ6HvA=;
        b=a+eKi30B1ZNfECNKnjFzoUPlFINE863Tnu/fr+EldvuY0VfdhywtwoHFh9JiGgsgnS
         jBsUF8GjpZIJbq+iVwIkzBne/8xB4Li4NJU0brWUEayGsFQdk505Hzqn71/kThitzBMb
         zsgXsndsTJa2cvGXkxOCCxKAIMGHUKoqn4ofdf6IRROey+mZxI5L67IgEbIKwUxNEWo5
         opDdPQIwl1UuAqY0UlcAZZ6Z11Ff4p+hU7i9P8q7iM750OkmlmsLrpvAhXC996ZG7y+m
         iz/kQfj7ywBX1U70RD1Qe6O2LiaVCOxuX+KGDiUbIbyGsdu4qtPV8mosmt8/cN1myETW
         vDIQ==
X-Gm-Message-State: AOJu0YxftsgKc33SNSVBa5GQRlxe4cVy2BwdHUGdSN7riskV+UszC4K6
	SIiaxwJwDp5o1/0e6b+YtPE8bt9Lib3PJBZKlyciKYBn+EPYhpkJI1in
X-Gm-Gg: AR+sD12dAHlya3JLNFjiT6BwxlGmUe1DMcX/Y/YzZ+qOhDA3Z/mnMMBuC85v/OLR8/4
	C7qqknH3bHNBifpTDu0wN9/XpDfYYdi9MlbFlEe2ETpnvscNLmWULhdQJU4hTgp1UU5Eyk6uA09
	IvDCKKIW1WIJJwwryqETbYV34e8VjGqC/RkiZOLXPS0WVpWtGIlmzf/ov5t8XBsp6UtVspz3qPw
	Iv7dGDhbu6n9ajYqeyg/l+h5BLu+9AC5fiDTfnhxA6RWHmvPhHOyyUp1humj9nmbJbn5rxxrzRZ
	eJ+mzioeV57POxLwPhyHLxtB9Wx9fET4I59VxwH5YPSHPLIk2Aw664oj+2fzxYMSn0ZVD3Urd8h
	MrTcgV0qKNCxO48eWQJXnGZLf17QOKzc53JLb02/2h/1q+8J/SK/xw4rPF2RdDPkvf8ffSRvo9/
	dxFdmDj75a8w+IMeaxitij
X-Received: by 2002:a05:6512:3407:b0:5b0:197b:9811 with SMTP id 2adb3069b0e04-5b2d023bef9mr31905e87.53.1785199916589;
        Mon, 27 Jul 2026 17:51:56 -0700 (PDT)
Received: from primary-ws.local ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be077c14sm1758822e87.1.2026.07.27.17.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:51:55 -0700 (PDT)
Message-ID: <ef1bc3d070c4156f1811c0c4a567ec98ac8fadaf.camel@gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix usage of DC_FPU_{BEGIN,END} with
 PREEMPT_RT
From: "mikhail.v.gavrilov@gmail.com" <mikhail.v.gavrilov@gmail.com>
To: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, "# = v7 . 1" <stable@vger.kernel.org>, Alex
 Deucher <alexander.deucher@amd.com>, Rafal Ostrowski
 <rafal.ostrowski@amd.com>, Mario Limonciello	 <mario.limonciello@amd.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,  Thomas Gleixner
 <tglx@linutronix.de>
Date: Tue, 28 Jul 2026 05:51:53 +0500
In-Reply-To: <20260727105059.75716-1-spasswolf@web.de>
References: <20260727105059.75716-1-spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.61.1 (3.61.1-3.fc45) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-07-27 at 12:50 +0200, Bert Karwatzki wrote:
> On PREEMPT_RT kernels kvzalloc_obj() can sleep because spin_lock is
> converted to rt_mutex. dc_create_plane_state() can be called while
> inside an FPU-guarded region, resuling in "scheduling while atomic"
> errors on PREEMPT_RT kernels.
> =C2=A0Fix this by calling kvzalloc_obj() with
> DC_RUN_WITH_PREEMPTION_ENABLED().
> Also fix the error path in dc_create_stream_for_sink().
>=20
> Fixes: 3539437f354b ("drm/amd/display: Move FPU Guards From DML To DC
> - Part 1")
> Link:
> https://lore.kernel.org/lkml/20260723123449.6494-1-spasswolf@web.de/
>=20
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
> =C2=A0drivers/gpu/drm/amd/display/dc/core/dc_stream.c=C2=A0 | 5 +++--
> =C2=A0drivers/gpu/drm/amd/display/dc/core/dc_surface.c | 4 ++--
> =C2=A02 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index dbc12640b01c..4ac835777b58 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -233,8 +233,9 @@ struct dc_stream_state
> *dc_create_stream_for_sink(
> =C2=A0
> =C2=A0fail:
> =C2=A0	if (stream) {
> -		kfree(stream->update_scratch);
> -		kfree(stream);
> +		if (stream->update_scratch)
> +			DC_RUN_WITH_PREEMPTION_ENABLED(kfree(stream-
> >update_scratch));
> +		DC_RUN_WITH_PREEMPTION_ENABLED(kfree(stream));
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
> b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
> index 88e825a6582c..d5c6427796b6 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
> @@ -85,8 +85,8 @@ uint8_t=C2=A0 dc_plane_get_pipe_mask(struct dc_state
> *dc_state, const struct dc_plane
> =C2=A0
> *********************************************************************
> *********/
> =C2=A0struct dc_plane_state *dc_create_plane_state(const struct dc *dc)
> =C2=A0{
> -	struct dc_plane_state *plane_state =3D
> kvzalloc_obj(*plane_state,
> -							=C2=A0
> GFP_ATOMIC);
> +	struct dc_plane_state *plane_state;
> +	DC_RUN_WITH_PREEMPTION_ENABLED(plane_state =3D
> kvzalloc_obj(*plane_state, GFP_ATOMIC));
> =C2=A0
> =C2=A0	if (NULL =3D=3D plane_state)
> =C2=A0		return NULL;

Hi Bert,

You may not be aware that the same allocation is already wrapped once,
at the dcn32 call site:

  183182235f6d ("drm/amd/display: Wrap DCN32 phantom-plane allocation
in DC_RUN_WITH_PREEMPTION_ENABLED")

That one only covers the dcn32 DML1 path, while your trace goes through
dcn401_validate_bandwidth() and dml21 - so wrapping the call site could
never have caught your case.  Which is a good argument for guarding the
allocation in the callee, as you do: dc_create_plane_state() is reached
from every DCN and both DML generations.

On dcn32 the two wraps now nest.  That is harmless, because
DC_RUN_WITH_PREEMPTION_ENABLED() is conditional on dc_is_fp_enabled():
once the outer instance has left the FPU region, the inner one expands
to a plain call.  But it does make the dcn32 wrap redundant, and I
think it should be dropped in a follow-up now that the allocation is
guarded in the callee.

One thing that may be worth adjusting in the commit message: this is
not only a PREEMPT_RT problem.  183182235f6d was needed on a plain non-
RT x86 kernel. There DC_FP_START() takes fpregs_lock(), which disables
local softirqs, and dc_plane_state is around 335 KiB, so kvzalloc_obj()
falls through to the vmalloc path and hits BUG_ON(in_interrupt()).  So
on RT any allocation inside the FPU region is illegal, while on non-RT
it is specifically the large ones - two failure modes, one root cause.

About the FPU register question raised by the review bot: as far as I
can see it applies to every existing user of
DC_RUN_WITH_PREEMPTION_ENABLED(), 183182235f6d included, so it looks
like a property of the macro rather than something your patch
introduces.  An answer from AMD on that would be useful either way.

I have dcn32 hardware here (RX 7900 XTX) and can test the patch on
non-RT if that helps.

--=20
Thanks,
Mikhail
