Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448582DECD3
	for <linux-next@vger.kernel.org>; Mon, 12 Oct 2026 05:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783494; cv=pass; b=a994bVbFwgteVJwP8HRlOWtWreFZ/nDs3X4cA2OPEi/B1broT7w34Gh6H45tMMluaIbGseJqLmLi0Ua1p4KpcvoqHQbuK7+rxczFLhQdV6/l+lgsu8VKiurK0pIYgDK7zGGy+TZ6pOhlOOrIFPZ9wKdCyUZSYB9Q/7yx5huiA8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783494; c=relaxed/simple;
	bh=q/vsbLDqNIxroouHOirTtynqW4F0e+W2OYo/65wuwR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhOUaxBCl9sWWFpw1a7LHJGu2XgCL1KyOadKRCe3Cp3cDpZ52xGYt5W+f34hfL69enhKNe0bAULg2/SrRv6udCSqDr1OQTGT0YgPCRq51w790LpDfaooyqCQoqrYM0tQaXNQ1wjM4cFELbTxAHPcdnjbixaZD+BJkMzDqOh/MqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b44z2oPq; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b44z2oPq"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35a0ae8d711so49489eec.2
        for <linux-next@vger.kernel.org>; Sun, 11 Oct 2026 22:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791783492; cv=none;
        d=google.com; s=arc-20260327;
        b=Sz6R2ca91XieMfnKyD+7yYe/A3eCAd6fy71DkOzAC9PclVhYY0JGxVdKzefrYcBhnm
         heyia93+qMA7A8r8J/w9LpR8kgg8zG2FH/d92T4yzVIlY5bmNrCrikb4vE+Rn50G22lK
         BUOa72g7VZu+G39Tu7KdYIu/hZmgFX7sN0bujRXxk2+TeIUH1ia5j3PpH15XOO7rdla6
         +zu/s3XPjNw/Ifu/5O3V1NFlZncqmY7vkxbR7RBvv6paqs6wqHCp9NwVItUzxbCu45mp
         92v8Bf3PVjUmS4TtkdOhBGPyL/02VLeY1QyvTIycoLVvvdRioJgYlfrx1/dvtu+E7NLY
         nLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmzHvGtB5TxigZaL/P0x9o6uBl4oEdsxdSjT3gtQ9ks=;
        fh=uJ3MzWYtAJaUzmirgEqZRNugsM9bgHJHCCbwfLdHPmc=;
        b=JpXZdNHt3STdtoNATrBgNt/yotWp3cVzm5H2nW51w0aMK/QuGU6fV4D9l1Juyck2b0
         mYTc+sx+p1zmEzgCmEFj9eGBZvFVFMiEXJtmZ53N3/E8+HFaVI1f7FntjcwOehxRwMMN
         ymmqs5hn66xug3DhsuwTVZJiA/ZwICm5GoL1+3gYpsS4nr0Bg1rAwLvBV2mKKv0cbUJI
         KHPDUdwqYdZrw/pjUQvR49vPBh8rfRn364a8zQerOGIfN98ns22SBm9ap/0Io9w20QX6
         0yUfPGj48kuOc8SwLwDBlXf4AzmlHmpwU7FHZ1GO4O08rfIw8CFbgfzOK44szTmH3Qm2
         9wNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783492; x=1792388292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmzHvGtB5TxigZaL/P0x9o6uBl4oEdsxdSjT3gtQ9ks=;
        b=b44z2oPqys/uKqr5Uye4S3OUHIlaQMAl5dHVfWhHs+s49K7b3kJEoBvXGRmOwHBfBJ
         8W4c0/o5LqfqQ/754MsKytKh39QWGhlZrmDViTK4JivGV9HqYVHuUgp6WLcEw3l1A+9G
         gAMvM6Xps+jb9Pgjm05y7cbXJYOMl5KyXeZ1sOOUprImtA+R6+qL4oglaqKVAByyNgeC
         guUvEV/Y4ntFP+la5HbM5HkW7WhHmhQAoHzfV8zOCXulloGdmS3C2lV/02oOTj0II+BU
         z9Tj+Elpy3wkLNDe2PyowDRAVe193k+XLHtTo/v1rldEm5iRaMe1NlhMGBl4aYZIBmZR
         pYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783492; x=1792388292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmzHvGtB5TxigZaL/P0x9o6uBl4oEdsxdSjT3gtQ9ks=;
        b=GOCNu630XrSPfeo+aRXwVUgkwVtAbiIGs8pa8+4r2gQOPuRZcjCDQtxJ+e4bomYhb6
         aixMdWrf72J629xCDH3SodT+6qocDC9kqnF+Tiwxyk/94PljcEJeLeSjvW6Vq37d3Ibh
         PTt56lrHHC7qGBjnDSdKpxWZhHFzZUOIM6qfm8Zw/+uIt6OmLRq0IyWM4H1a0ELNyG92
         Xl1rA69d5Pc/dxVhi+ExvTd28T5/5XgW1SNPYLOp4EBJQSpF4/A66DWBlOsqhKRJ+bS5
         vBFeVinq6UnGA/2E6JLEXRGOri/hxivVjUP3RIAP1U16dKMweyvzkG8FZCNgFyMlJt31
         vDqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaKyjlr5G4rHwfiCGHwgHT4axfSQLpZcnbgOayi+/3NeI2LxCU9/f4miajK/NOFm3uzrv2GvhxPSHw@vger.kernel.org
