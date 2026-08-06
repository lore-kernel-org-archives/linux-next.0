Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8732E143
	for <linux-next@vger.kernel.org>; Thu,  6 Aug 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036215; cv=pass; b=Kl7964YC/Ncz7j5dPBJckTIc8BYScD22dasiZlJk9oJvwaJlWy1hSGpjQLNkaHRViIpkF2Ho6up7VxEZ0Jd6Bxzzsl3QXw9k1Y8WQ5axp5ex2OfjhwE0YOLeqAkXSypzhmHzDIa9ei+121LGZnQz5E2p7KHbOuHC1tm+uDuqWVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036215; c=relaxed/simple;
	bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXEbAFdnTGUUE/7S0M43CtQi4TAJCurPdQg0zYG6PXcHlw80U2HS6RPqxTSSetnAO+7b11QOnMlTBiJ9ebUCuWLVI6feJWHRfPFGtkyNXT+hnWoKF9R6TNL5fnVWOm3W/14P/ToAnfcWJKfYUaim0VfLi2jix/rjCjLXnP8/xsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXLmIxis; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXLmIxis"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca53979f8e8so333835a12.2
        for <linux-next@vger.kernel.org>; Thu, 06 Aug 2026 10:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786036213; cv=none;
        d=google.com; s=arc-20260327;
        b=hvGJGx89hw3e1Yoj0Jn33m7Xm+M0Qtp9dltHSlA25XS0hfzITcWbOeb7bYeXz53n0B
         VZUvIZBj9FZtUbaGeBcvCG4UgMTopRXMoBZs82WXlnzPtqRw39H7PIPOMrMb+YlZgzaM
         ZGLHDsZcz1C0q+tpLcuJ25wpB7xzKSaa3ZczbgvFCFFCwyy/uEJgJWCFA/HE2BPGfuPh
         T77KcHqWrkTNSBZ+oTpH8cxxvRwiJiqzgt5bD4XvDfxfCM9YaVc1vDG30xpuZ6khOVw2
         l3a93kQqWTd3J2DGhrD63BZXpD+wZlr3+1i/uYq2vb/5FSkbQ0+6UfBjOqKK/1ePyD4r
         YLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
        fh=tuayL0ogeCehMBVj4SgmAb3BQMtjaGl67mG4KySVJVg=;
        b=GrZfRXwDFGdO4cc1EkEBNpXtegJNZzlBq2pb8WNEc3F9YdKsfUnRtoKzopF8KAW5+D
         9qmKrQap8Q+TpHMkY/Ew0/4yOBlPdjduZoBovgTgZiNnvvNDnBiM858opw/8OibTt5tK
         amWYb/hO9wmVZFhOvcVNyFMxH7sgnNjLGCTBbshVoGaNg8i2FuJIgP46QsV3kGvtSnOF
         i8NYiu2ERa4AhjAc+CfnTtvEFwRvLMu+Lv4u47qBkABoOmLmT5lRFSSKv9PJypiSbTwP
         Sf7GmcF94ifST5a/rhFuhf2r1WOSFAczEFSNXPzsKQpPN2wZO+jET0IZYdn/iLxy3tEM
         USlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786036213; x=1786641013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
        b=BXLmIxisPoP19+yU4jJVXsuRhRdT9d2ZWUtWcW2dFPT99V0UxFyQBY17qHhsmBp7iB
         pby2DufDW087k3KU0ktjDd0uz4WYlfFvCjvItQzeVyZAkV1SsavSVHwAiBsN69P+/K+P
         Fz9/vCCy37V4aiKynaNCZpLviNq2jdHp3HMLE3KLTIT0P+tHV5AELASMTzpl2lYqWZPb
         3ITetb8Cat54HFwL7h3xUUrd1hEmbJXBwTY3MzxqkCvtMlllxGwOzJQbnvRPzaViMhVi
         1rX2G+7D5eCQiU6+4XWUUtM9fQsS4crgQx9Qo1DEVCSm/A0kiCebyLDVAyE1N8vgmwpT
         DK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036213; x=1786641013;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
        b=ELQtVkhvOE7UFRIqGZvBmlmV3vHeR5cFmuNqWhMOACiyMu2CWL7pKGZEU1X5xwU/ti
         V2CJn1lm6brpavfFa1CfxHovjA9m601SC9OaS4lnctnEvVTDsIP9erygbHWRWx0LpzKU
         sek9sg53Ns1Mbwi/Ip4mSlWUguPEkpeetN+u7ErWSyHoWYuFtr1dLSBnKTRYeiKg2ii+
         eVJylPIvAf813thqgGarAkxcL+ljhreYEjU2WTbU5GHMkS5xXCjinvrDLzePJ+Wb1jMK
         7EgbyeQlWNJWUqHCplROqwfTRMHHe25HN/VLy0rRrjbyaztqEsDl8mviIMadywlXpmo8
         tywA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2uR+v36sxtYy1B5QrQ2ioAnoEhMF6WPlL93/pHG6QrBCfEM2NGmej6/HQpHAcCaCWT219tPyxulvA@vger.kernel.org
X-Gm-Message-State: AOJu0YyP1azEDGUDybhOgQ39dtvUcHCXWyLtK09qoWUhTkdYmrKilaeH
	bbOELgLXz4yR+Hy+a7mqEYNO1mUhvuOXVcjbXbVHlc07+qTi13Cu+mQzR68tEV920gkAApdo6F4
	DMCEFDpse6rAY8ghUEWu+X6cp6ikywKg=
X-Gm-Gg: AR+sD12Bk62rFJRbxjnrlZxyrGVuvWA89FfqzFyhtfVzrElJaGQkUQ+NrLc3a1TL1xG
	n6ec4PL71FheaY0rX6EsXk3mvvWm9TS5wnh651PBIEDQjieGkS9v7mtaqPruksbJ9CYDuZvR+/M
	hOUqwfr+hcao/PUCQr/DSOrju7Feold/7fJyMoNTTpytam5EUg8xJ67uVx0rq/z89K20/jsr6SW
	yU2B6y3DlkMWoPdYy8ODEKj6BgCpjRfvIH6QLH5oBKoifJpebCMTYvsQmh1FW1qDC0qr38g1RaM
	rO6z99xboybJXambx04jvHXN6R+Qk0aG7M2h+k5EbL6gwK1M7q8mGAkcsMRYepbpcYUUUyETAZ8
	6A1MfGICecplwVVuEgbLg/ev45R0r1/opFj/ayel1MTtweD67dFpBZiisD90WmcPXK+9kJY0=
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d0ca73a210mr127500655ad.1.1786036212982; Thu, 06 Aug 2026
 10:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk>
In-Reply-To: <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Aug 2026 19:09:58 +0200
X-Gm-Features: AUfX_mwe1rnF833eEgHGNDZvGNIkd1MYZv-whPnyM-yMmGdCmoEqYy_1vGmTd1U
Message-ID: <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, linux-next@vger.kernel.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 7:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> The merge commit for what?

I think you merge driver-core-next after the rust-next/pin-init ones,
so I assume in the driver-core-next one, right?

Cheers,
Miguel
