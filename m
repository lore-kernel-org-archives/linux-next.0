Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAE144604F
	for <linux-next@vger.kernel.org>; Fri, 25 Sep 2026 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366251; cv=pass; b=t8pRMZateHxBj7tpWd7s42yMcAgTpCYzh3zqmPaLy9J/y05ytpdHGfGqc1PcrkE2TeZ6aHpX3aorj1D1WyU7R3id3NgIT6c2Har90jWunZ1PjEJfIvknt/NJeZR8uKz5iHGinVnhSn1HoVMtP2GzlUOjhtBWKU95K5mVWDaXznc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366251; c=relaxed/simple;
	bh=EbQc/3HuMtKunmaCZG2UIb1wv+yZz9+14uXP/YSc3Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYAQyGV4byDyTnmJa90vLR5e0ruSsXr2shv3RQk3d3cHksV++brzxKiekqhrh2vWfgBobLdPtm6R9fejpW9aUk8FnsebVAnKUgMc/36gU7hnWzbAqCVrzJLbdEmNbdI/aPWUmnOrDh8R+94WUBLdgrsGFTP7i4pdIzL52KibRVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pREJPKoQ; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pREJPKoQ"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso147954eec.0
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2026 12:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790366249; cv=none;
        d=google.com; s=arc-20260327;
        b=pCBikoZ5stHnpX+bpGwoP3PYFXv+m+EpXLZWHB0s0ol3FB+mOCCdoX0bl1RAxg8/Eu
         iYhZDHK2gaC68WX9R8qNBOzhAJ+Q0U1X0zlofBbjf/Ja5TqlyX3Vb+QEH4d+CGL0zpRn
         99zR+Sz2nNyQpRxtdkQ8uIow2gL9xjpZWfEvugFlAEkK1Wdrm+X0/zr8bZBJ4NdI9LwM
         1tqTp+k85+3NYAN21BQM7JftI8VzEzrkezclKGpej7at+HXpe0cB/nBx6uOoC4dQDlV3
         voQD1iMiDqA1vNkf4SSCvuPbmwxryEKGrHkHomtvZgwjM0Gi2ZMp5Elsj0JE0+hwuU3F
         hjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
        fh=aFDgvajZxLNJUKkcAIkk0JOpML3N8qzyoPp3qxa0RrI=;
        b=mOt/JuSvUKBKeZJ7HwMQyNKA2iiZK1saXx4nNhOD4sexQClFrxQUcn/gDgIkclBptO
         9BIKVsF8vHjh9H9RF85hwadgWAdTERFnWwINAsyo1mfeubPjlAwhrhTKBFxOc0yfQn+Q
         BuBiJlvJIp/JRgkXEWMZ5nhn8McJZBKHz3M4O0K8ZDLCtqcOWhtIGx6MFkUIlNZVbcv3
         x1f66U2HSCRj5IlrkeyurmTQK3TA4OogXClZcrB9I6Is2FxAGBhwTYWEcrSRApHvrKWT
         YdYXX4VhlWAzvgj5RFd/FCf06mZUxa/HwR6NmoWHLEbtTkACLIwjhyyeqSVVglPhH02w
         DQLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790366249; x=1790971049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
        b=pREJPKoQHWprmNNooo5CUCnKuH/+xq8i/UxuZvPQTabNxDDayHFZh931NsJrUQ+ZHv
         LxvUQSF8Ne06mpfIWHMPcRhN8uE2j1ra5JrjHUDcoReKyGAVSX/TPx1t2ROQptxPEzLU
         GfEPkQHOg01/zW1sCEcDgZbOwvD9LNYrazZnLqdNcAhaHAdN1h33yGZTxNEvDlCsohBh
         jrIEXtT7v9m3zqeNBt6aN/BmgSxuq/wphzWnlEvrvxSuhmBYEYm9LOkufSABY913BShg
         lalTTWlO8p0gQIy+XyKkMCChBqrmDa4773wdmlQ1Mo2HiXXsp9hHmvi9pBG5x2XuqsJu
         dKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366249; x=1790971049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axs1kPa4bc+XIuL0qGjxc7cQcq1kYY+Dg4E5A6x9s3s=;
        b=Ahw0r5ugMSKylx8WLCR6sowWUQNdFyVP7k9jWo91Ep/Bm/4XWUWEcvE4wX+VMIOsys
         XG3ArW9HlRuw7hqV9jj6Ve9L6c5Kux7ZpzFbUsgDmfGQpDQMp1DyULo7pRZpN+btWPc4
         /kezutgI6+P9pE33dzHuHIh33XYObya2vSkSSZKH6NyE+ibMmvygRzMqWPe6glfjhKEE
         AMMonC51+LLGzx67W8PiLzvG8txZbgZja6RvfZunCrESEtiBOngrowAB2iFCX92AVXv1
         Qd1XJym8Pugc3RmZaEBQgNNkWy8sR5Hef/w07VZBo2YBm7lE5V9sl9FwtO+HcznxgeZf
         osCg==
