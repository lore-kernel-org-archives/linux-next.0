Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF76397959
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335989; cv=pass; b=reKQisTjfqS/zRmx9iDMSaakiDlakx5iMWg7wIECKbVgfibsn4Go6wI7dDdBoDucfhPBXhAtBgVNOo429gDj3mNYhM6KcJIiKxXDcy1hW2BFBA0KvHEYBypX0/STpWquQCa5XqaTkDI1gbCGH8mzPitBOJF1cVXSpCgdDuGR6zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335989; c=relaxed/simple;
	bh=cIN/nt4h44AlqFXT+2f3q6mTYeKxvBMsv8hKikFaCh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv52LQWZRq1sL8hqGlxktZd7QLtCluQj0T3rmExV4/EUiMAPlW+Ae1ZnMfedrHOckXCFwGspxIpL3hual/H6W7lK5z6iIX5silZyGkcD1YY4K0SrEyBi5lug1AV8bIGq7AaSy7phKtynbVyr796rX4+2Ho+v5ztT/HB8ACVD6Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyDovkPZ; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyDovkPZ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9ecd7216cso561859a34.3
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 07:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785335986; cv=none;
        d=google.com; s=arc-20260327;
        b=hClhJEZzKT3yUPGbjMf8+sjJdZNiadYIYnCYHDYzDEMz8g3EoJftUL3uEujiqNMa7u
         aWSwRht2sDHA9Yaw5GL1w/I7defVzUKLA6qtchicaba0bKtvjJkJtlAytQwPEL0Y8hK7
         vQoF2mcJ16CkAZExTNkBfkM86ewDG6qkKnGc4U5Tjz1HF11IyHI20rztQJ1PeP2K/cC9
         aKB42CkyLEjaj7rpWTYHKw/dVdzmjfXNqNV3OiIFx5oie9/L6ItDyICnn4Eg/dlHkm6t
         CFX3aUaDtlk4SQ0IgulJTWNrGsNLbsjQKL1IJh37rlvJeHSobtlM26WXvd6TObenudC2
         5uBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ACwil4Mp6DdzMJNs08XWd9fqP5I4E2mCoEaZK3FvK9U=;
        fh=+gh1nYZWcNWtaCt+b6fyWitTIYVj2uih4YzFS5YyTe4=;
        b=JypxlH50O/5F1lipetJBtAiwGbkQTfvfiXZTPrYpZ8GHdxNXAMtXvFDeFrqWOlf4+/
         u2o4n1hBkKVF2elz6b2Dvo52sZydN2qZSqA0DZj85Y8ZK0EUs3uJTDS/QRhb1kk+UG5A
         /b01ehmDqOVOw/mmokOrnmDRWKo7z7LOg6+UkuBy5JrCNhcy0wclw4EysSOyZ7HS/syy
         pJDqLkjSI/bJ0pznEu/ZTPclNo7YJtNvx4/unsXNLeolP0m9uS2jQ2H6TdNpZ4dcWFn0
         kmI861Cdr+p3JiWr5Xa9F33qWRmDZNr/I/oZJlbi1gGG0ZZBBv4p264380WOZfHDKByn
         sX5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785335986; x=1785940786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ACwil4Mp6DdzMJNs08XWd9fqP5I4E2mCoEaZK3FvK9U=;
        b=KyDovkPZtY1DM8adNsWhuvKeuy34HueE0D5IimLZtqCUEHF79OcDlOZSUqzM/PDh0Y
         DGAGtn6WPAzPfMtU/2M9UQZZtjzqj8aoBpSylmkeTnHAZWv/rTWWakaN6LUeTL0M5TCK
         wHbJ/0ldRqYNf61XvZMXFEUU2CP1nQYyWLDBB5DVwY/9FdOHATo3QfhhAdOGHhkcMiQX
         gNyIBPG+WvEOzqgG3/jYgyP1bu3O/8kyEmcSHFA1sIV2+FPvEYwrKLhChrEs41N9mz1q
         0Q0aqB58ofALzL9TMpIBH+S0HLX88EEBM24AICzTLYyW0XDQDsfe3bkjbnHNNROe7BYw
         dFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785335986; x=1785940786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACwil4Mp6DdzMJNs08XWd9fqP5I4E2mCoEaZK3FvK9U=;
        b=nTyxcDhSLdDuKBXQ9NhI4bcFPhuxOf335YQfdrjQAEDjpNRphOQmmpnQBLV1lyjGKX
         XL1DbCPVa5KNBvbLYqWlm7PpkcJsrr0YptHAxdQAaWDcQ/REm3X0Gq0H2nRdLE+NlH3H
         RW2j4deytdItjed9YGxH/958A2e54YWvhdqUBCAl7EtOKcgf1icWKbDG9EyJ/dqMJEcp
         p7MORnMzOd4MsYXR6qJNeoFNZZf67a0e5MIgrRbuhgJH6WARo/jKShYnpT9crtQwO5o2
         ltWcPt0G/CyGPKzxNgZ/hL2sXz16ZKiTb5WRqYDnQGKaT0GMxhQz6xyKhJPF6GvGXRp5
         XuvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLvXliqzjoAcbJ2kYAGpcjC2qT69Xw483hSFdtEtwjENb/BJBzhzZfuF4QePwRx4xXq7lrnaNZCPEp@vger.kernel.org
