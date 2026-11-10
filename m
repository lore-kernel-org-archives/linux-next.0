Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351036;
	b=xfBPQWkERVATnbVVcRp/Fh7M0+cmf/CxvfTbuTpH8eIlZi4btq8S4V5Ib2mz7qlX5BwU
	 8jG4W1aRdgbvVFh8i39Lrt9LvknOrk6p6ivqo+4j6Pc34HD9WenjZOPLjpBbtcCfhjAvn
	 e0MTGt/Krg2siu3iB0snFMLBdGKPPIzRsXyx4dQv2BlH0dF9EPNpbjURk7FI4IWo3No76
	 +bLUmcThntHV23281zekDZoIwOGB3Y4MmScqcW8+Y/6vpDDC4qJlE8YBM3ukRy8Cv/895
	 Q/PQKR07ooa0NPH1V62Te3MbfDhKWXQPty9vCU34YwTNd9tX3CwvaGnxl9AR4SYx62A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351036;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2rAZbSVR4elz9tWfRB1OhpDE5c8G2VZo7vEvkdHOtIE=;
	b=wx7ftU8uhVDxxR8wbsWZGw78pR+ZyKoBIMQVd7Fnpkj7slWb4bqDBupgjCMlNbcKbBDq
	 i2jm7bKqHwVwIwkKrBuAFItOtxOE0iB5iT+UCuT7xwytRmMV0HrydIUT9Jpd70bEmhaS9
	 tX039qbNi1juHwqBUMA0i+iUAOqCopx5+GGGKYSRpZvlZ9JJ0O03eYBGr06nOHOZ/gjQ9
	 +6Uiw8twgJHtoVT5kPjt+xeUEy1tOLEKuUIMlxQgtNZHkNk4WA8mJTvBHEg9jo3JBy8Qa
	 F1X55cnNvC0ATdhpkJbLLN7rM3pyxiS5IZqCYLXlzaL6VXDPSjYf1R/fcZI7z35y9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUhA4Fj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDADE606A321
	for <linux-next@vger.kernel.org>; Tue, 10 Nov 2026 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUhA4Fj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585C21F00A00
	for <linux-next@vger.kernel.org>; Tue, 10 Nov 2026 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794351035;
	bh=2rAZbSVR4elz9tWfRB1OhpDE5c8G2VZo7vEvkdHOtIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QHUhA4Fj/xQMXxvNGmL5QQIfnLIqWbWmaR6Y3SZYDUZYNnOHONGtIQw0qGT6GG/FD
	 UqFxQiudbziTU6D4BH4p6f6M+quserjylbukzCCOJTS1x/UFYafaYnj63T3lybDIJr
	 R1aD+rgT0Nu4NGkBfUl84Wfg2XWzG0ROdbYyxrir0/8/Vx4/P37a8u2Hn8oKdsePoB
	 SwvyroBDHOctHdTninJFegMNlWsZdO0uKmln3x/TjoNtmQYMfgE8AeuyG63Ig3WSCx
	 hMcQWl6XcsJDXYUubsh+eqwtTy96hD+fS/yLuMA2jRxTYfrn96TcEseWcXhh25aYyQ
	 qVpsWPCfI+2mA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1869538a12.3
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2026 14:50:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF+UQcWNd5gYjnmMeBCSLQ4XRij/ErTbHY958ErKwLonglOvfX5bCRpSJm2BdEsTNAvydUpZIe+QPjc@vger.kernel.org
X-Gm-Message-State: APuU4Z/bE9YfL2YcI0wFgREEUeg4xES55tZlnaZmtAmG2/PKDMPOAAUG
	oak85fmIvzHpLJ/kngwcIOPjTuAOsGLoP5jg5o1tmtmqGYjtmvqP50YqY3ytJCZ6DW0uDGYlasm
	r4Yj0Tp9XmPcrPUbio2hradtifk8kjjA=
X-Received: by 2002:aa7:d0d7:0:b0:6b5:65f2:5d7e with SMTP id
 4fb4d7f45d1cf-6b777852839mr357649a12.43.1794351033967; Tue, 10 Nov 2026
 14:50:33 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avNHkkbVKqHv0s8Z@sirena.org.uk>
In-Reply-To: <avNHkkbVKqHv0s8Z@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 11 Nov 2026 07:50:20 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Kznbsmv_nYw0nyk739YDx2vmisBNVsYe+hnBQH5nySA@mail.gmail.com>
X-Gm-Features: AclHuK91YKKZlxU7_xyHcIsQRLJA77ZzimnfR6G5eAIsZmp2G752Gk_PGPjnRmg
Message-ID: <CAKYAXd-Kznbsmv_nYw0nyk739YDx2vmisBNVsYe+hnBQH5nySA@mail.gmail.com>
Subject: Re: Missing signoff in the ntfs tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 1:34=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Commit
>
>   926d2928270a5 ("ntfs: convert a named $DATA stream safely when making r=
oom in a record")
>
> is missing a Signed-off-by from its committer
I have fixed it now:)
Thanks for the report!
