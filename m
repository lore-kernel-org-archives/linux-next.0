Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7B3603FB
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887341; cv=pass; b=uU2ZY3RF7PNm1iYl3FeBmp0ZF8aHmpiRyH+fync6pFDm2QPV5LeDOwJpRa+E4K/TByb6HdOTtKJuuXyf4BLdJ0NnamwnA4ou9fGRICsh7WG3e1wio3Xn9M+da0/aTfkxNzuZ6tPgb84/h4ob6hAmuj//GHz+GqZjhhxOt+CIEVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887341; c=relaxed/simple;
	bh=YoXnh1e6jS9v+cuTyEPB/vqSlD/+iKKqYLt7YGn0iEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQWYYnt/bncWeFrVEg8vjnKk1C1ZQXeHWWoan0m/zPL2u1kYZ7gM7E581diZe9KEljBAXZjYwNnJZBZphvPL6xvr2Kq5aEpfQwuWc/Ztnh70f6spGJ4Evel0TXQh2BxCNXqoZwYPR5tw6EjFt2mFPNnKAj6kqqGxmEpEUmO8YCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rzsn3bad; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rzsn3bad"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12a70b4de9bso277686c88.3
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 09:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774887339; cv=none;
        d=google.com; s=arc-20240605;
        b=i+pfqTyAxGHd5k3Lj1+HtPPq/Sg0k188I0CRXxvYh5TcAJQCsnTWXQEq72YRHdwgOI
         0jX5wOpijyhBRCrupKz85Tp6CXGgcR4bCIgFU5pCWl5jUvPPRqKJwkwpYaOMNhhBmYu0
         7yXNPMVbyjPQnZJvArvwnt8lhokTLUeXVa1FrX4MTBWDl6GLCEImnBXEyLoZDBqJXPGy
         9qLNex7r+DuiBoCzkFfOHDAaPd/AVhGzYqQPTM5CSeBo+5iLSRzCZeS0SNl9zX7Ql5Hx
         uhMib8nZow/LQcN9DM2DKhhOVgcEm2aWLvRzY00k9bwtbwFH4znMuMsLSzi1tlCVLOoQ
         zDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YoXnh1e6jS9v+cuTyEPB/vqSlD/+iKKqYLt7YGn0iEE=;
        fh=h5rZjuueARSIoM9reB+fctQgk0C+XLNOsf15xeZb1+w=;
        b=hrnR2w4mXWRMU80M4tDKmuDbJy//h4Uo5YiBQ28/qvXwF4+AjUlZmpIGt3A8IzUZSV
         ZcHb856gsHiGVFsi4HB4DUg0GZavLL5qFNxKU6AJQ6FHXignfDkCDuq8ioAzGGNB1F84
         QjlGu/2IUOlcTW/KqFgCFKLQRDL+mnuCKC1RDCD69LU6FE8esN4YzK9Kmwm+fHi7n82k
         aXviFXRvoiejbfUfwuCVpGeM1BXHkmRol6VWJJoTVE82RCguAVLDbiQ/DqbFlkK30AeP
         79wuePN0s3sx/kw3objSptRcvl1Cn+BHpy9SVcj+9yAHksMXXm/KR+XsPV6AFuWpVzTq
         BKmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774887339; x=1775492139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoXnh1e6jS9v+cuTyEPB/vqSlD/+iKKqYLt7YGn0iEE=;
        b=Rzsn3badYKuza2mIFbwJuM9LktM8hWyVB1ThvtaabOGWEw5CatN4uy5oHOCcVDHN57
         PNJhh/J+RoXpAXLvqWt4H5vwfp8cFG+X07xs6g4PtqRlVtBaeUkG4UZuaVFOUlgif1z+
         wxR/iqwFpQAD92Dux4eOlEv6P7Fjl7iYZG/Mtc5v1wiZVH8svkHCui8p6i27p1n4P1Kj
         FcAcMTO1DUwMjUquDdn2c/6JtKn8XszbUswFypQFjt1WBcgv9Fwn2OlEIlNuCSZdifxa
         lSd7eRY/1vfJfaMa1fcrjPL9H/yTjeQtWKXGdI0ZQQ49mWPz7TonpiV7WJ9QVyso+FkC
         DQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774887339; x=1775492139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YoXnh1e6jS9v+cuTyEPB/vqSlD/+iKKqYLt7YGn0iEE=;
        b=DSx2iDKgsG0LqTKt5sKtwF1CQ9TTuS3ajl3cQS/qFs227+YYLtj2uQ4RdNCdVB7Hjn
         jJWOnIHKK6HSUVaqdHiuCGnbmvjDLqrY6bwBLFSSRX/XNlV/DwNqu4kHANi8BBWCLCSq
         bB7y0dSfy511zXa1zZOk102wvZekIE+OAsd57oU/4KRpHhB1CMB9ps2ndko2b5EphVMT
         3c35zXTz0RA88AWh5mk3La7dKOjgflqOIJr0BLAZ09qzi74fhioOuwoKqSC215efY9fe
         FeWOJjZIqZ2+MbQjeJE9xz0PEO4Puua2Xha3tTRdpizkmvPq/qEkjy2fGevNr2rWk6yE
         QDgw==
X-Forwarded-Encrypted: i=1; AJvYcCXfJ6DpRh+PoBNooM7M9GgBZ4cPeK/kyQBDRS9XQkK9X2hozGkrBNB9NXqRzh/jqYY+1DtWTFtyhy5w@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4zTTFSI3W0G4Dm00ERoozYx10wJXfRlU6k8Gq/wpDFuXg9RE
	SaDAApKgfBFVA6Qmu6kOlVzvUUulx+ktkemkai+5ZMaBAYOT+Tg5CSeUZIzjYKr1ucP27UkXKDf
	fQdHVV1Q4Y+ch4nm12eC2JoEcAkW9pV8=
X-Gm-Gg: ATEYQzzaPaoS3N3gx1ryi2ReVSlWvCFX+UXU0ucuW8XbGx17PFTcXHigwnQBuLEKGF1
	/q98wFhhxXVDCLfJCSHPUtQ9iM8J+xPYVG+yiCCuNL88AIx/FQ31z7l2B8uABYN2VVqCc8kzzXh
	OxDTom6WWKpvzSoXrakd1zkmoysBH/iNU2SIiMfchwFSZVAckZ6mHe1duSAYQcDIEUE3SWH2c7X
	b2GCJitMvfmKRZkxGoEsQDc/rindKG2eDmhEE0fksPtK0S3FijUGe1lxUaGZaTG+czrwZM6KGNc
	iVHfJaEsgfkrL2jquAIMlKaK757QTHBquOdxpXY8de3NSHk1tQZ7P1fV13lIPNFpRvhJxyzT0+L
	UX5VDWOJlrI7gKnJ2VoM+eyQ=
X-Received: by 2002:a05:693c:3106:b0:2be:e92:7f44 with SMTP id
 5a478bee46e88-2c185f383ccmr3426489eec.8.1774887338951; Mon, 30 Mar 2026
 09:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acqgbrNT--j-1wh8@sirena.org.uk>
In-Reply-To: <acqgbrNT--j-1wh8@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Mar 2026 18:15:26 +0200
X-Gm-Features: AQROBzCFLO5wXKwPGUoUDf-zg0k24CEnrRjXOdiNyHhgQfqGu2iAH1AKfBiWddA
Message-ID: <CANiq72m4nYVWkid0Dtn4Wwde8j6xA-UCpGwmAhCw57SbV2hzgw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-rust tree with the rust-next tree
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 6:10=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks!

Cheers,
Miguel
