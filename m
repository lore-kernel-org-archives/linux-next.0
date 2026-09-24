Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A5C223DC6
	for <linux-next@vger.kernel.org>; Thu, 24 Sep 2026 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269290; cv=pass; b=EiCPlT4KVUMBSlrqYQvRX7g4RKjmAJBDhvmM4mDTeCuQfiIUd033emGfvZ5FMIzg2tHJRQTkkA2+op6Cy3SiA2JW52gYFl4LSSYE0P9G2p4q2ZHROY4rgp+amc3orcvPI3b8vwdysZE0JDwaTqe6vDKe2kB80dp5mRjYEL3byNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269290; c=relaxed/simple;
	bh=FYlHjbstV5Sd9Herez9JRdAceBTSbQU0R6HQ6b+oRbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dq9SdQVPuKJHPPlTcNPYAt61AnE2mT0wh4sbdbkRNsmYIvCWM9gIPDG8qUahhOoGvMRn+63w4gS7w3u7qntbKaaCl9iXcjS4Ea7CQj+MEV9uBcyiIMJCxwKliY/8B/4BOfKDwUU4xsDY+7sXYe55qwuVTka2tj9GypQXG8mrGQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I68gZQU2; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I68gZQU2"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7abbacf286aso2327137.1
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2026 10:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790269288; cv=none;
        d=google.com; s=arc-20260327;
        b=nXmEi4po/WZXVInOZzSVynoj5i/Ct3l3SD7uhDdLlZzg/HFEyTCREaokFEo8H1vwFF
         fNQmIXuff8REDaww2tb71guDLbDQcCm8CuvZguDfDVzYGF4IcnwqyEr+5tVUHzvVuvvG
         f6FC9DQn2YgVTueD/qMPfsU+8D8AxGnD0d4NncfSDIKaSYth7H7NMiE3W3qJ9ECVSSSm
         ZqPo2n5fIBvbkN55CEO5BjXtyWSVCtVTMGfj5+Yf9G3aRTE9eh711VVsgQ0Z6J2owaXO
         vq5444srbp1QbkBDMCA7aWbvnOoTYK0BrKWFtA2LTZYZpZBlGVlT/rs1p6GPJzEak3f+
         pp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
        fh=GSSMHptRffhhOx+7rc0SaTuhr+FLvNvM9qE7G/dHY3c=;
        b=c7EM2qNo56uqPC8Vb+0uo3ecd/CfSudx16X1AgFG0f7N0fgI2KMjCQ/c6IMNpVa6nH
         ybrQiMgxpaXrpqdAd9Zo0EechNByxk9skOuwg7+5G6u29+aDqFq5/ZG46z/HDoNB5Hxo
         JnLBrJApWdiBUEQVsdIDQYP9W26UvG7jQd54DNBIf715pLRCNtbdGOefMrKDoSG7qyW6
         FZ9gk0uAJ20f7Tv8N3zRpp7jBBYZavcQfXuoFibzmAzu0We4dTCIZQ02/cms4N7UDd4L
         RweYJ19GhtAmrPMMSsHB6+QBjyCPuTabrd5MpS7p92AGF6gQROd7Kaz8d5xe5efJSrmP
         U8vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790269288; x=1790874088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
        b=I68gZQU2IZh/BtaSGpvz0V2JvqUNmdfpmWiJfEFF6dhljaWyK0NebdIYzSr8qi2oXt
         H1VMD2FfO3zH+k+qsGcxDuokr/0e44kL8gTf+eviqn7KYNTQ9wyjkVjS171ADpBVVHtx
         nBQUJOGJ7sD/Qll02HxeUexy4A4BeSzHMUk6d6ptDpTA8n5rV7t13nvyIChVEstlZ1/P
         OuBrUOo2ZBLFe/3XiuhyY1VvjnYaKlPscwFdhCPw6dKwSqndtNnf0wULMNo/tu6OaKHu
         tZokNf0QlfnTPIqjgZqzaUdaXcHX0mnV90SARFJF2pEz0jg1kddzNsYi1bU5C0DQheiO
         b+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269288; x=1790874088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
        b=MRcmK7g/XgIV2BpicnEimyki+3wwMmSoUSnD+QtTTjZkdf+exJBygcyYRz8pd+N9DR
         13RYfNF0lgzIuvN19hCRIihGY0IOwHzz3bifR5aAOfazjelc4Xj6OVxQEzR4Ak70pzCF
         cu/6l0e0XYocq6h0kcc0P+rz//d3yxrnRYOBgZjwj1FW1X2mOKxhmqlq9h8W5K7T/0p6
         94Wb03aCA3/HSUei3xYjRv42DjP1JqunaE9oIhwBZKE2b7rrIIJl2TnaAOhMJtJ3DkTJ
         7i/KMSCYQFNivyPXDLama5UFfOq2lhJkEIDs1YrxwsnyMhitv3ngAqA4wOf+KGNMVDYA
         oKIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfAFpiXHZFzKADs33cP2HpJF2trKiHsgFKL/rMunNxm0AKkKPeo5HUGm/0rmUUa9Ip5XEA4zDnRfKr@vger.kernel.org
