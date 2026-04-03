Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1732D222582
	for <linux-next@vger.kernel.org>; Fri,  3 Apr 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220827; cv=pass; b=WB2pQmet7Ji2H8C5vDFyihVTpRrpxvoojjNdMh0ps4LhCcP3SKJYy42QByfQb8Zv/l5hcQ1oTNURVXAzRqY5POl/lTtsZxtVa/C9mc9VmoWCvM8W0OxSZfF3fP26qFzFP6s4d9l8iFQ91gu+pvjgEwEUFZMRz1KiDNaLz2iO8xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220827; c=relaxed/simple;
	bh=Dfcq+dixRkh0i7wu3PbkKK9K+WdDGDtr4qA8Z63jjz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bj96RPiV0GrV/sojXByXk+8Oy/nJ0n9s4Id8WNQPGQnpkM5j/XuFjcEjgJIRhTafmE6Mhmzp9BXNcjHshcbLqazjf/dKKeVu8x5zdymkusJnoDN1XbnnTUxIISTNGKqdcpcb+aIt0KcZgyrpRUD7e5GGrfNkihgejXrteU7e0k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRTNS51E; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRTNS51E"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bd801b4078so225224eec.2
        for <linux-next@vger.kernel.org>; Fri, 03 Apr 2026 05:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775220822; cv=none;
        d=google.com; s=arc-20240605;
        b=JU6J7PC0e8eciq9uMrZxc8uZqNm7f2SGlBhZ9bASwWAwQ3uunvtJrgW1qreMztZeaN
         Z2LaOoYbkqs/UvQZV8T20UGBvCbfRAMv26nqriZKURf3pG604QjPfZWBvsy3C/wKcST2
         w95XKboknb7p2nbBChUb8CXQ1a2eKDqKQ4CouCQj5jBVXYnfByhQwJNx+Tq1sGRSE/Y1
         hbLq3i3drBa4+4z4et5szKSTOlJwqD5nZj+9l4XV7zsl42lbLPr7cDg8UqKysN1KNrhe
         WJ9ksqv1FZW4lk21j+ltbHHXGcS7Oq3CDycheEmGR3AZf5LdptpJOpYIzJLPpQ4ls9hh
         In0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7AbnUuFchRyOcLkuVbbi6yedSKLsUdHAskJPEZg5SOs=;
        fh=0dZU1Z0Eef7mIf4xWnO2ilHPKoiP+9PoZLPSlJiVAWc=;
        b=ayVBjmpw2PS2oITR5paG25RJe5IoOD0b5DREQC+B/bBYih3KjPXSW0XenuKos3Knqh
         hmD6NnpAaegzLcSNs8TcQhT97cWP512ZgNH9OzreuzTke17fYZc1pbutkc0axgE2IpNW
         ro2YTqya0E2Gi9HH9lD4tlaXVPzAizmkzDt0OYCkRmR2z1U/KqT3q6Yv0qNSOYXb2EEa
         oqsV4OXjJ2mrkBvPyEud/DM9y3w+MGDLvuDqbvR619FbRooZ+P/XPkQ+AGHm0dfX8zl3
         arLN6riwWxeKluRDl4IxGTdZP888ucAw+lbMGVWhRjZgHvkSOCBL3llXnXJ6KhXrVh5K
         gPhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775220822; x=1775825622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AbnUuFchRyOcLkuVbbi6yedSKLsUdHAskJPEZg5SOs=;
        b=WRTNS51Ega8Bx2jpxCG041cy+eRPiFLfVRrS+LsS4XIPdoYYcVsUOHUnusJkbDp8h7
         qSSyKuAGtfzl+Pd4YUDUbP0fzxoGOJgYJ+sy+GyB+QJe4k7FV0+RLGgK/9uo5sey2K0K
         nEBa7xQP92xXVg6gQVkOy/YLd89xcR+fGjkrsnJJSU1p8GSMyKi2p8mX9GgXY/mMJZ5E
         iEZag9es1MT02gh4+s+j2oaDooS1gE9mzgcY6mxtvp5v4ZdKdFKYzC0vH5fZqGRXm4cJ
         FJJYCUHBbGstGDdefb4ScHuANFY93Ed2g0ljCY3uTSBMzIhPg1cjESGl+RtTzo52Tzoe
         jz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775220822; x=1775825622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AbnUuFchRyOcLkuVbbi6yedSKLsUdHAskJPEZg5SOs=;
        b=o8P0PTu2EBDOnFFHnOoIkAdrOcfz2qAJD2cb2JvXs0itZJFnxcr0a8HYz+1OeeZOKt
         vtHLpIXdmVYhM74UXt17SBdAcp+wh7bVFTGfz3KaxLYB/fx7s/PCcQp4PcR7cdDBJdjH
         ll4jtjGi+2DXeN2DGhJaFuLvEM3UqhgplNUNFOADYzeVt5WFb+NDZOov3X2yRefDGeQV
         JAFwKGQPOwpBi8c2+7j4haLCpq9eWbCvDQrqLgRtCz+gvjl6s+Jv8Ea1QTcf8MEXXzNa
         mOKHvSOd0QMgZTiCKyP1UvSBpl5K4dSS9F9jSbgp/yB8rPrOUKTIkc4AJhPyLvjAML78
         UJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU70wA04WPl5tTeGT6DtrtI5UWg2hzFYxq4V7RExSzsBxWFzTrvfsOZq3pbi9RusqWf+dMUG8DZb3H4@vger.kernel.org
