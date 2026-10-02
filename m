Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F43E366562
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943903; cv=pass; b=YimRNlDLJkLXcLqkAiQKK4SIC5/qzAs5bWjnmskh3i2rTSsHolvFLmnIZEQ7Pv8KXGUUh1kFVGhdHpNFtJpK7Pkj8HHWvOJiiVGPsYs5iAHPiiDsneVDGaJ2HK4PuMBKSJakQ9gR5Dp6JImsfQffzBz1+idc/XEThzjY2MScu20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943903; c=relaxed/simple;
	bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWy4J4U4a61c38aP4MgG5x/emZzbXx9eMCKaZGDx/HxUHJHwEzKazCxhJK0qqsJfaPjMbShJgbJAc8RwqPpBzLpH7SPCSZGpGDwWS4D03sBi34wgYh5+O0k1Ua4iRrR8Pehv6lV6UhJ9vw563lKo3mNfm35FFfR0LlTBv199W64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daS/ylG3; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daS/ylG3"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b482f7b79so418437eec.0
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2026 05:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790943900; cv=none;
        d=google.com; s=arc-20260327;
        b=o7QQVdfeyvOMXAh1KJNZpXr4cXEcyYrKZ8tYQk4P23zQditLZUUsQ3isK1as4fyQuk
         R15148BhwykyAuvr6l56btzpntdnU9eTM/BosY+BuIfO6ahxRh/aoIV+5h6DT/fB8zzp
         jKfg0A0dnuRDODl2NWdesKgXb9PbvyEBBW2kppVXp4YAOxB3U29woHivJv3eGN+pmsLP
         x1JbPxE9nQQHqyCCpgaNPyM9VTmzZ6qHRBJMG0zA3TVH+9+wOcsF2cjgXib8nA2YKESy
         kTm1u1g4X6eBJ2QROj1xlVITF2xVqt2SMd3vuYjxXmxGa00gkn+TwABxgRjWam0JgWS4
         iiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
        fh=3yPrv2K+bpEIdnd5t5+CoINXp8tZ+9TLaCFNKGKWYaI=;
        b=cTPwiA4bDSRsDxri+Ie6BlxzG8qZgme7ua32vFOlKufP+FdvyFQ0lP+CO4R+Uv4VJB
         i1Gpmh39zpG+VddrVzMPbzKDHcOtmJ/CiTDzW9pydTCNkLudZaAUYLi1TCTM7/Zd7svI
         U/Dm0B6O6Ss+zJPGlI5NhEITeUH9DjlbVL0cyXKEmPBqidvoH7H/6LMF0JOEHnueQbNQ
         g6UZebD6z90XSBASit5OzfBOBI8o5S2a2MOxLjBLMTgJjIsJWZ4ihQfM4NgJCjIUr+ZZ
         Z6YDEToRVK5JJGDODySMtPFUXg/Jbow/a77H7cmXfbV8Xltw7oWfZNR6GMF2Nx1O+ZyP
         dSzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790943900; x=1791548700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
        b=daS/ylG37sk8HHR9l5NeHusHDzOGMmwmjIXDVUKJVREKsrKeT9cW8Yxacuu7+F6/lP
         8Whln29XStGkEXtc1I++48UCV8E8/fm3MCimrPOa6sxb685xfOYAQva/XzQ3EFQTHID2
         O5XT40ewxTZSEdSLrIjduCPlGrmbiUqKDGXMqgZjl63uy+bxQMRx/cZB3zvxZVOdNFW+
         h9EZHiBIi/2c3R9PAYtTpeezvVC67A81wZB77BO39BW3GEtoOuTdpRn3KKZ7EXPZ8y/V
         d4NtdyQtUOBN6po3/m2egGJ2h9Mk3CNSERK+2rw5JMv2AakUXGQO7bUm0DciePD5O1zt
         VnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790943900; x=1791548700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
        b=JJ3lxIs07NOBimtwLKorMS2LIUy9dBwTd3RXos3IKFIakDjeSfMg2wO2IEuN6UxqKw
         7PsW3l2png72OmkQfnt8yiryNiKRt4S0IfjBgRBBMEGaN1u07I6OU7F8ipMu+DQG4+oL
         Vri3ukIEAuELuTOLaY2qgnoADMlVJ8DeqMrZVtDKXB2ogepk7X3kK0+AEpF/TSTajm5M
         kYWG+eWdRErMDDQggxEascNxujyNrQClqA0rmEy1/W4UA4eb7riDnOTHWgKtRaeFPJ2Y
         57KtLSiJXzUFAAk302TBYVZcVbbwEKRguF90ViR+xSPDo/9BWEL+BCCnvuOBesxW0ws+
         3ugQ==
X-Forwarded-Encrypted: i=1; AKwUvBynzKCqYmg1iqzGmSNZAFu70K8yiMHb6HG1o1GxFRogemjMZtAS9iaPtQmxkxSNDzeIbvWvwp4POv47@vger.kernel.org
X-Gm-Message-State: AFq9FYJmflYk3O0m4iKXAzS5r/Hsoo4Cq3I8nx7Uad9ILStCwNII2miL
	JPJSNh0UvkU89CopEGGrCJU0A+sij5IPprDMil44NWnhCevAxGziYbGGqenwu1bnwpaxR6x9L5b
	lNkndOtSKLzdp5oZPc6OZJKR30A02qOQ=
X-Gm-Gg: AYBFou0NhoWn+b0qRYBqN1x72/fB3RjvPSHGZGVyOy12GZvQhjdO9W9UxkTAVGdbz1r
	TfFNsmTouKxQDEN3nOmcbAInqeGx39fEKjgEFovCl5PnTCSVJr/uYZA/FnrIBBRATNFXkqIyaix
	z5T+IUZKMQwk3YFY9+uVq0Ns7ndD4Zfoy0EOj2r7iQ8A2FxdyxCR49iqWiz1VWfvacO04nthwku
	018CPngR3jsKaSfxbpouxoz+YsAmuD4yIOg4VvUmcz6TUBVlmF9DEd6RJN3pBsYbpHWtu2XwKnr
	LHrkZgrqOlSMmIl6QAHYi+qs4LEG9dExHiNQeIEQmLj9a6QKgOEeZ21mI2Fpb20NA/HPfJBiM3D
	l1mZXXsnrp9AcceKTnozuduxNn7ColeyMtHRcw0jsQv8wcWhqXdOqL9ciRARf8xO5BeTWr1zRZp
	aaVMZTa8PZj4rgZpxCHKfORYNjVxKCW9rjghHgX6MTIzR7BqQJQWrm
X-Received: by 2002:a05:7301:18ac:b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34f06678c69mr4048949eec.0.1790943900278; Fri, 02 Oct 2026
 05:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar-cWpOhcuo85ttt@sirena.org.uk>
In-Reply-To: <ar-cWpOhcuo85ttt@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 14:24:46 +0200
X-Gm-Features: AclHuK_k-8l4icGOso7OUMh7asj3al2NOhpwyN0qJl7VrEX4X9rbgt3xGUxAe08
Message-ID: <CANiq72kOB=NuaeUz2i7m=uTmezf5Z_+9D_njCfCK-GsFN+S63Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 1:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, of course -- thanks Mark!

I think there will be another similarly easy one today (i.e. picking
both sides), if I am correct.

Cheers,
Miguel
