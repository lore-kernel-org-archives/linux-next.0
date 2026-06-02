Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0763A4F5E
	for <linux-next@vger.kernel.org>; Tue,  2 Jun 2026 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780436717; cv=pass; b=QXhEBrnX6CVyj/vscnK1TYfaB3BvSsFO/jPr4yQw1IzB6vSXUNLsvupeUEIqAWSOfzLhoKQnmtrtBeHMdSSyc9N2pbZPXm+LsFEJcwD6vV+KgXvkeVEz3e2NPiL29J4dz++5UGM6vo2UioSTtut4NKem28IyHGdr2tb4kyCBwUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780436717; c=relaxed/simple;
	bh=KOQdHlqbjdmDreblqF6LDye84bMbw/y63M7JSnQjQwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdVuif+qqL1GCRlXYTginD+g/+I2iMS5oOObZ1qaninLF1VGdtteTLSNlzuwlJWpPfXyYJrUeLDj/9x5cJ4InCTKONe7TQEmliiboPbidfAKSpMKKmq/xUt93DXEWuTfwfYq6D0cXW+tDVAeQqEbxKuU4lq3UqUhTTpLfth0lpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GVaOxf6I; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GVaOxf6I"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf18c30bb2so38904645ad.0
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 14:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780436716; cv=none;
        d=google.com; s=arc-20240605;
        b=GlPsTNJCe7UPVv2A4z2hpj069x8XkZLs2J7dErpGjRZF5w0f4Wvw/MkMipC+sT+tKk
         UUxLU9aVfXUdy/DMOdpDjD5R/wcuXQrLjO0QThFOsMuYTN/zYe7PvQiXslN1All9KW83
         kI5DKgSt4EOabySvcxSJVc6XxaXRdGMe840rSsFoe0uNNEYs3hM7f4M+B2LwfHE4EPBA
         0HEdapnES/60ibs4vKM34lutaWDkUw5SvXZyBHvd9+Xv3uPhYmSYrpibYlMxGpmHQSDJ
         VR++zosavUvZPr9PVDDdfz+ZMp2OSbSjIwQ9CWJJfxstVtIpzGRmrlbsg6UjMhVIYS9H
         qXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KOQdHlqbjdmDreblqF6LDye84bMbw/y63M7JSnQjQwY=;
        fh=l6WcWug8ecIHgnm4T+YgNBX8l28pOTvcPRmucGHBLj4=;
        b=kbu/uwgtqZGgJbM5XblFXMiDu/naYyB9ntOOJzsFWDFkPtFnmg5QC6OqgTLSuZedL5
         iaXClKjzQL/w1P5eMLpQPwkeVUCRHVlQhlqFJOATyZCCitcTjX5d2wlMg3g8YZivFDdQ
         c7uiDcaZk+eBVIhSexRZQcgu5WCchGbBX8g7ZFrnnnnjm9mO4sY0UH4hJzWWmEIMKaUD
         5z+RguxGMqECf+zYIsGbv495+yx6OLnk3BiYHM+9UWMdIbr+S49DsEu2pPpnex9ujAON
         Zl4wfa0Ia/Grh3/wjscUF8RMs8/I7mmPMIKqiPMJVzwUuqdPz3JVBExJFtkpAA/dBhhh
         6fJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780436716; x=1781041516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOQdHlqbjdmDreblqF6LDye84bMbw/y63M7JSnQjQwY=;
        b=GVaOxf6IskshIWFXpyp00GpLCHlAzB56Wpwkv38VLkYLIxUN1669g/OKkBmG6Vt5je
         XOj71bi9TwMdNZw8tKxI1zvySYg+1HEj1Pobk9BlpGQu2dgBTRnzNMiYUk//SIb1n6rN
         viH9YJmI+utKN/8HMdNs6uZaqBrlDCrrMwQXwjDmGIZAZ4op+lGXdUH6amVXBRCT0A/D
         ufidmD3M+YZT147mJvpNI11PYvaCW4vLUZ4VJBGtIfkczCaytcgaimZs2Ph0EuaEStng
         EarIi/p6I3/hU8rgykTOwtkD2BSGLjDlRYn2apKdjgAaX9g+ML+kUD50pmPZDx/8gGZl
         7bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780436716; x=1781041516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOQdHlqbjdmDreblqF6LDye84bMbw/y63M7JSnQjQwY=;
        b=H1aya2pSfg28UWPzkogIjmlGHwknIZMRBcv1hprRmNE1GNi12QKoLWMmSGdDTUOdbC
         Le/VuatQpR3E6VPy/KfGdAAtqFrXFhtRxcehp2J6/4lUNESL7eNL3yy38uMKLRd+emYc
         tblhnk5WXB09G1et8z5gLgF+J3aoGbLCnrx01/cP/kxFBnkp/5WPI5CwrO9Pjg7dmAi5
         FQYJdfWVu5ytyc00JYUnbjkil8XdBrLmqmJDpQ3Vqp0i6gNjMBfDvDdEQ8CmDzRoJi5D
         u9J2MSRdDXA6spUiDi4PdaWdFADSsX46dNhq1uLospN99gTusoFPOLZJ8mADZ8MVJdaj
         LRyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7FxzarL6RBSYOGGmYEOXPCBZ7lW32TVhQasYiXlbTt2UxBtnPZBlhaA7kRLXlclnHkL96xww2Y1VD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6b1YCoM4EW5lOfgecO5rCtSqapx4ssG1xV8vEtwlffGSyFLHJ
	N15/bTPIQL8BGiqYmDjHE+rRSQbk+Bg73UEgRCfkmm5nlO7r+YYKwRSgmvfgLoju46VNVlQrXbQ
	l5RK7GZ+A6OwMg42x+/msTz/NAb6xzW7fTgJpMtuN
