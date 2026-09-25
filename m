Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2862044780F
	for <linux-next@vger.kernel.org>; Fri, 25 Sep 2026 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364118; cv=pass; b=YyvPUg7YXNuRuAm3ywSURR9JKvSqQXEBk+o0PAPWLpyw+IgfH6c2kVI/gsj5Y1ysaiuKMm5UrrpQwTAaGuMsdyAe+YWAt0ph/05zULvrV7MCaASoekz0foP7y40fCFe4YnyOgytH8olwnKEd3imQI5oL+paa6bYvi2Kj/T1sM0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364118; c=relaxed/simple;
	bh=0IW1K39bUjbjXvWSvmmWacltjkQtUrZ5RcAt6MAY8Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HgGkoImZDtK74FY1yQ6HTKL4BXRBwHsGbciO9wDaE30O9na3XVXp4Vy/Q0HPuo5mqUwdhLxD9d07bCSe1pLF+oqSZP65HpEZ8AsSj2hHN1HyMMrN2VJmmRahujQq4LEAIGXyU45Qc+QeZhYPiEnYd4/lHTwKZ5GYeNzMXPQNoDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su7K64Kt; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su7K64Kt"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so112012eec.3
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2026 12:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790364116; cv=none;
        d=google.com; s=arc-20260327;
        b=lxk9t50teg01W+2ixulcQpCVwsbHToS68NDKeDgfRWQBazrMc1o9B12gjoq8sUkA+M
         fTAsTxmSU2fythAcxE1mk5MFNSHZfqytBsQeofsrOWbjxGbrilW+zvOPEEfHenOCkzeP
         725hNHPq3K38QzsPLc1CusnXvT4FEYocDckdxl0lzyow620LcE0zdsExDdzlof+n/rMo
         LiRtEApsZQj72XEisTsj2KbZQLXuiaSHhAdGyylEjz6fgdodKhnXktoq0Dn/ScX+ry0O
         Q9Cym6izU/Rn1wnnmaSn90rRlK/sP28bz4UFc9gV9KrgHthsDtqylLp+IdDpfBmbkNfW
         a4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
        fh=jZIzzHeqK+k4ls/ghHMklvzAt+avd0UMaMN/3lHGxcE=;
        b=lsay5g06aP3kj/R2cJaJYtaqDXf6J2MKaJTcJBL/IEIRgbWuJyipuLz6eOcu3bomIN
         Ky9je2mUkyyabMeIcwC5DpF2zWvWkQPa0H1WysL/cmo4TID6zpAtS0AcbCU+bXBj1e8Y
         DrnlOP0hZAjianzr45BIYnVavb/bPbTOJ2qAxWlX5XGDBMzchYtym4TfmENfU0ASsOzu
         uNmZpwrn/pKiI1OC45yEc0MD5HzwYaT1iQvDnA47QM//Joy2b74fXBSESXRkZ+X3QO97
         y+B1ucSti4g2KnrnsSHZFMnpvkuUhyXobZHKQ5XDnDGDJMHB/lewLDCQKhgHWYxbyEuL
         Bldg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364116; x=1790968916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
        b=Su7K64KtEWJvyMYzOgNqZARFa7wmIcFCvwHtBdoIRMEvp45LR30yD74r7mEcoOpUMM
         4QwErxaBmjHajexpLObneQpXipqVAiVhyS81p4XbYTE6N8WrpEf7FrWfw6TFpqt+8wWK
         XTGlmCYY5gY7DVzTH7v3qz7N7cpvgVqYxvET0mlJk2MBN+1YO+JFAEkXFwIyfSBOvzzV
         c6N475NYffhyKXAJEkYS/OJT5TKYE98re2C2v+Wf+zAbqq6pWIjbgGuO2xrPGplPL9LX
         aN83RmJlprSyuqTN4WpB63AesYdH+I4Dp0UTpHXJF2zgpva+gbV9oPb6isOhZtYy8CTP
         tRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364116; x=1790968916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
        b=CvXH6ogb+9eDhMPDgwxDpyqkKrCerfMyKLGB8Oq3CTRinmbkUBr2aVw3/5yVvFUWxW
         /LShzD88Ypq26KXsTloU/Xq3OI/wBPyEtqOa7un9zIwTzkPY3K3VIoBRXseTpnYtzd7Y
         Xe/4S/kFQN/vjh/CGlxCO6KEJHHXcsaghXJNR/bFL5KBhA14nxdxr5UHlTSgTxkBjnXL
         ZsbAXb4yEYkhLnssPnreNpHF15btGiPuMZAXxsygD1zgbqTFxJ8+NuL+tNDFtnRBQJBk
         95Ose4bWgKl4TruEmCPHFiSTHY+WSRB6fD+CchOpVy0nD5Jz88p7F5gS/abK2kPGmXSc
         bHSg==
X-Forwarded-Encrypted: i=1; AKwUvBwJH4E4vdVIN6LdvvcPbOhlFfJ81tP8E2SwS74asT0Mk2F2BetGyBajO9jgeBRTtG4/xgBhaeMnPk5g@vger.kernel.org
X-Gm-Message-State: AFuF++ndE4TMwI4o7OBgZz7fMudhYxZcc3/7m37laf0P4uAuYdI8melc
	+u/sSnP7pALYOVvJ/7BAxmMh/9zP4SNT7P26Kt2ShmtdEuj8YRaen1zXy5LGdmQLb9cuItyTL0N
	34Tzmw+X42XIQyFS1VxVHh4tPGFHt/JA=
X-Gm-Gg: AYBFou2MyqXPpmMAVf7FBhbgEL/Vlt5D7nfOBRAipymlQP+XpH7jQlF6iBmicXk60Rq
	wHmeCf7csoJIIZX79QluKl3/8OxFOWVhnvJ1kmvhqTkVCGxsu2catXOnkyMfbfhTRg8zNo3F/xd
	UrcHIqctdvNRvpmh8zW4YgOu1MtlxbId1P/cMsISekoOcpGKLR3q2Hr48bqZH3J7kY08RtbpBXN
	Z4wCaHtpus+miZtary21EWMl807kMwWSXQUIvrA0jZ+gojpc+11wiBGDBQA56Q9QSqdgLhsiM+6
	aXGzxjNXJzW6zWw5sdhpJNT09sRMeL8q0izqiqz40ZUuPge/3PqCj4CtLOAV50/K1rcMnqsXOH5
	b6ekPsr8m9BvpF0eLzMJJ7jzrPVTaSETG3NLgdW6Spw==
X-Received: by 2002:a05:701b:451c:10b0:143:8212:a43 with SMTP id
 a92af1059eb24-146cf7ee027mr1494267c88.1.1790364115701; Fri, 25 Sep 2026
 12:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk> <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk> <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
 <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
In-Reply-To: <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2026 15:21:43 -0400
X-Gm-Features: AclHuK8jFToXH3081DCxGG9Esr9QUklLHKbLHdj7sbwsGE6fMm6o6HW2DqiJZHQ
Message-ID: <CADnq5_M0uB6uRvQh3jEZGVEFqmU0wp_w=wmsipXqz=Nq5QZwhg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 1:03=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Sep 24, 2026 at 01:01:15PM -0400, Alex Deucher wrote:
> > On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > I'm still seeing at least:
>
> > Does this patch fix it?
> > https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1
>
> It seems everything built fine today, I'll try dropping the workaround
> commits for Monday.  The drm and drm-misc trees are still failing due to
> the original issue.  Thanks for getting things sorted.

Thanks.  I've sent Dave and Simona a PR with the fixes so as soon as
that gets merged into drm-next, this should be resolved.

Alex
