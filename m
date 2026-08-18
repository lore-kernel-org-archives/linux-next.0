Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817C37B413
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085484; cv=pass; b=o7IX7QYw4AFkX3ISBHjPTWmMB4r+K1GWOZ5j9hF59GovRWiipcOofpmyb4UjnLpFMDLew/A3SAn3txVRwbIX9fUwV/A6fL9a/Z8slbX+mVIdWdzcS+kucsDXz3VbdoveSaybBqJCLZW2IDPrasHV4VPweVOBfuBXdWhBuROkFCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085484; c=relaxed/simple;
	bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzbRs2tqtOYoZediPsm3s/21rXgrVAayOI/HiqPfFoFN+Q0Cz2gOZWr2D9elnq89gLLIuYouDdk3l7O86XXFesO/7kE2xuaW+aPlytOAIeKk/WQDLmyAVvZMnNl04ESOafahUnNnIo20F21KmZ0tp9jqvAV7law71z+nB9LEqYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETaV79cv; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETaV79cv"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485ab7c382so82866b3a.1
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 13:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085483; cv=none;
        d=google.com; s=arc-20260327;
        b=IeaVgPRWxvMM96Sbl58yqFG6NvC8m0aUAsKibfk/uy3nKisZeZPzBRJuY7tc85dW2T
         Kn12c9ux/ojNrH1z4xixjkSXK3PA+rFHr2GTik8qMXEp2tpgNXHKLnxqh35ntzH97Z50
         s/IucHqkdquZhVLShsjkzHhG99dRYvXAcF13AwoAOEZ/10QhdR4Siq1sI8G3whfbW5C/
         +3tytRWr563JJmrnm+7DcpOGSHNLPssRHFB88hFKYEayTiyyyqBY091mVnLuNpVEB2mY
         DLgBmbFldNttcMx3/8VgDcKtd0k0iiJYg3cXfuYBriNlGkOvyQYBGDP7CjdWdc6o/mIK
         u0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
        fh=jeiAL+7LL9ANzOzNoQKhwGBdAMxYEuQ/8khkKhFlxuU=;
        b=g+2fSwSVA/F/L7muJrV9J+1EOx0bZRlei+KoBDS5C4m8My39nAiH94bzezK0YBfpAH
         gRpQx8u6hcqRHJPnTwg49aXC2MY8/5R7meMVdeGwVz82PSXFjV2ZffqeR0+o9mGp918u
         oItQvvcm7bphb206Iph4Xv9yBhlk1d+DpdO3LZK0Itxrb5CbyQa8tuISE1z5xRGAq+3q
         H+JgJmmn9N7oq2HNl09Yog1pz7iV9q15Tcgfarw29m/r8dCH1dyPZxXeWyNnn365XVhi
         czR6HpD2lu4eD3bbbPy30nOKA46BHg9AVOqNYi66PpCzXa1cy3Cg1T5f5tNjF1cZrNfe
         UTAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085483; x=1787690283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
        b=ETaV79cvufYgJPCNC9Q0kL6k2i6L+RZ8+GFKB46SHeueKj4Ta2/L/IlZiDgJEWt/1J
         t0tzswTORku0570mFECUVa7IguLEVThHHopHenbH4W2wGPpJgZY295vLRz2H7fF/kTPR
         q6SnbINt4V7Q/qy/gIOQ8T9KJXh/4Q3sFc13nhf8hCS7RLcL1F8x2OJVLHIOQSojyIV4
         QXvn/gIBB5jMhkznvH4fzJ1dVwVs87U2fRqy6SIJjCYeLS19qCQoQtN+02mDmD01yob5
         IdLbRMcVzhqQMsl4sYrLy9QzHPWXc+jUOrocDz2sJVgL6TkkzpmBA14QQI2dUrap5U1k
         9CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085483; x=1787690283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
        b=niQN+uMO2DcsCELlfyo6RTqu66f550DrdEbev13e809hcCdQ9GuR0Z72xE9eRGojGb
         sHu+aeTik8aZAmxxD4c1eeEA7jSmKiaGYOppjaLQKlWZPWLkz7b3aNq+Fy0n9C/L3i58
         n7ekhjgvjZQ5yqCd00IK6e771JLdlkau0B/YzjSNNA5aoTZb8A25lIfVHxgyEMbk2snL
         okkAYQH8B9ZkYrpF4nxf55Cfy4i9Y1UuKvbbBssduiWNuI6cgywRO0/hiPoOyR73h+H1
         qyg9o1mti03du+EhiYWkW4AH8/42VLrEq5TlQw0QiSN9FcgnvJ2GeOn5Odavwx3Y00pC
         cQpA==