X-Gm-Message-State: AFq9FYI4fnsA/TclU2YruQh96lFiyY3ZSVnfJInRcVTltqFdFlYfUu82
	86KBgE0Rx1AkcW38lUdkyLFdkbNaIoNaeIwYj2dBHxr7jUX4CFUjDjO8Dq8qI2Os8JEUmWrOsDE
	JXHNpCqzxLmcm+aog5CmOjUH/Nf7s3e0=
X-Gm-Gg: AYBFou0Orb4GWG55kD9ru30PMNuFGTlmXxTrJUfb0tD6M/jvZE/cyrZFYGhAm2pm/iF
	Y8ygn2ZMyj32NiHjmxR0U1IEfDh0i+bJqWuKKgfPbxCi3EiVsfpcKxA50Np8nNu9U6tCkcYfTGL
	fDf864xP2dgPUsikdW70J4bsKn5U8XJu08alLhhN5cElbJgewm0QRdM80hAuHl13B4l80vfe5ar
	DACmXiu08f022yWpbP9wqAcMM7xMb122oCEMhyvqixpL37Vyyxvhr/BnGdHbxq136ZW8pc3ozZZ
	2ejNcS2XPYrqM6K/JzCbh8VHfPJu4bijXEZU97uAu45CAfW4xtoXh21CimhHLdQTNqkSCgWwPDz
	nmanYLvRnY4ztRgL61tqQ1MRa/1VAriNRQEdjNXnDVIgX5OXamz4IaUmRGWF2ArLd80SvjnHydt
	cy+HrkHGsz/QZZn4iyqKh6tQSp7MdtqUiCW0QMhU2Zj4bixzmwjcDhLdewwnXFRg==
X-Received: by 2002:a05:7300:d18a:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-3537e04365dmr19340269eec.2.1791783492250; Sun, 11 Oct 2026
 22:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar-cWpOhcuo85ttt@sirena.org.uk> <CANiq72kOB=NuaeUz2i7m=uTmezf5Z_+9D_njCfCK-GsFN+S63Q@mail.gmail.com>
In-Reply-To: <CANiq72kOB=NuaeUz2i7m=uTmezf5Z_+9D_njCfCK-GsFN+S63Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:37:57 +0200
X-Gm-Features: AclHuK-FSxZnPKGZMDXDDmFd5BKHyi0oI0Hh_m2npHQ0vI3S09UznDsFRSkUblk
Message-ID: <CANiq72k=gv4FfDii_ivVDL0sAKaLZ6e7XqOc+qaVyXY1heTw1w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 2:24=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Looks good, of course -- thanks Mark!

Actually, now that I was doing a test merge with my new pushes (which
include timekeeping above), I realized the merge currently in
linux-next dropped two lines from the description of
`RUST_BUG_KUNIT_TEST`:

          These are only for development and testing, not for regular
          kernel use cases.

from commit cd56a1c858ff ("rust: bug: add a KUnit test for warn_on!").

I hope that helps!

Cheers,
Miguel