X-Gm-Message-State: AOJu0YwlkNfYT1mG2ZPFmPcR6iCnjvcY5QqH+BQDyB6dKdhV6oNb/zFX
	aXKhRnqFgowaEN6k8R0F6FdwcvHEbHFBWfSD1dZaAOiIG6kZQ9tkV+ttzPvUVWRS1ZhJRLvWW6D
	pUKYHphHTMhpp6NXpDa/ejnJvruypNEQ=
X-Gm-Gg: AeBDiev2qitj5ngMJM7jpmU7bkphVH1Xmdd+zJeMrA2QwaspdLpUAHhRa6LkCXQVxNc
	xEjinvs6254nkKxiXOK159qxN4gcFFhteGK1Hst20kXrAJPlS6nbNTzsFpwwqxzNOGRAogHjXZG
	orScZ5Slj05tPEwHVxaXgoQsy3NE3ZhBtvzi+UwYoUpNtt7aV+mfJvOrIqpfQjue3pqpPWYCWxT
	NSbIkPzzDhFUJtE8txTIfOy7Fr97PR6tleefAmuWTDupsGvXCAKLz3zUfytqYUybyq92llZIw1u
	nHsG4s4kSrWNHbolYEsYZe4kCDUieAVqkj5iFzQQsHEB4bqbxjbaKif8AjllHASigbI+KT27pTI
	7gdmfMvrCpwghDbKwchkAOgY=
X-Received: by 2002:a05:7300:fb91:b0:2c7:3c4f:7eb7 with SMTP id
 5a478bee46e88-2cbf6b96759mr658721eec.0.1775220821531; Fri, 03 Apr 2026
 05:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ac-0Eb8leHb-h3FE@sirena.org.uk>
In-Reply-To: <ac-0Eb8leHb-h3FE@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 14:53:28 +0200
X-Gm-Features: AQROBzAcCCDeZaim_2mSuIOgHqFAlVFSQKpk4P8lxzmXsMoJGg1Z63B2Cn-zzxU
Message-ID: <CANiq72mW-OvbB2Zr7f2TjZgr6dYY=n2Uf_rZh5uJ98hO0_59ug@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 2:35=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
>  +use core::mem::{
>  +    align_of,
>  +    size_of, //
>  +};
>   use core::num::NonZero;

Looks good -- it could be nice to take the chance to "merge" these two:

    use core::{
        mem::{
            align_of,
            size_of, //
        },
        num::NonZero, //
    };

Thanks as usual!

Cheers,
Miguel
