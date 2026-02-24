Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE23A7F54
	for <linux-next@vger.kernel.org>; Tue, 24 Feb 2026 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771950171; cv=pass; b=Y82KHrShH93+8MMmMijEGPjtbNSmg8XwqcjZga/QI7nNw7GlrGFe+lHP1yi0ST8E/xqb3LFVY6zJBKd7aEiC8VxXGPnfzTtCQsiJbQW76WROC2e+G2PJMJarWRYvJAUfaG/9dc+HeAXTbo84qOWf6u+0ahzBz2K8q8/1qu9jA+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771950171; c=relaxed/simple;
	bh=zElRkeIVBB4cVrg9UxuI6BIZLT/u0RFeegdXTtGlAq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUuvCi4tmcl5r+WIxUGkZq9WEl01O/QzTrYXSSCeX5Yebob2Hkc2Kjx8M4iHy/TSswlaY9xZun2i0FzPNVGTliHBF0FxljU4iDKpDZdXGFEe3RfgaDXHci+yuoUrunZ6DTgYj8aD6vw60GC66L25KHJ9Cjle6YKrjoJtCcTLYKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv0SnCEv; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv0SnCEv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so62518795e9.1
        for <linux-next@vger.kernel.org>; Tue, 24 Feb 2026 08:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771950169; cv=none;
        d=google.com; s=arc-20240605;
        b=PopSvep5lO+V9gUU3DA/E/jXt/xF1V59cXaOisVeJpNrIUuViioG9t2MK0ON/0Na8H
         pNM1iuk08mRaKQzDL9l6ym7jPwIGvsKAWCHY5MoDBsmaLQKPgDhFzJvpcCS4Vndd8XAJ
         v97DYiQCoXdHYV8WCGvNNt35a0c0jrYrF6H+j9q+vKT3F+48kOs7DTRwJWVcLAxa5+Cg
         festcvofTEAEluIEtxzn/7MD1lwVFZIw1TpWDvACgjVJV/GCvEC5UW4LpFdBrOMdp6fJ
         6apdjVb2tfBs9wfi2DK2+vi8hltHjHmJRcqc0F+YOvR9YtWh4XSF1mMHWm+2Tw5gxyYK
         IhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JGercx3vkdEAz0Gc46HRTj3KBzubttjIgevwNppmhDA=;
        fh=CzjIT+T0P5FNei1CAT2Ciut5P6B9+15qJZJPpHUBQzw=;
        b=BfASEJGGIRv8Kc4EM96JeDanQfU27HkITIo+XoJPz3lTPH4NGIW/hwahjKxG1cSwZM
         EW8wEv7AVGtCPWXE47/su0MPR+stUKmFlRlVxhqAcFzw+DtUut2V0ckmlPjlZk4XKwSt
         t24ek8lGRO3NVH92JGZSfS2kpledVvLR/xEUqeK4fZshrjdx/TfQKE61B5oA1yZlqGd8
         NhclvabyFIs5IyTSb+y29wFYdcjgPP/ryIJQWvaSrJnsujFl+SgQ4GVY8QsW5dplFXEI
         NkytNO+CQw8RRrBU2Gp28CvHrdMIFtBsERK9RWjBKI4nPBV64o+MVIJSaBRSlDWOmbIG
         uGkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950169; x=1772554969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGercx3vkdEAz0Gc46HRTj3KBzubttjIgevwNppmhDA=;
        b=Nv0SnCEvj1E03ViLsMVPWP2wy9007Zy3z0M2SnacQXYCJdciFiNBQjYG8+SZ5rHWMQ
         horLoTFoFgwwy/73BDzujVnYhfVgxCjj0XlGTVLeZE2WrMG02fJ4BEKclUEcmosZKDcZ
         TBikCiqnYHr14L72t3rToEdYQy42yp+QAH8cGdSC6Cz++9H5cRV/d3CQe09he1sEzuEX
         2uG8rLXuNUt8pHYaIAqxM1ChPl87ZqG+WeRPBT5iy8NzlHLx8pLN94HXdD/DJlCqGzGQ
         l6D3bmI8jVlM4YDR7TmYof13Hxa4baLpZfJEwlGaWsEAQ5itbew1PT191Ou4LkEoayFf
         RI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950169; x=1772554969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGercx3vkdEAz0Gc46HRTj3KBzubttjIgevwNppmhDA=;
        b=YG77XpFKmyL5XPX7kTCfotLCEVIaEaD6caNUPaU45BQHc9ziPDlPV5/2y0zswLFXPD
         oC+dWnoR1Nx/N+XtoiPfwGLgYjwwPqYSC1g4KF2myCtYcG/bdYrG8HdyzjFUo1RMXQtC
         aavNagX0AMq7xRZOfQISD/m7mdEDdc+NxeMnI4b2KykNavDg0mHtZvZRaBhrqlQBgxW/
         oVihp7AhOla9WWd7XbEVlW4lD2Z8aIi86APZvrkOj89EM7LQGgxrTFU0cPtRZWbj9SVH
         Wd2U8rWnY/np9zlD26nD4xrIwqSxKvqyo7axLAv+axTa2CX5fuZn25pihbEjrCSOV1nP
         qnqg==
