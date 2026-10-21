Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792598491;
	b=mdl135J5Xrk7Fcd3cpgZivTYDCchTx8rsdHniFCv2HJgwsj5Xc6XU8QANG4/X508ZIJW
	 Q3+UGCtQTVKSefhHwPi9JDSxcFYSBtg5At2fj/pTO+Ij9owsWXh2GN4Uqg7MjykfyvRtX
	 9JznzhGkPqKsG4l2guDbAQ5VE/+wu8D7mvHT4SmfELw9nMx/82lcC85gFMgV7e6O0OJ1L
	 ZzWRdIIB0wcn+tTd8VoIBoxkhiUtrbML29/wL9PjpKswaHZHcTnUG/a5w6esPA7vvezSc
	 /JVEY16/C/lKXZFnoo+STXCqVJudIK+R9fmGCrBIKTgEaCtYLtWbCoL4s+/XP2hR/TA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
	b=fZK1xLD/weGsZ3WLV3Z3jlSrkEVlIRyTDno5OWWnz6sTxLApinFWRPaacrwOu5HsoLWz
	 tJswQULcw+Ma1/xRTg3zlKzXyg5Szs6tKl2YGCoqQW7mWo9Au2oboAsMqTapYihwVgFsh
	 qeJiMjKvqJ5EOt0CwgRRhLswnL/IQ+aFqaA1plP+olyV2QHrIh5FRKKjpEV+EfvNnQhBU
	 meZvP/884+8BDuWcKavWSmsinBAH9AXhpIVqWi5UTqPuNCLybCo3WX46hjgQIEBv6pPjh
	 uodKjNABTDDAZP3Vg+nzU74yIUVQto0xMGx9WqvrGEVLi3gGv+zZVim+bHb1SkjjRVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MtamBLQ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E3606A31D
	for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 16:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MtamBLQ4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bb5afa736so109006eec.1
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 09:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792598490; cv=none;
        d=google.com; s=arc-20260327;
        b=JXU/A97lP3teUJvz3BvwSVXHAeAfilIMS7Q4rl0jhBHIkLJnEpVl2Ez8ackIq7ZmoY
         EnHkvbG8f7Eqft/z7LkzAxHDv+nyCNOX8GuFF54malXL0xwyaVg8ZLi2JUH/wUYhwZE5
         TwoF5dkUP9LEXGkuXcVvdzUIcnH1fAbgMMPA+/fqyFXeL5XmpA6nGtMM8//UPxYZGZ7n
         zZTYx08jAOa3eEruriwVpPZwAWhy/LjlnQJbCSlgsehmCPSSco40bz/xZZPfZ/FhSEx5
         0v/hbK8yAvi6DnOS6n0DRwZW1WFF1+u6eCNn76bRDwAnnY4YdotpyG6gHOJEA+DrQQpB
         VjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
        fh=g1YmuhnjOBwknaDEzEAY5BXZoGD0jp07lVknSK9oNSk=;
        b=C/u9YcJMGGSlBicNHb1WxYdGp4QjTBsq8vL+jlhapw9SayASGKC7CeqaIpsJUGgS4z
         d3op5tAJoJsCvsJTpeXA/Yn1Ss76FIm8LxDZNmA7aYRmNLTYNQKClYE+jXiKNO9PQ+pT
         RP3mx0/kvS4Ni1AI3gI3cD+5s42ZnVRHEF0cJ0HLxrAySWo1kyP3C833W3mi3/3QfD7j
         YyuYKDa8pNxzvEXY8M+DdXvxmMkQWh+LA2P2rba0v30WJjj6lc0pIhhw8BN7cDNoo8KF
         V+d7+Afbs3U/73APRqYkFPhTm+z9fjbcvDnChREBV2HPyeCGBEOAXWs5hrhm/QZWr2ew
         mFBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598490; x=1793203290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
        b=MtamBLQ4vbQlF3Vf1ayIwNBCQnv5anrXyt0vGB64hXVUdWxJYi3lRPd1JaTujgWAWH
         FXeav/csdXu64hzX9sZhzfejNuak0LbZlBGiVaHqCeeJA8R19HyGznJOxtyET9uzA4lq
         hrAyypCIcDzvtAzf8alpWYz4HX/3aI7W61UqezBAx6faw9xZPq+dVsRdnXrrVYw/q88i
         b/XKjYxLYS9OqCM8JH1/jD8NWzfOW8It9qvksoiQCO0Gr/7zcnmGnBmGoNBzzz18esht
         0/oOWWfrDJOuS2fD5QbfZ3Jc8b4Wk+81wmwZxM/6E5lqXj2XkDeU97s7wAgmdO7APA3O
         lEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598490; x=1793203290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLygPznvNDCGhWPjkkO7YV+Kzr/dVFaecnXDSmhqgWM=;
        b=MKh8/m9xJ3w0r2k/rBsZqG0xMovUsw9qMU1a1Px3Uu13wlPvGNyilCIOXLCzTYw2dK
         b6xinWVkV+ODtrPTH1uz6Tt/wOtdwZkvxRNb+Tj3664Vvs+PEwI9KdSH3CPjru3680E2
         OSLsDYj9lYDCHoQAqjsolLulswQYehAnAd0sZ+ZKDgDYqohtrEm0a2cjhsxFEULFxmVs
         FZmRzp1+alKjAMYbb0O3ezU80yEfNCL0qARrLGB5JQmMGeAqGeVfqC4+wxhDmgrmflMS
         vm8QRIrZZuVBYI2Yv/Qaw9zHrL0ipAeJjNrQS4497z3usAw0aV0yeLqDWcTSPgT+5iQ+
         u3cQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlQbO0sNBBRmI35GV3Zuim13Lo8u24wYgzZ9X3wwDEgSNUTxoU17AFy0bez1zGp/AcOoyItWO1f28o@vger.kernel.org
