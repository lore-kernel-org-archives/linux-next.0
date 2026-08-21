Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7F30D407
	for <linux-next@vger.kernel.org>; Fri, 21 Aug 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331379; cv=pass; b=OT7tGuGhp4IpFMV8hAaXgOQk2g1vTReTOv5uss3ZT7FTlUi126vZ5vcWKR66PmNoGzk+FldGzrsjRvM/hKCMs6m4fij2c3WMsImohzorVQm4s6C2sM7NeAP1SE2U7E6jKFlR19OSlBQjt41Cuqp0xAnfe6CqKnsXflRaFvuHINg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331379; c=relaxed/simple;
	bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MW505wytUamPA5/+8vjKYO7VuGSM7WTYQLKs1vs1rRnffXP30c4vihtiWOU39pUdV9FwD2Y0ldsuMI9NEAjwDa6OrKWI1tAhXI0fdGsjbSZHDQA1eMKjUgOmLz1TuYy+KWARo8hLcboxPANUmyvU5tQBdaBsr2cQE/HNPDcCc/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYwz4CO0; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYwz4CO0"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbe4c537ad6so133388a12.0
        for <linux-next@vger.kernel.org>; Fri, 21 Aug 2026 09:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787331378; cv=none;
        d=google.com; s=arc-20260327;
        b=bl/EaxYGZvSU88CcepQWsVy1on/YvG9SN8RapxCYdg/pwRP20gyy4mp6HZMVt++JNo
         Bdwxe65+Ti2SUTO0VP2vuC5P+RKolXeBDVwAmYF7Q4MUJL6UsdweWRVW2PhfB5aN0okH
         ZplQgdhanQp7MfoL3wbfK06Uh/zjFnGsnNoRQg3pre7prGbRwgcBOrlTW1nHvS2zD57N
         UFGtSfJl1vecZfbQDyaqq0ZX/ohWAAfUFBFQKmmFpnH4+GNCkbdUvnupX504qTo1SPk7
         fUDdDiPzpOH8JesbZUDZwyCwcSeYhVkxEF/WkdeRpSjpC7c3L1TANMQ44NVRO1dEdxf7
         5yHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
        fh=AiLpdKTEBbSIvfnwYT01F/5JzFDATUWF6y3fFTmvAxI=;
        b=cqxIlHC5Iqvsxjo22xRSQ/+TfA2ORHhCwDRyO94ooI8roPxuZ8kz09w55CtBatemjt
         PX65Kk6YxrFV+5Paxo2E5eTxoOrGx02PpTLcmlnnOZ3pG28JM1jWZGp8uyzhdPRkEiqX
         t9JekAnQ5xhyp0Mn7JRWh3Jh3Y+XWSvTCIEuxv2X3RuYjsiq581fDgLl8z7d7w8EcJgm
         HHFXDEunTPZVOjLjDaLNpxa0A7d4m8CbErmcEqR4bUFdqzan8QrjUQB/W09JTJmMCzhK
         N30t9C/VsZtOEpieriGAeLRr5AK2H31vQ2t21D+ZS/3Qg/QLkb6nSMx63dHvAbs7wZvS
         3vCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787331378; x=1787936178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
        b=jYwz4CO0v/m4afxF65Zo9rW8iqaiAd3vswZY1fdjXJ9kw2aCx5nZt3G+t4tLE0x9Cc
         hysZSUbSWLBFwBnFvOPp1u4gekcbxG/uZTjUOmqvDN/xwVjbZBs/a3h24K5kSEsgrrhw
         IrPW/jtyIlbQLO3hmBpLau6+9+AYDmIZZiO7/3qUA7kHQKkluE07YX+Nnfwc/8HL/2Iv
         x2+dp4uVrLccQh3aAGuoZffNntTlia6zrefulXEi1L7VC5TuXuDQjxY1Nl4x8yglQMuU
         527pPHv+jcR9s7UpJQREljmEDIFu5CATYW8X1oBtdgNjHyDIQzw1kikLgp6o1ITnnCHi
         l85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787331378; x=1787936178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
        b=Swkk0x5YXD47YRzx8gIbOTXBlBybg3tNOYECPCtZL29vubwCBX4j3q1ABUangD1n6E
         c1L4OvbP1XsKPQJfmY7d+J8K4X09zyxpGf48EVwnkD8yqUoDtIWds1OnqVCf9UyBGsjQ
         viqwkDu28RJK3zFbg9pIUos2/a0c8TI8MaQe0AusGC4UAZ9mIhJ0Z9CV7kkTFlJeSxN3
         AgNtzSvhDVPyPT5zVazgyueelibp+AMYxrOim93Oh+My8SqLrjao7JEiqfT//5bjdaAB
         18yFodcw5kQLAKtJjHdC5T/v43tph2wpgKuHLd6fK0vL4oe0s8yCwkEPcEVRQUAT8fW0
         28wA==
