Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BAD37647B
	for <linux-next@vger.kernel.org>; Sat,  1 Aug 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785579439; cv=pass; b=ECdu8/XTB8PKe/cd7yeo4vCvykwu0/oqjpege4Z6xgYmexL+CsqiAaWrppjekg5kd1AwmoiK1uvQ8xq2VkoLS8outhuMrtnpk15hw9qQ2a8K6V7zGWWW1JIAL7HTecpXzycYAKFdqhyd8oHfvmEwW5yEMlRqAljWbjgBpnyb5R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785579439; c=relaxed/simple;
	bh=fYuc91yYvMFDE6497qhGMtUAgZbd6nA0KxrauEEgHMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9JJYu4uH9Vd6crrC6gVcGC1OI5wGGnSux5mqd2jIQ4BY9lhpbS+OzH6H10mc1JXTQOZv1x7Vn5bQFP5ib95aZ1h6KRSUNGmeWPKSmAIgzzrnpuzfzFOGomY2Q9+33DWqBlB+LLFoJbbyV99KkLvfKhHEzZcii3sedsFa9161UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/3WkENd; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/3WkENd"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1615358a34.1
        for <linux-next@vger.kernel.org>; Sat, 01 Aug 2026 03:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785579437; cv=none;
        d=google.com; s=arc-20260327;
        b=Cy1C3iaOfmEtUfmkJyRSxwAkRJbq3nVd0zX+GGMGpSkigkXhXj7pGwEeoMc632l1Wx
         odu7ybXikFQFrb5AauWSJTVr4WNKnSNmn67hYoD9pL1G8GFSiLQu+U01irc18L6Wr+Re
         dPByJJwq15hA8Ce6IYmmHIQDmGaRW56mKe3STa4MbqLRnvQxZEvQnK4aQN+qz8on76sR
         XHV8ea7/m9wK+SWxgtWZ1s0X9/T5EWGv0TS7kAbNEZqN6WCJtfGaDnEvK66AWRjhweGg
         zVHyHZQTSf/Lh23sTEh5EJilWyUtVhbkGolk4b6z6SGVhb8EVk1itzHdTF/s4v5Fnf2Q
         1nUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6SVVCVf5N1O+YrNArJsl/K5UcjWXbA/FoyoLNaVP5k8=;
        fh=EpDOfpN2UjVbq9SeumFKnGfBIO0Zo7TfcPMFRNHsP7U=;
        b=d8wWDU4vHsUxua/jlqhHA4qB79z3/MhYS5yQsuP+fTEbnPMgRno3T/11TTGUixn4p+
         SqKlWUJR8tPV6hkYjpWoB6+LadpgNKYavybRPB3N6XDiSTmTFknJszWJoq2R8pOaFc4C
         fkdCkaXOXsVDpeSw/ur1MtTc9W2oDAJf+4+On4+8NVVzC/ZAbYcBGrNDkTSAq4Ryw6yo
         e+PMLq5Ehp/PKNhOY+ZqZB9IG3z5PazbrOH0Zn0jSQOCdhbByzeAnl4o1atcA+1ZiFDx
         ZgQCc3eBHKqeO9hdfn5d8IBjt9NVpTQJiQg/LdRawpYe2A2cb2yWQ9VFGi5IFEizNItQ
         lZIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785579437; x=1786184237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SVVCVf5N1O+YrNArJsl/K5UcjWXbA/FoyoLNaVP5k8=;
        b=N/3WkENd3AbGKSO5/TTgbLmZr4Z/KYTNfR6Ng94/L2l+W138hPbF2RLrkUJuRERrid
         1P4U2O4zd4UHjf5nn7ZayhLcKAfmF6KPd9MZBxwyw832Y5uHmLJncW9Yk/3y2TUF4Rvs
         1aQ28plPDQwCv2fdLnDtIyl7cVEnpeSRZpZK+iKUm18kH4jeGXql7surTmxxUBoEs44U
         JwyqQ6O92TLVOhL2CO7qZaxkil1ZNf1jYjq6Snf9691cGpe0suDv9ZP3KtnzwjluZeNm
         bU8DnrDWf8KVgByK/QII9KECNGtFUsi6w9Kz9w9JZtelNqPgSqiXiCako1vQ+NfTLlnx
         uLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785579437; x=1786184237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SVVCVf5N1O+YrNArJsl/K5UcjWXbA/FoyoLNaVP5k8=;
        b=IDOFl2J80AfrW0h0DmTeRLvvZxZhi1CTM+Z12bhuULhfAw66nSy7RABnCIlmtkRac2
         55buAXZdGpjCDbwY5vkYsfm1mYS7rq927/8c9j7PyV9UP7988A4Vowyv5t+iTcJ0TDUu
         OKhGQoY+GzRMCC1qSza5rp7YPu3onTdusOd9hBm8XicHA2s5GlhU4NxUYYiSUr9GmHhb
         SvBUSS6sJx4lWgthZ/gSj9lo33wP+zXunOT9J/5l5Rpw4dpwlsYqrb6tZBcBQGHTlav/
         lwwno0B394tvUllyxxMw6Uz65D+98KVFhuCTwlB+afR377UG8sPIYbk52Q8SacoN1N3A
         f5dQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrz7rz7TH3j9jLTGG1s+8VmyL3tKrEECI+K11bpy3n/PIXQfI4qmqOYdIsnbd4iErojSJCVz7gVEX5e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1eNi6YQykagHBk/9+rUZm3PC30BefkUjs8ofEJSRtKjNFofhy
	Arylhyn+Fo0HAs8jauhosQygYiqzrKJSRMrTTgrLYelgGt9mJH1plvvK2fAuJyMYV3xhfmi2yeB
	flOMwl+FLRbmq+rbhJRNc2V+moUiCGDw=