X-Gm-Gg: Acq92OFlurU1p2NqbvNp0aPaPKAYm4ijthZIqyM4ieCNlrnC4aev3NZI+CtoXTO7YoC
	GoZakaAVLF3G9ZUScXMn+s7mXymFtfkinDA8PS7xj7Nx4jxPw+rrE50OwjOiK0Y/FIn/JzXR4qr
	1T8wGV1OJWJnD5smqyrqOTjkp8nzGVByIKl+C/zbrgoZRK2jTkMRjYBKChHgzW540D6c5MEGHtp
	whIVDOaKa7pyt51oGziJQhB02c9KGiJTPEv6ghonv3ECPsMnt/ZA8ExuZtGQTTFZ4Iv5Pgt9fRk
	Gt6nCD1HIbSvPDHnZg==
X-Received: by 2002:a17:903:3903:b0:2c0:fa4e:91ed with SMTP id
 d9443c01a7336-2c163a59a86mr5095515ad.18.1780436715739; Tue, 02 Jun 2026
 14:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah8BzqSmZO40xYhS@sirena.org.uk> <CAHC9VhRR4mmkOdWwUCLswmA+_KEjB8RCBBTJ2W4JGiLUWKzxyQ@mail.gmail.com>
 <CAHC9VhRPbkVYAMec0KG55er6GOPdKqMXKdpC8rrHgiAodSv-sw@mail.gmail.com> <9d34218f-abbf-4a23-8b35-b305873ffae3@sirena.org.uk>
In-Reply-To: <9d34218f-abbf-4a23-8b35-b305873ffae3@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Jun 2026 17:45:04 -0400
X-Gm-Features: AVHnY4K_GfYnJi1Ham2KVsQorfmtW0kY909SMhxY_6Zb2qHORdTKGwtbORTWZjc
Message-ID: <CAHC9VhQnBi55hjwTATA_tgKNZ=StFYTKu2Av5R8N4yDJwsFswQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Mark Brown <broonie@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 3:16=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> On Tue, Jun 02, 2026 at 02:40:12PM -0400, Paul Moore wrote:
> > On Tue, Jun 2, 2026 at 12:31=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
>
> > > Thanks Mark, we're taking a look at it now and should have a
> > > fix/answer later today.
>
> > Proposed update to Hornet, assuming this looks okay to Blaise I'll
> > merge it into the LSM tree (and either pull in Daniel's patch or base
> > off bpf-next so everything builds correctly).
>
> > https://lore.kernel.org/linux-security-module/20260602183658.161744-2-p=
aul@paul-moore.com/
>
> Can you ping me when that goes in (or things are otherwise resolved)
> please so I know to drop the revert from -next?

You shouldn't see a conflict with lsm/next now, but if you do let me know.

--=20
paul-moore.com
