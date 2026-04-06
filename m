Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB72930B53E
	for <linux-next@vger.kernel.org>; Mon,  6 Apr 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481132; cv=pass; b=UrsQT8pd4u1sJwarUxe7Nugst4tvDUy97g7T/tDSFhWcjjnhA+52I6kS62QA5h+ZIoSKk4C0lHiE8m8oqwIBW5ey+t+jNo+hgU/z30tH5Mne8tqUX4fOBgWHD7viLqOnqzGhA5/XU3Z+f488CbVNWMr/vfcC2w6PPJnHQ/0Lc7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481132; c=relaxed/simple;
	bh=9YC8a3lzWNEv6rKr0SLFO687gqzhox/8/m4SPKgEl1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRR/QFYiPbK457gEHSsvVoO5mB1rVn6ovRnZ8uSgUqP/etmnbV7niXSMpOOGnqmuKhefxY6qKGliC6Il2kyVEJaI/69sYAdTXnE9+gs2CwgbYzlNAlPlEM2DkoiMOOJcd3PhjtOPwyZh28KhHjqaRc2ucTYlsF4OOGM4suj5OCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sR0sAVyT; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sR0sAVyT"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2cc43ca447aso129724eec.1
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2026 06:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481131; cv=none;
        d=google.com; s=arc-20240605;
        b=Lvo2jH89enyLfKhwhLy3V5HGAfrYWlExacDDqiLWeb5yA24YckhU7DeuW1Rnd1oMOn
         V8+ECadW+OF5Uk8HYUTdxC1pFKG/9lEKOpSRSfUa7KUQeK/FnRueOeOwI/ohcSpgNii7
         WDLF/U3XEXrTopudw/49ulEBVJU5/EfmN1vJQDrSA4QKgHMW2G/rW8dpbgPTWwtKhDuH
         KGrUsuUNkmUpYW4f+QhE2iENDpYfn3NWanGwJvVy8qvDCdd5HoZJ6nrld4xS+hGDYQNz
         X7pHYqrWJQYg11BfpiOSz9VV3W2/2rG6gNUQLti6fNvTT6V9r+uKxPWcNE29gFBHJMBb
         VAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhuNR8wlxlDHKJ/KFpP/3/fxfYsMTHr1Ja0Pto1OBC8=;
        fh=dZ6DO6yll2kN2MYg5UDlPVYgwqC1a30mFRLCCaxAQ2c=;
        b=asw3B8Y3dlR8IEZxJ1TpWeB0kp87+jXuKidmCUjRvbtIwix3QWkSV9Vqk6+VP1KCFq
         i5Uw6sfuOPGXvy/+Oxkr6nyzZGwUxeycpvAEGB5EkHlt0lyv4oOtRNgRICz9cnpoLO9B
         jsQce69RHTB4P2cE9+Ik0iP1syJywsQfxIRFoXHUTeGqUUkFsk6EeMWzF06AcMd+eT1s
         pxCM3d1qgnZmofGYUJM18NaFIEls7upsCfcxbTtOhdFyQ4t++HT0z33s+h+nkluiQQAd
         wh8TV3TPqVpakF4B6Nl1LTgVjp7pk2eO9lfOiMO9hdfRujQoLmgQdHpsX1gnipyibxQb
         UdwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481131; x=1776085931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhuNR8wlxlDHKJ/KFpP/3/fxfYsMTHr1Ja0Pto1OBC8=;
        b=sR0sAVyTWdQ+UxofXYMeoh5HVA1ZZY2DOlQtHUe2t65T2AYgpOjnH9U6KER/B9xFPK
         kUtOQLCroqjv2dDZDVoT7jPxi/dnv6IDYCxIzf2K9QPvf/zvIVpqqqMuZExZMWLb4E6w
         ZZlOkxxOp48Htf+d+olM9nJaYBWDBF+22aF+hFiI2W0N/trbSCgg5cEFMEzrnbh1oAIl
         ZJcBxz8ozXVh+yX9g7/FM5O8uBDfGNl0gH90JHzVpusopwWOOs7j6KIV8azukUpwDcP/
         h/WVxXxe29Nc32SACXLoP2lzBrTtkvDfS5a1dmm//Gc1uyepc0VPeq40IuwGp7KTbP0Q
         kt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481131; x=1776085931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhuNR8wlxlDHKJ/KFpP/3/fxfYsMTHr1Ja0Pto1OBC8=;
        b=iGwYp1t5FtDEC4hgppGcmEB+E/RSLdixIW/TuYJ8crIEVObI3SnDPzTrFIXOcbD0h8
         Jga8vhOXTJDRxEs00fvk5vnnk+CsQNTZMhxGp92uSIbjlVS8S923NKs8Sz4vMaJLvBdb
         NLYvDbDf2kgpUrAL+AyBqrwcq9nJHaYSUoBRGTySRIAxmBV/i58sWWjylGLyVNT/btjl
         Hc799FvEPR+2Jhj+YUSkhVFhCRA0BLQa+sewxkuVd003pmxGooqOqRVIUqWqC69v08qg
         kMGnjcVcFC8D1C9Vf1NHv6Oog8oUlZpflEoqExvKPY/vNtX5XU20RDzf8tbbdas6JTC0
         CmWA==