X-Gm-Gg: AR+sD11PCNor7k5DcNdrYbgIrdRJ2/rIX0TfWt2UnRXygmCL3BIbx2J0UybEmfZwTKc
	nodKMUsqr0EBHscWdxJi1klbAVoj77gavoCpKSNsDBODbxeeQVhyrB223Wk4Sh0D3i1vwljkUeK
	u2xO45J81FF+UE7UlNXpXabuLROmwsaCGEqVQPDhJOLmpx0+cqnJ8sQIaUsUOMmmxC7NQ4O/+qN
	JaGrP9wuwCwCk71vwKDNka7lzUjKbJ0MVX76rx1BBNA88Jt5+y6tRzQZVmNOtnmbTrYWdr0R1jZ
	x2W47VngnVDLE+b6n1drMYxbgJ/uDKxH4nBY06ZYFBobtg==
X-Received: by 2002:a05:6830:64c8:b0:7d9:7201:1acf with SMTP id
 46e09a7af769-7f196d407e0mr6475364a34.5.1785579436652; Sat, 01 Aug 2026
 03:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <df5f0d9bb8f11d098f086bd2ace5aa0cef4c77d7.camel@web.de> <20260801071724.12998-1-spasswolf@web.de>
In-Reply-To: <20260801071724.12998-1-spasswolf@web.de>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 1 Aug 2026 15:17:04 +0500
X-Gm-Features: AUfX_mySPDS1tX6sBksLt_ubqUTn6yupd7v5vPVdQi51p4TGShRSsHENrQ2zzec
Message-ID: <CABXGCsMFa25HyOdcSX8QR8_=58=uJT+HMVhyus=rOFHBML25=w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix usage of DC_FPU_{BEGIN,END} with PREEMPT_RT
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	"# = v7 . 1" <stable@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	Rafal Ostrowski <rafal.ostrowski@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 12:17=E2=80=AFPM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
> On PREEMPT_RT kernels kvzalloc_obj() can sleep because spin_lock is
> converted to rt_mutex. dc_create_plane_state() can be called while
> inside an FPU-guarded region, resuling in "scheduling while atomic"
> errors on PREEMPT_RT kernels.
>  Fix this by calling kvzalloc_obj() with DC_RUN_WITH_PREEMPTION_ENABLED()=
.
> Also fix the error path in dc_create_stream_for_sink().
>
> Fixes: 3539437f354b ("drm/amd/display: Move FPU Guards From DML To DC - P=
art 1")
> Link: https://lore.kernel.org/lkml/20260723123449.6494-1-spasswolf@web.de=
/
>
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c  | 2 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_surface.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gp=
u/drm/amd/display/dc/core/dc_stream.c
> index cdcf140bc1bb..accad9e20e88 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -229,7 +229,7 @@ struct dc_stream_state *dc_create_stream_for_sink(
>
>  fail:
>         if (stream)
> -               kfree(stream);
> +               DC_RUN_WITH_PREEMPTION_ENABLED(kfree(stream));
>
>         return NULL;
>  }
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c b/drivers/g=
pu/drm/amd/display/dc/core/dc_surface.c
> index 88e825a6582c..d5c6427796b6 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
> @@ -85,8 +85,8 @@ uint8_t  dc_plane_get_pipe_mask(struct dc_state *dc_sta=
te, const struct dc_plane
>   ***********************************************************************=
*******/
>  struct dc_plane_state *dc_create_plane_state(const struct dc *dc)
>  {
> -       struct dc_plane_state *plane_state =3D kvzalloc_obj(*plane_state,
> -                                                         GFP_ATOMIC);
> +       struct dc_plane_state *plane_state;
> +       DC_RUN_WITH_PREEMPTION_ENABLED(plane_state =3D kvzalloc_obj(*plan=
e_state, GFP_ATOMIC));


This hunk breaks the build when CONFIG_DRM_AMD_DC_FP=3Dn.

dc_surface.c gets DC_RUN_WITH_PREEMPTION_ENABLED only indirectly, via
dc.h -> dc_types.h -> os_types.h, and there the include is guarded:

#if defined(CONFIG_DRM_AMD_DC_FP)
#include "amdgpu_dm/dc_fpu.h"
#endif

With DC_FP=3Dn nothing defines the macro in that file.  dc_stream.c is not
affected because it includes dc_fpu.h directly.

This is not only exotic architectures: DRM_AMD_DC has

select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && \
!(CC_IS_CLANG && (ARM64 || LOONGARCH || RISCV))

so an arm64 clang build is enough.  On amd-staging-drm-next with your
patch applied:

  $ make LLVM=3D1 ARCH=3Darm64 allmodconfig
  $ make LLVM=3D1 ARCH=3Darm64 drivers/gpu/drm/amd/amdgpu/
  dc_surface.c:89:2: error: call to undeclared function
    'DC_RUN_WITH_PREEMPTION_ENABLED'; ISO C99 and later do not support
    implicit function declarations [-Wimplicit-function-declaration]
     89 |  DC_RUN_WITH_PREEMPTION_ENABLED(plane_state =3D
kvzalloc_obj(*plane_state, GFP_ATOMIC));

A plain x86_64 build (DC_FP=3Dy) is clean, which is presumably why it did
not show up for you.

Adding

#include "dc_fpu.h"

to dc_surface.c fixes it, and matches what dc_stream.c already does.
Please do not copy the local fallback that sits below that include in
dc_stream.c:

#if !defined(DC_RUN_WITH_PREEMPTION_ENABLED)
#define DC_RUN_WITH_PREEMPTION_ENABLED(code) code
#endif

It is dead code there - dc_fpu.h defines the macro in every branch - and
in a new file it would compile cleanly while quietly doing nothing.

One unrelated note: you kept Cc: stable # v7.1, but this version is
rebased onto next-20260729, where the update_scratch allocation is gone
from dc_create_stream_for_sink().  It does not apply to current mainline
either, so older trees will need a separate backport - worth saying so
in the commit message.

With the include added I can give this a Tested-by on dcn32 (RX 7900
XTX), which exercises the DML1 phantom-plane path rather than the dml21
one you hit.

--=20
Best Regards,
Mikhail Gavrilov.
