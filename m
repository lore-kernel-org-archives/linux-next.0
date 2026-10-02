Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0C3E3DA2
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966611; cv=pass; b=SzhdtAsou3hgsFhGHeJjg4RnY8Cboqo2tVY21w8zMboUUTkKTwsr7CxkNvS66zvwDjWjO4XdpRwanHOhZ8awBfkBnXu2hCLRbRMKWG06DMBuhlrLhBFiGLDQneDv2J+gyAnfBKy11RVhRwUWyAST/NlovEbczvT8xFYa2ZnG6vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966611; c=relaxed/simple;
	bh=+8giRIva8Xtt/QGhLW8m0S2kVNxw8aKS2XZv/pRromw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H70gppVUMhY/UprkmjGr9mwyPRVROFjbeEZjSc70Nencsmg9aYTS1Kv2a6I9lfuQdaz8NfdO186jJ2Fnrh+ghFR79hHtjMJFlCx2Hz4UUvdJmf1jTfwWn20/iSHKRPWDrKwNYahka4uiBl5RikdzpMYZbSnq7777+xKKxa1qE8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf5Ggxx8; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf5Ggxx8"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso646611eec.1
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2026 11:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790966609; cv=none;
        d=google.com; s=arc-20260327;
        b=o3Ru3Z/oM4E1LpEsl2zPZa2Q7b8UWVvJ3glNrcZODvE5ZVIZf5o31eR5AN7ThdJbHB
         a4DdJEjD+wWzhaUywEg2vh6GsH0ZmiL83QKjwtwslRal0PGpZShTE2++1EGuFKuJxky1
         ntV015m1QGsv/p3tluLF2TvWQnOX7evp/MqeS/lpeFx0v61aquK9qVT0c2Cbn2e5HlgM
         OxKOnVjqqnvIg+bgSxnH60nvJkUbvmfJaWBNWBedqE6iFfMVvmo5EumV2CzUOlCUCwod
         Q/npOBgloct26BWJSX24YVNTVuVGxZTPboXwBXiXK8uAk9oliEmAlweYu7cLb5dRqmxo
         UKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAlTpdA3JGK4S+vpVZN9wxh+KybxUcOpKKtqidXNLgA=;
        fh=1bOaly+5Ll4SEQVFUJmHIZYwBUKjvHkU/rtIIi6qLTg=;
        b=eoaAkObALWMQukLT1UkCf1MUHIeGrm7rawVJC4p72Mqt1+P6SHV4ZUSmQwIhjzmVdI
         sTdQ6STfkOLlQbXqpzhr6IYkYv5hsZgPhcHnOb7PTfatMDhZzqwib99M7qRwP5uMTWch
         bCFFEU1S7qydCKyr2UhrWpE2+ab4kPwoIK/LlcPVMoZ3u3BzTmSWLnMYx9sqFOVpb8Hu
         fmuk+Knq0oTnAJNUl/IputUSbCTPWqAus8MYaZeNaFoONT3KnZI3r8E+P9DhSeHJXSbR
         9PCA65hH7Y5r+qt7WuQK+KrpRzpnxJDRe14VlkzafZBs/F6l8G15cgQaL+GQUSPa8Abm
         GbaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790966609; x=1791571409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAlTpdA3JGK4S+vpVZN9wxh+KybxUcOpKKtqidXNLgA=;
        b=Lf5Ggxx8GWy4aPvdZa66ytK8Ld409DCpR7scK1g9D+QFLkWC126tIaiIPiBt+3KToH
         CImLw6/J/UE0L1+zr/iIfArlBpMw/WSgL72fW9Md77f92Q2FVqWDZvYfFOiXHrEqMZds
         6BrBn4fe2pNWjIie5l06ix6r9pn7Al4q0yxHkjBTJ8dor2wQwmH1u0qcjwfuOrp/va1Y
         NFoFq6Kbz5xJwIoclwlxaTCqWGJwam74Q+jxjn4HLdkU/PXJbz0WNNebjvilvS0WX3Lp
         d5XTzCdmu7nfQZi6/+6sp1cLVa02KC63d5vEVAwbU8jhePyAHIX76y+uTNCHqnRWJfe8
         mObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790966609; x=1791571409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAlTpdA3JGK4S+vpVZN9wxh+KybxUcOpKKtqidXNLgA=;
        b=KD9YBrgds6dmDMdKi9xVULPVJjYb4L1zpnl9fyt2akiB/SjOgMs7AGOQV2KHA2nxH9
         m1c45ybsrajeSg9wU1SVkzNg3zyoDFEAqQ7qDZgLT97Tn2ieEVjXQ+E6NQ9oXIlpH/dC
         7QB7j06p8NuzFiOCj/vCpyO1HYzX05fEERzexzA+54arCnWyiljMz01ONBWiqwVnTcNy
         QQEZtK4Me2DO8jxovwvF3t7Ai9Mk50edXsPXujJwOCtShsCP9aYqAiHU5Yzrw4XrikVG
         xcYCzDT9MPntD1JbgkVoARhPPvtKYQP7fyr0lHkIvQXnJYKWfEH/lzIWw7gRx6AcU8sr
         NhDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8Q5qSQbtgLvp+BS3u06tJYM6TTC8Zfo9BNjzSVIpeOzChnD8RBrnWaXbntB3H+oSmktz4IdMMNbZt@vger.kernel.org
