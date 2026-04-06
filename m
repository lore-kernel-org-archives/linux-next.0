Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E318AE2
	for <linux-next@vger.kernel.org>; Mon,  6 Apr 2026 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481346; cv=pass; b=LaMEDamtXcozOgWpl3Xd8Y5OqfDCjw5Aw4yAltQOqju3PnnRpK/D0j/xAU5gflWb3heYtSVxQ4RGoFfn2QqiUhwfA9GfVEvZche5EMgb84su8hD5Wsca/LJDG5v6kBihfjFgM8cBnIdTt31K4nwkRg+mdMxsjl0G0tlk9hvFrUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481346; c=relaxed/simple;
	bh=lcRP+VhNF9lEUQj2jxr8twjq3XSojxQ4uJ8FMtwFyz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxpV5LvMFAJa7tuGaTytj99LkIMoYEhhVQh3n0lM9AMldWzBKxE/FR8WmJQC5E0e9wtoNJC+Q0/yHGWwMp16DlLiKYB88s3V4gSIeNNGBwp0uoeWYIPnEBHZ0LapuQu9Jo27aX9HrUe3+M/91qJz6vEeDWK52k3DbZcK2By5v/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=py3ctCGW; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="py3ctCGW"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12734af2cdcso182966c88.0
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2026 06:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481344; cv=none;
        d=google.com; s=arc-20240605;
        b=N02Nv97/7hNqcUMS6FkFdj0+EtJw+G9x+gYj6ctDajzwBHcMoX2A+UUbX/Lf3Pi30t
         yLs5iODVUzYPN2fEeiZvxbxDoLdztyJpiCX5cdFXwDT046M8dlDRQPYyLvRVbyKrgppU
         oZ5Wsmt21SNGEFrL59q8irep11bxW2ktIUmb6q0YRsjhgslNJVnCBHsqy4etcaomDArT
         NSfWmaWQMPJu7iDD2e3DukAU8NO8QN449uxzSQUBvzA6LyMebhRQz4X8wCOLyf1RrPtY
         1ALRN19aPgdOOHtlcA9kXK9wU1YhO8HhmmZHo9YJ0NpN9wccOG36Uax0/qqTdnM1KYaq
         P+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NHk/be7o1B3oPLih42bBrbppN72cQi5+jxoh4dh+Tc=;
        fh=4q6PRyLhtZ/DLPOy//WHVu+GuUVbQqrKYPED5uSVa3k=;
        b=lngU9/nSdaF20GngEASsSR02uPf5xRbpyVA7v6YQoH6vkleEQmEyzOW0H9SFL5r/FO
         WkyrB7N6yFo9pCFQQmFFCAyLEE9iTHNg4VSSLXBmfeSUwMKnikK6wh+gXkdhmnAiZ0PF
         /khfU+DD0LGsMxy5OAJ8tPlhizr/bPLW4yEge8ggTAC3ZgMHZ5isR4Jri8ji/Y42HMKS
         s6yYvHsyt2M17P2QHpAweCacsDzeZvC7YIScxdIGc7j52UmQlB0WMd3MeO66MKAAqW7z
         pLDWsyYC7Gc9Zo+3TmF7BuKpkwhtrCfd4H/asNe/xxh3meWkHGCw9oSJeIstRw3A5pbY
         hg0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481344; x=1776086144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NHk/be7o1B3oPLih42bBrbppN72cQi5+jxoh4dh+Tc=;
        b=py3ctCGWEklUV1ubulLVWSoMLpw4B808x409yHcIVxa9CidpCbjkpjuQbgrek67fTW
         VVdai8zlfUt8R0swhIiN9q1/Yd/zXtZH6kx1u23XvHaS9mX4XiAC4x26mLX6eAeIPbdn
         4oULUgPQuHIghALjbMld+mO8VgggMSAqe3La8CZC2U89MewVM0MFEAJjSXxvIFIoS5vg
         VXtaK/0MvG6r5/jj0DU07sbf9q+N0zMGucb0eMHPvQV1tYHn5Jd9FVg5Y+Z+TISiEENe
         QJDbblL8nPcGZuPx1HdVLaAA+vRyZb/ee15Mqde1/OXtbKGf/cAVStoQlnn5r2RSVplt
         xE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481344; x=1776086144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NHk/be7o1B3oPLih42bBrbppN72cQi5+jxoh4dh+Tc=;
        b=Ei4iWh6rF8LOhhfbbmgpC0N5cd5OJ3TmxiGj27z3+Z6N/ewOETaM1i5WGqAG7TK9dX
         RQn5VDBR8+Z47dj5V4sX6jFmI9b1uycBgK5pqucQBTRXPx/vKvwnK6wBS+jpaK9G3wuZ
         VbQEQE3j7hzm166xkLyVifhTyaUxOm8u9MdugWsqZkGdRuCsavjFMR2iP9JoTUpYI65S
         pyytKxD4KqrhvCqAUxNxMCrQd07+l+cGFcezjTdtgPZ756dnTryiOIYmgVM8iXyxE4QH
         ZvJCzGt/3mDhwD+M+88PdzBDIFlOhaDC9RDy4Uog33gICnpDI5whUAA0pNg8nwsUVU1b
         O54A==