X-Forwarded-Encrypted: i=1; AHgh+RrUETJY/EO5en36MwfJtxBm23OGj2NsNbAtVstmXX/3UW2Pp0+0AbAEmKGm/2bDujGCihujpZcsUARE@vger.kernel.org
X-Gm-Message-State: AFuF++lt9x20ykFP69lh17+X5jTc+ccGQlr6mFWbaELAFdWKMwygXeQb
	D+R0vy8cwjq2cfViHE9HNZM2PiCTqktdgeIyfwKnoqmmrwQuq453wHCznFwbzYQDMCI3Ao4LMgf
	MK7DyJrFNT5ZGbQkI0WRMqrS3lA8fFEc=
X-Gm-Gg: AR+sD11uL8tsFpgZJ1DcuwVbQTDNLnIMP3ujzkkFontaN3lirRsDuZIB+h6j5b5tg52
	0dori1gH0qQ6bI7SSAUAaHsD2e/wKe7exhA1+38EkUii6dfgFuC/GI2JDGbUx9faY9WvAmFu+aV
	o/pEGoZiEkKKeIHZnyI4h47NrzRyKN6rihT4kHA62BIVDmrHUxubMpbYrbnq+nFcOhGbEGo6YOE
	ZZ3grNE348WUSNqE3yOofQv7a3J2ELMjCCINux8db7QZVq/q2kOgGeka5V9uNlUpjdnMSG1oFRf
	LThVU6M360mBy9035UQJ3BSFb8VzH+uPjBrcYUBSO+CkIISnmQtpukFV0ys8GyfduRG7hJddsTM
	yLTazdp19kleC4NXvGEHbPHEqnG6wWwx0QX7/ZeuCMUmIEUpPrj28oZQ/Yl2X
X-Received: by 2002:a17:902:e945:b0:2d5:cbd3:8eb1 with SMTP id
 d9443c01a7336-2d64b162c6dmr70531775ad.3.1787331377760; Fri, 21 Aug 2026
 09:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105350.361218-1-ojeda@kernel.org> <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net> <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk> <20260818142300.GE5432@nvidia.com>
 <CANiq72mOqWw0gxCCcJSyWRVC_OXSt92g5HmAOx6OL4xp3fcC1w@mail.gmail.com> <20260818204621.GB61595@nvidia.com>
In-Reply-To: <20260818204621.GB61595@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 18:56:05 +0200
X-Gm-Features: AcwNN1UPPo1HjSlbQdYsVq1-8l_CCc_BwGMrEvcWp7isi9phs1jBKNG1davq0E0
Message-ID: <CANiq72nS2zDKShxyxcO2EyV6R_6F8x2Pzj_Fs0n86wXBBx6E3Q@mail.gmail.com>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with `raw_try_init`
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Jiang <dave.jiang@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	linux-next@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 10:46=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> It is fine, just give it some thought. Your PR has a list of
> conflicts, and I saw one other of these pin ones there as well.
>
> Imagine adoption making it 10x and it won't scale. If there are things
> to adjust in Rust or process or whatever now is probably a good time
> to work on it.
>
> You don't want to end up stuck later on where you can't do the
> refactorings you want to do because of unmanageable merge conflicts!

Semantic conflicts are fairly rare for us so far -- this cycle we
happened to have two reworks going on at the same time. Normal
conflicts have also been fine and not too onerous either.

Given the treewide nature of the Rust tree, I think it is bound to
happen from time to time, i.e. even in years from now. Part of the
idea of the tree was precisely to handle this sort of change. It is
also why sometimes I close the tree late.

Of course, I agree that if it multiplies wildly, then it doesn't
scale. But we have been able to handle those in different ways so far.

At the end of the day, it is about striking a good balance. For things
like this instance, where we have a couple one-liner conflicts, then
it can be simpler to just close the change than a staged approach that
we did other times, as long as Linus and Mark are OK with it (a year
or two ago I asked Linus about possibly doing this kind of rework in a
different manner, but we didn't need it so far).

In fact, the only "surprise" here was really the fwctl change that
arrived after the merge window had already opened. Otherwise, this
cycle would have been business as usual.

Cheers,
Miguel