X-Gm-Message-State: AFuF++nGwQx/rEMIR59hbk5yVBG2RUOQhtlhiJZeVf13M8YIK0Xn88pf
	SreJL4vjjBcpq9btBiAhVFvEiQi0LSM4dqo01wi1JVvrNmdvWWmg6bPH+7NUZXprjlgUl+vjjAl
	fmPHSYYz7vdqKlAzM7WFrikwGzRFv45k=
X-Gm-Gg: AYBFou3sHt58mjNkZ6tRXXMEUOw86y4VOTPryD49a04kCqX5XDRKugj0o4muTdgHLp0
	U0e3NiSTDFKdfBZ6T9P6rhAW8CF3fpVFtpWuGleZCIYFkbueDJIjct7SN/HoJg14sjGGjccvUrP
	i78r/LxUWp2wtg20v+dC4jyVIF7hP2p6mpr20hZu+OmOuhT9z5zwQSQPuQsSjwvM3K9bYNjtXv1
	bv1mRAU7//fyZ14PjZQiRznquEsKqT438kmi9lU3qrytBHEYm7XaKg3jHJh94U8czhZkAQ1zaMa
	+bqnwtex7Vr4mSytaIpnPMw59z7yO82VYWu2Nc9hPc67miF6zaSntOOnd5L7MEFmhCO2bZO+oXi
	Sn/NPgnRpqOuwrErScyEb7W3pka3xa6KagGsDqNd2bUs=
X-Received: by 2002:a05:6102:41a6:b0:7af:8089:2732 with SMTP id
 ada2fe7eead31-7b081f90cc0mr199413137.1.1790269288232; Thu, 24 Sep 2026
 10:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk> <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
In-Reply-To: <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Sep 2026 13:01:15 -0400
X-Gm-Features: AclHuK8HFMIivaONWoB38lW5QaLLooQ-XLkF8rwfu_UiMAlST0T85q6tMsApcAo
Message-ID: <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 23, 2026 at 05:57:24PM -0400, Alex Deucher wrote:
>
> > Your reports are valuable and we always take them seriously even if I
> > don't reply as quickly as I should.  For the issues at hand they
> > should all be fixed with the following patches:
>
> > https://patchwork.freedesktop.org/patch/755725/?series=3D174828&rev=3D1
> > https://patchwork.freedesktop.org/patch/755741/?series=3D174834&rev=3D1
> > https://patchwork.freedesktop.org/patch/755769/?series=3D172614&rev=3D2
>
> > I'll push a new -next branch with those fixes later today.
>
> I'm still seeing at least:
>
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn30/display_mode_vba_30.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn30/display_mode_vba_30.c:6666:1: error: the frame size of 2064 bytes=
 is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  6666 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn31/display_mode_vba_31.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn31/display_mode_vba_31.c:7460:1: error: the frame size of 2128 bytes=
 is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  7460 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn32/display_mode_vba_util_32.c: In function =E2=80=98dml32_UseMinimum=
DCFCLK=E2=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn32/display_mode_vba_util_32.c:3278:1: error: the frame size of 2176 =
bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  3278 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn314/display_mode_vba_314.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn314/display_mode_vba_314.c:7546:1: error: the frame size of 2128 byt=
es is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  7546 | }
>       | ^
> cc1: all warnings being treated as errors
> make[7]: *** [/home/broonie/git/next/sfr/next/scripts/Makefile.build:290:=
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_3=
2.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml2_0/display_mode_core.c: In function =E2=80=98dml_prefetch_check=E2=80=
=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml2_0/display_mode_core.c:6821:1: error: the frame size of 2160 bytes is l=
arger than 2056 bytes [-Werror=3Dframe-larger-than=3D]
>  6821 | }
>       | ^

Does this patch fix it?
https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1

Alex

>
> after merging amdgpu today, note that this is in the -next merge and not
> just the amdgpu tree in isolation.  I am currently holding drm and
> drm-misc at next-20260921, there is a conflict with the old version of
> them though that was just comments but they'll be in the history at the
> point I'm building so possibly whatever git did with the merge is
> causing issues.
>
> Any fixes will also need to propagate into drm and drm-misc.>
> I'm also still carrying a build fix marking the display KUnit tests as
> BROKEN due to the issues with the conflicting changes with drm-misc
> which several people have noticed, for example there's this from Arnd
> last week:
>
>    https://lore.kernel.org/r/20260915201006.3526945-1-arnd@kernel.org
>
> None of the mails I saw about that or the issues resulting from my
> mismerge got any response either.