X-Forwarded-Encrypted: i=1; AJvYcCWx+s+5wQnSegRHVj1T+yqIZcdAhpcakzAKDnZZZs+KJsG9ZSuXg4UR2ABaGuryBQt72h20DCLrgXlQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxqm5UE2qXl8hSOcg0Er0FlLNFUz35PdY+5YaIkti59I0yRzM
	uULD6Qzb6qLdagTel3GHCo+mGxpUaUNyrPdgKLuSQdAarvAR9MLKt1vLSYFEUpvZn/C5WZ9oOKA
	zeUqm9+a+Es/BXRkzeLBgDVFk1JTMQoY=
X-Gm-Gg: AZuq6aLbuDY6gaHjAt+go7YRpUzlRuXLb1liJIWiojQ3abkpWxtdVy7jUUPg9f+oO0l
	bXm6l/bPKwMXQWFAsoaLAl++Y4JE6j42q80URH7jxIqJ9/P0BHWpQ/5/bs3lf+EItj+NpsvSC2U
	OpBDy+6Nz5SmA3CzzVQ5wJtJgzYvPxTVX+fDo+Rk9TFcIr8uUSnNel5A+oMkrxQR4LKCpXgA4qL
	PDlhc8B6IZaIg0qjzwlBENp/zolNOuuueEes1z0XJ6q81cVh1fnli/BCLbO5lTvAB9pPnECPjcp
	stbkN6aS+8m3mRkFBRdgoddSpzb3Xk0dJZRgnY1AcOlIWnGnBkuxaE4JRzAk2H+4W0ulCDFPvNH
	u9Qc8LGJn
X-Received: by 2002:a05:600c:45ce:b0:477:93f7:bbc5 with SMTP id
 5b1f17b1804b1-483a95b5835mr212494515e9.10.1771950168684; Tue, 24 Feb 2026
 08:22:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZ2cBWyiG_fKSjIq@sirena.org.uk>
In-Reply-To: <aZ2cBWyiG_fKSjIq@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Feb 2026 08:22:36 -0800
X-Gm-Features: AaiRm51o_zqO5Ia2dOB6XYBIYz_d7zJjJJTNTIBgDEBW7i99NJvSUvxyxg52aCg
Message-ID: <CAADnVQKoX=Tg63QiyuUZ9aWVYUPi3-gQFCs47s5AiWKjqT=oZw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 4:39=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   tools/testing/selftests/bpf/prog_tests/align.c
>
> between commit:
>
>   05849ec34f3d7 ("selftests/bpf: Replace strncpy() with strscpy()")
>
> from the bpf tree and commit:
>
>   f632de6e19553 ("selftests/bpf: Migrate align.c tests to test_loader fra=
mework")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> (deleted the file)

Thanks for heads up.
Since the file is deleted in bpf-next anyway I dropped this hunk
of patch 05849ec34f3d7 and force pushed bpf tree.
There should be no conflict anymore. Saves the headache for us
to resolve it when bpf goes to Linus and then back to bpf-next.