X-Gm-Message-State: AOJu0YyGtQhEa34Cy+0aAcUhSwRZnukOSGxOtUJ6lNAQl0o4kn2mdClB
	flqYCeNyivXBu0qeGAwBkXHcbxYN46x9ulLrQbGFWnjo6xIITYUwATbHoQlykTaCziHip/UyPzl
	7jlu3jK0Nek005laSxXeUqFHhjjx0Q/I=
X-Gm-Gg: AR+sD13Veq8736SIMQZqluOLLPRSzQPYwISWQbLKRVKoeQQ+F8oD6vet335ACc3d5im
	TN7ZdRGdh5vROBdNo9gTSUG8LGOmmAQwbU4duyW9dT3OBAUW4YYICHF0J0+vAP+9whKBnNZI63c
	b0TpfRu/JQ/2gxDtDE5E/Q5cdtxBGDeGBRGwxbthS/MSd+vB+1eqoZfwB+zglFLyU7ibdw2VCeA
	zF2aKAfJLDO/KxmV8X3G7F8Nbs75aeDt+FGLzeFQf+MaE50yn3hAKIOArpsuYtg35oGPgyw/EfQ
	h4VYz1JeFQ8NScoakD4u+CDZRul+YlsghDqqbEz4fIpYvI0=
X-Received: by 2002:a05:6830:2696:b0:7e9:b673:cbef with SMTP id
 46e09a7af769-7efff25f6bdmr3854282a34.17.1785335986490; Wed, 29 Jul 2026
 07:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727105059.75716-1-spasswolf@web.de> <ef1bc3d070c4156f1811c0c4a567ec98ac8fadaf.camel@gmail.com>
 <1ead313022bc62dce1f42af9f855727eb9074443.camel@web.de>
In-Reply-To: <1ead313022bc62dce1f42af9f855727eb9074443.camel@web.de>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 29 Jul 2026 19:39:34 +0500
X-Gm-Features: AUfX_mwXyEa-LkEfVk4HaieHl5UbmaG7Jg2hW7wYSg6MeyPwuqLhhMt1G3fmyMg
Message-ID: <CABXGCsONHe2ST-==Gso2748i7W_POPiUAF2MrrmTuqoQr7z3gg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix usage of DC_FPU_{BEGIN,END} with PREEMPT_RT
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	"# = v7 . 1" <stable@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	Rafal Ostrowski <rafal.ostrowski@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 5:36=E2=80=AFPM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
> I did try a different approach, using DC_RUN_WITH_PREEMPTION_ENABLED furt=
her
> upward in the calltrace (This would have the slight benefit of more code
> running with preemption enabled). This does not work because dml21_utils.=
c is compiled
> as a _LINUX_FPU_COMPILATION_UNIT, so DC_RUN_WITH_PREEMPTION_ENABLED does =
nothing.

Confirmed, and the chain is worth spelling out because it is not obvious
from the call site:

  Makefile:1127:      CC_FLAGS_FPU +=3D -D_LINUX_FPU_COMPILATION_UNIT
  dc/dml2_0/Makefile: applies $(CC_FLAGS_FPU) to every object under
                      dc/dml2_0/ ("Add FPU flags to all dml2 files by
                      default")

so both files you tried are built with -D_LINUX_FPU_COMPILATION_UNIT,
and in that branch of dc_fpu.h the macro is:

  #define DC_RUN_WITH_PREEMPTION_ENABLED(code) code

What I think is the real problem here: in the same branch DC_FP_START()
and DC_FP_END() are defined as BUILD_BUG(), so misusing those inside an
FPU compilation unit fails the build.  DC_RUN_WITH_PREEMPTION_ENABLED()
silently degrades to a plain call instead.  It compiles cleanly, looks
correct on review, and does nothing - which is exactly the trap you just
walked into.  Making it BUILD_BUG() as well would turn that into a
compile error.  I can send that as a separate patch if AMD agrees it is
the right direction.

This also explains the asymmetry with 183182235f6d: dc/resource/dcn32/
does not get the FPU flags, so the call-site wrap there expands to the
real thing, while the equivalent wrap in the dml21 path would have been
a no-op.  Another reason to guard the allocation in the callee, as your
patch does.

--=20
Thanks,
Mikhail