X-Gm-Message-State: AFuF++l7fagL3y7JjLv3W7zvK1JUcFZBm8Vv5ZFcE/j69P6jhMNkw3kF
	QQrI2BEu7vsrtoXHBbankOZIqVaYlwhTUMSYvgGBRiygTZwyG0PQc4GHYZZOLRovRB0UmoKFv/F
	2HH1p8WWbcFNu/6c1fkdNVh4U6glateI=
X-Gm-Gg: AYBFou2NwX92tcskINkb9is71RvdB6R31X5cyPXblD0nOQzz1rLB+6GX6ok0L3l6bER
	ZzUYO84FaFAC3HHgfG6/aetIejfETgYTcVudcLcc0Y/L4BpzuXPYNqe+R2kCYh9nE1Lrmi5EZGt
	HSGbxg/mq5wHaiBV5NW6naAjsixXIGTgaVvqpvfvaKm0aaKFzeLHqlZp9huLPjFtMwpQnWMlXdO
	NdN7k1Rkj1xOBdGCzyonpof09q8ybzEVNFUd/etN4MCcdLbbwqmlifhucBz5RgMt7ftrzdcgfQF
	WIHz/mUcW7M/rKj0eXRPKHoM3gLvJ66y0AuR/rnwODnrLeRYaMhFlef/A9rJNyy9tQUuNev/cwY
	LHqLnMv3m2h0GuGY6lO5HVCEN3lyMTcAiT4mYysJ43OxYd8273WM1oPEICaGDsEjNukpcjo4ua2
	asNK0ntQYa7wH71qGlDlzWzP0g1VP3ue8cwoVrKsEk/YqfeYO/flM=
X-Received: by 2002:a05:701b:424d:20b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-14f5aa4188fmr6124238c88.1.1790966609380; Fri, 02 Oct 2026
 11:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar_0MTEPHARiUqc0@sirena.co.uk>
In-Reply-To: <ar_0MTEPHARiUqc0@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 20:43:14 +0200
X-Gm-Features: AclHuK_alLvtcNxx6cLAevu_sz8QC9V6lp9CNOOyfxNDgqInLbQjnJK23t8fUyc
Message-ID: <CANiq72nR4sz5xvTVqqnwvoVJ0s-sDETQyPc9MUKo2698Ocp-Kg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-rust tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 8:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
>  +// TODO: `Alignment` should be moved here as well, Rust moved it upstre=
am in 1.96.
>  +pub use crate::ptr::Alignment;
> + use crate::prelude::*;

Ideally we would do:

    use crate::prelude::*;

    // TODO: `Alignment` should be moved here as well, Rust moved it
upstream in 1.96.
    pub use crate::ptr::Alignment;

since one is a re-export and has the `TODO` message, but apart from
that, it looks good, thanks!

Cheers,
Miguel
