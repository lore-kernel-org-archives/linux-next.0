Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC02427F84
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974084; cv=none; b=cxqsZWmyh9UvIGXgJ2bKSetZPeLTMq7hmUub8kmedZsmyosRRo3964Q4UQLYT0OIqHPY7wCHaTqmSuIHiXI6NdU+VmepO87b3YOT5Uur7QRCfmm3rgd7+/Pi+iuJcJwwNLd4QQW0XXrvFR1s+lnG2k0zlEWA6N8RVoM46GaKR/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974084; c=relaxed/simple;
	bh=7wK3HSvtlhKwUtnIqiHM2PGg7G4JtcGYdlPgM31QuMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqgrEZ+pBtCG/G8XE+SLZFRj1UNvSTMjsNPlJymS7HYbzlo73X2WUr9sm5MtmxJrtNUkGbOGmTltQSHSRabm7od3Awzez/QCi5dnzFwaAmY/gRQxMDze9bS4pyNvKoMC/Nu/OWpmB5sTFnrojxiQbyW5wREP2nCmDIIAX8nNNp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUJb0rNz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUJb0rNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7501F00A3E
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786974078;
	bh=gLT8m5XOIRAVWis3bkYp5Y2UV3y2WRX8+L+8/1NAfx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WUJb0rNzFkg9ai+0WEnGFPGKH4LRiNYkLNA9+mnsCdjfRvGyk3Bjzben/tBXxC7bI
	 4Zz6OcMkaCBAFOBnuvdsx3/egfx6S67FyARRPk7TMUXUwWwFisseecJh4Ye632AeZW
	 i5WevJOVlL1MbJWlal/0sOKziogqBLx9YUzMUusXikLsWiGYs+u7qGvwZXs1XDozKE
	 vmx9EhO2Iz83gbwoIFH9/f6q9KyJMpo3/Xjumz4DtTkeITjLvhSnya2seI0+Eg3Pi9
	 TNqEO6tBhA9GefAdhx+3hLORhRPEMJrxK39I0edbLsi+I152LJY9nI9RB3Rb38WA4F
	 BLF+cpn9yLpEg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so340667166b.0
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 06:41:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOb+jS6adjROiLzt6YfD0Ka6ZpiYh8GPNCbCOpjWFNYQB6w+qBvDV6qm6Rp5VVtotsjir3eoifrLfC@vger.kernel.org
X-Gm-Message-State: AOJu0YwNE8yVo/tc8EW6uEOw8QMPYmJPPvLzxNsWu94dED1E1N+eM4+A
	qAFd/avYBwZwYJy88XwFcHdLdf+gSciQEdBElwVo4XmpUSem0mfAQzfvtBx65wwRnBKZ2IAlreG
	acLmuJGwT3Z1cLH2r4dbWee5IAJRdSaY=
X-Received: by 2002:a17:906:6290:b0:c20:3733:a8c5 with SMTP id
 a640c23a62f3a-c212a0ea0a2mr1108670466b.8.1786974076707; Mon, 17 Aug 2026
 06:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aoMJivO_AiXFax6P@sirena.org.uk>
In-Reply-To: <aoMJivO_AiXFax6P@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 17 Aug 2026 22:41:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_WbQPYYnQeJmqNxEVm74ig0VAW1EjbMyghMG1SWUE0rw@mail.gmail.com>
X-Gm-Features: AcwNN1WmKx-zisueJAO3gHGH8N4D8txvnzBlDHzYN12xbruKlz62XfdoDZ6pH6c
Message-ID: <CAKYAXd_WbQPYYnQeJmqNxEVm74ig0VAW1EjbMyghMG1SWUE0rw@mail.gmail.com>
Subject: Re: Missing signoff in the ksmbd tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 10:15=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Commit
>
>   a9ec4dc53b052 ("smb/server: rename to ksmbd_has_nonposix_open_child()")
>
> is missing a Signed-off-by from its committer
Sorry for missing it. I just added that.
Thanks!