X-Forwarded-Encrypted: i=1; AJvYcCXrwxGoMqhPQ2gFrHCuTYnFmwUK6j9/VoKkLA/fx+nFeBxHNFvAReWFvEkYBFyx/netlxLikY+hQCrV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/q/v5O8VUSSjhS2EHZ9bRaUchPKNR0hVUiDFG5LhF5RMB/GN
	FdCqXb/jS4FBj37d6oqgNMOWtO9zjWMTsWKmSJX74aNbfo2SFp3fc5yi/CedWT7cBsDZh0Ya0av
	2+imK2DIOxNW3cZHDz9Xe5uw4RzfqPIMkGLGd4QE=
X-Gm-Gg: AeBDiet4xzCrysnAbncMymzxoNCcxh/7pL4oV5OHjAGFSnvad1qNBNGCYXkbeeduIdJ
	mvGR+Dndt0AuhfD+vXKhInOKLdPdS4bKzx+wVPwP4dJVUeGLTpLd9eDErKCGK6eSbYA5nzCD6i7
	31iXTapcBmh+dH3N1IqAZ7GzgXOG+61U+wvwq4dDwD7QFSw6FIq6cm9SpjqAtmtCs+BRWClO60k
	+WnYp35pw3N5LMU2y4rwfRO6PDxETCn+WSzJRcYp6dGf1Ev4iXxTIG7qrP9P/wKjHy0ledNNPzH
	FQbG8pjdL5S+jFEkg6mPHDmuptK/nBGsbQWVSO0BEKoMZ1gMo9wpC7yiXdY3pbKJunXmbN3SgFI
	lGbq91IhZ/Q3d15TEU55Wewg=
X-Received: by 2002:a05:7301:6093:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2cbfbc82969mr2616472eec.4.1775481343719; Mon, 06 Apr 2026
 06:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adOxP2EZn8V0RmPZ@sirena.org.uk>
In-Reply-To: <adOxP2EZn8V0RmPZ@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:15:31 +0200
X-Gm-Features: AQROBzBn1rHUIrM4gD45Il2Ru7zmpgTGVRAfz-sRbhY_FVEI5qOwW8etBgYFnqk
Message-ID: <CANiq72nP53ZbUJtXCdQNaZqXR1=Ub4YPZRvVHckW7K+BHNj9Bw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 3:12=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
>  +#   - Stable since Rust 1.84.0: `feature(strict_provenance)`.

Ditto here (please see my other reply).

i.e. one side adds the feature, but the other removes everything < 1.85.0.

> ++rust_allowed_features :=3D arbitrary_self_types,asm_goto,slice_ptr_len,=
strict_provenance,used_with_arg

And here, i.e. both `slice_ptr_len` and `strict_provenance` are not
needed anymore.

Thanks!

Cheers,
Miguel