X-Forwarded-Encrypted: i=1; AJvYcCV7zuVkdH7uPcMS4WipBn+RzocPWgsoidQDw5/RsrOZbcOH0gnLeP1adA/NEq8XKuchrept/JgDYrdm@vger.kernel.org
X-Gm-Message-State: AOJu0YxMz8TI7yEUIpViA8g/TmN/tjLLT8ZbmvWKmKzLNl+5luq0zbHa
	KzmJ+tIHRrh2zGsRMPt+/11CqVlB9sbEE7Cg5+PaHDk5h/veXO69NRd2c1Jh2Xlq2hFE/Y9dB5W
	u1s0B/h50u9tFfunHe4EV++oYyPTo0f0=
X-Gm-Gg: AeBDievvTFLimJT9luf+BRDnlwfP5YREpHdhiE9oG2JdrlReToD3+x67akn4V6pqSio
	KMD4bAYeGfPtJmgHgtnzPqIG2dwUOQpDt+2O5gIKA6Ym1aiVSE8QuirJ4SVlcx6BudwKYQJw/v5
	K4IV1lpwv/h+v4WdKY2WdUP7/DiRrNIGBb7GeQopw6tcQhcfZHCpSnBr4VR+PIsaKS+r4WgWhnF
	ssjlDk30P4tir6uvHGpE8sc7gSzp1fbDPz5hCdkZazJT48Wkx5Xgr1ARqtQ1XHFz8PXpg1f+kRM
	s59o7PXG8yay2rxpZC0P2BCfdOe9c5u6pZlLJLoMoh7daaFO8upFy8TMljfrVKhbJUOZuEF24er
	IPw0bNNdA7qkaJuD7T+kONn0=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2955788eec.3.1775481130667; Mon, 06 Apr 2026
 06:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adOu7wNEgMY9CGo-@sirena.org.uk>
In-Reply-To: <adOu7wNEgMY9CGo-@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:11:57 +0200
X-Gm-Features: AQROBzAP9a4T5BMUXD11zZLzE_rQ2JLxzDGyItRMGXGYnkvQP6HrJxP7AnfSG7E
Message-ID: <CANiq72n-FHNbRK2-N0dJ4DiYvKZ2oifuhOn-e7zvHAJjwQykKg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 3:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
>  +// Stable since Rust 1.84.0.
>  +#![feature(strict_provenance)]
>  +//

This one can (should) be removed, since it is < 1.85.0 which is the
new minimum (i.e. already by the time that commits happens) -- please
see my resolution at:

  https://lore.kernel.org/linux-next/CANiq72kdxB=3DW3_CV1U44oOK3SssztPo2wLD=
Zt6LP94TEO+Kj4g@mail.gmail.com/

Thanks Mark!

Cheers,
Miguel