X-Forwarded-Encrypted: i=1; AHgh+RpHeI8ICh2ETBg4VSGLs6SFDyPzRWDsM3wMzPzVwjwzPeioZGTTT3KM/SSyE8GF2fx3vmIMLZSrNRZx@vger.kernel.org
X-Gm-Message-State: AOJu0YwwX9Z7VBDo5huuOOD0uQFF5hyJ0Xivob+pVGW6Lh78tPGZ9nti
	1f/BHQcgomrEeOpZ9GWJ5OPdBb0WpE3IiPejnWdzqAn2Br4mo8qAHLxWembG9BctT7gthXaS9uo
	CYLDvGcLarm1c0oO2JAZ37nwkkoq4xfk=
X-Gm-Gg: AR+sD10Y/+QLYNcXU6vJ9eu51ZJ59I2gP+kQopohW4o26kZs7xpk3aIVks3wif1N53X
	ZwLT3eS3FiQWyf+CIEnuc7pt4NO6oKfcEauKIFarViFoKBqsuxsXamUQK2GKnKV02ReVmEkHWKJ
	ASPxo4vUlGiNQ0XpHCowPLU+jRf0f2Y6s1CUExaLsFpcttF12pRe9vnOR/80HyAtUp++Bf25hAj
	kGWoj+Zs6tR9Ukp29T1uzHN43ajuQL/EI9/S7ap4AJlfdCSrSwDwX+rX0Izwc0As3YO5YbUZDRv
	h22oxjtPQtz4KmUnUSPa2NbVEvWW9s2i8CDcr854ZPmCF8nvkUS8+ouijoL+hZkJvo1BgE0+wse
	i+GonRgJod/zVNiGjQSAbPz6XzXd3622RZdCDMj6c1eWUFRfSV2aIhzwilBg1
X-Received: by 2002:a17:902:fc46:b0:2d5:3f09:4126 with SMTP id
 d9443c01a7336-2d5f6bc2264mr4348095ad.4.1787085482484; Tue, 18 Aug 2026
 13:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105350.361218-1-ojeda@kernel.org> <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net> <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk> <20260818142300.GE5432@nvidia.com>
In-Reply-To: <20260818142300.GE5432@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:37:48 +0200
X-Gm-Features: AcwNN1UxmUGgZFAV50wBeoOEzKNFymmZQEpqmj4fIDpqhF4GTKNx0UBPwrBe9FA
Message-ID: <CANiq72mOqWw0gxCCcJSyWRVC_OXSt92g5HmAOx6OL4xp3fcC1w@mail.gmail.com>
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

On Tue, Aug 18, 2026 at 4:23=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> My impression is the rust team is still learning how best to apply
> rust to linux. So things land and get changed around with a healthy
> does of compile breaking changes. In a certain sense they are building
> a unique kernel specific dialect of rust as they go.
>
> It's fine, and this particular case is managable, but my main point is
> as rust increases in scope a more accommodating process is needed to
> maintain the general kernel work flow.

So we have done that usual dance in the past, i.e. waiting a cycle or
more to move users over time etc., but in this case it seemed like we
could fix essentially all at once.

In other words, we do our best to avoid annoying others too much
(especially Stephen in the past, and Mark and Linus), since Rust is
not too common yet.

In Gary's defense, he definitely knows how that works -- in fact, the
commit where he removed the method only did it for the Linux kernel
(he has other users of that library, where he didn't remove the method
just yet), i.e. he was definitely thinking about it! :)

In this case, we weren't expecting more to appear, so we went with it
-- I could have asked him to wait a cycle, so it is also on me, but it
seemed minor (easy diff and missing it is "only" a build error in
certain cases), and Linus has been OK with us having minor semantic
Rust conflicts from time to time. He even tries to fix the conflicts
in Rust himself, just like in C, though he asks us for the test merge
/ diffs, for good reason, of course.

It is also true that, with Rust, as Mark mentioned, certain bits can
be a bit more painful vs. C. One more example of that that we had to
deal in the past is moving items across files even if identifiers do
not change name, because Rust items have paths (modules, like C++
namespaces). But at least for those we can usually use what is called
a re-export to expose the same item in two places etc.

I hope that clarifies, and sorry for the trouble!

Cheers,
Miguel