X-Gm-Message-State: AFq9FYIBhVWOQVruRqtO7pl5TT0bPRo9l5VpBdAKkxzAfKJkS0+uzFrn
	sK+7ampBWQK5tmwgC82wad8K8IkWgmszIQbB2Nm80THY0b0aUk6NGTX36dv9TT/JMVE34R6cHqu
	wn1aJlwSnvsQPJYbugo7B4v6BawrGKsI=
X-Gm-Gg: AYBFou3awANmN1pHwvsWchtGzqr1pBh1++FMx6EN63Mke4sLe5C3fpxC1wVSQ6TETsg
	gsFHgsKVEHL7zD/Q9Fi34l9asT/gL+EXfi16kJsGFbKDzychgqljWxz7KyXPGsBAdIpTYLgjWv0
	+l0wb08mm53MtOu/H+O03EQfqXO3w0iv12YfLSLT7qE5y0+sbFJpKzdC8mR4IeyJVApGvfAm68t
	eMcCUx7DjzxqDbSnnunQF+cRdA9IduAVDpqAYuYJ0AqhgGIXSOxy0OVz5BIVYZqKxCx/rwPEyKk
	EbxdprW+iw0UmYHD8+4l16ekGtAk05hlKtJv5+IyZWeWytXpO3qpB28N7/Xn7M5Js/6WdWLq+Un
	aBNTb1tjBADUINPtiaaSRf16PvpxEWIw4AwxQO0/Bx4rhHTbUuEnHLTvYXxx4yLRLwB2R6jgUP7
	30UcaSttLyBKi713nPP45nj/ydUxRTsz+pXZMSPtX03dvEUexXjguouCgObzu3ZCIMypru5wBJM
	ZLgHEBIowbsJPIUOuJ61JvyiSR+Y/7hrl8K
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id
 5a478bee46e88-3685522022emr1029856eec.0.1792598490193; Wed, 21 Oct 2026
 09:01:30 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atit3cSBFwe9cDY7@sirena.co.uk>
In-Reply-To: <atit3cSBFwe9cDY7@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 18:01:17 +0200
X-Gm-Features: AclHuK_NMe7TYkrsYT8Zbia7tLLYKdTL0S8C6euBBNsuQv8WglAhivXlWPCE8VE
Message-ID: <CANiq72=fy3XAqXCBCwQ8AhWRNPSruDe4fxDAdzaUhUw94FAS-g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   init/Kconfig
>
> between commit:
>
>   f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.=
toolchain")
>
> from the kbuild-fixes tree and commit:
>
>   3504d1bce9920 ("rust: kunit: use `file!()` inside `kunit_assert!`")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Seems fine, thanks!

Cheers,
Miguel