X-Forwarded-Encrypted: i=1; AKwUvBwH31x+qbqk5f9h4+iAMNZTx+RIZ6nt+Jsc35YyH4z2/aWKwp8NIv6IN3utcpYAOuaZXBj8CHpEPTDs@vger.kernel.org
X-Gm-Message-State: AFuF++mRVEV4rkmkNrbL2vGIrk3ARVH6fAzN7fa6pn+srS4m2gIigV8v
	xlvEMy6+ZoBjqHNeDu5ifw2EDzOW1N3jGgt9b+AUwJKA4Pj2DL8c4WTZ4Yh9tpnULx60MqylgVo
	p8EYOv3NXTRWdKvg3kCTC392pGzTLlbQ=
X-Gm-Gg: AYBFou24wa+cPM/1+9cmsK/t54y8kosU8UxxtGx1BOIVCJnNxGk7Eo4GEctlIzSrtAU
	ATG92V2FnZksaJrKK9mZw4NWmuR51cX9DPfe2T/2e9tEiFsID4Kjq3mIJCkKTUuwIt5CwDmaXqC
	mnsZLhQn06+Se0lTixiLgQTls9Gqp2gK/rPJT4bQY/K07Kg4M1/24dO9Mb87/cMW2Ir/sRcaolx
	kuL3itHup6oy9yFO+n3Nek0+UwrBkXqfN66kYCBaofhH+StSAz66Jj3OlZ5WMOnyDK3Y5L7pwAY
	fZ+JQVNmBN8SGlRf3stFtAb1Btb6tf1zQhhJdxV6porPntCq8+oVmFNsAb4mWPSIgwal4WwFI2G
	tVUrbSLciRTxP+vc5lpWpPGzVEIEnSDf4TqtIf7NCiQ==
X-Received: by 2002:a05:7022:3c0f:b0:13e:5a51:148c with SMTP id
 a92af1059eb24-146cb31161fmr1265733c88.0.1790366249147; Fri, 25 Sep 2026
 12:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk> <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk> <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
 <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk> <CADnq5_M0uB6uRvQh3jEZGVEFqmU0wp_w=wmsipXqz=Nq5QZwhg@mail.gmail.com>
 <47218081-0338-4a3d-bca3-8b0b5a3bda14@sirena.org.uk>
In-Reply-To: <47218081-0338-4a3d-bca3-8b0b5a3bda14@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2026 15:57:17 -0400
X-Gm-Features: AclHuK-Cq9d27p6uURRwzJuINctgLf65y86LjQs4-Pqe-rCewP5XBlqi-cNgrkE
Message-ID: <CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJqdmDM6xQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 3:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 03:21:43PM -0400, Alex Deucher wrote:
> > On Fri, Sep 25, 2026 at 1:03=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > It seems everything built fine today, I'll try dropping the workaroun=
d
> > > commits for Monday.  The drm and drm-misc trees are still failing due=
 to
> > > the original issue.  Thanks for getting things sorted.
>
> > Thanks.  I've sent Dave and Simona a PR with the fixes so as soon as
> > that gets merged into drm-next, this should be resolved.
>
> Great.  Someone will still need to prod the drm-misc people once the
> merge is taken I guess?

Right.  It will be resolved when drm-next is subsequently merged into
drm-misc-next.

Alex
