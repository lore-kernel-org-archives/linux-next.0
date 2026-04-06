Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390CD3806DA
	for <linux-next@vger.kernel.org>; Mon,  6 Apr 2026 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486089; cv=pass; b=rGokKEmn0duHqCcc7Mday8xsQkrTiOQAF4zwXs2P3S+SKap3/71nuUvIMYj7ocP9HMMKtuzKuBOFBVc5J1ZugybVUMZhgBrzFXew9EhN3R5fGL0z2LUDQfLNDGSxPjegosJbZZ2jmyZQ+4xRO+apIL00JjGIHuC1sE2NSi/Zap4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486089; c=relaxed/simple;
	bh=txc1GgXszHVDSxiwgLcr3FoLM/49u5UMyHGBJqURxJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYx+QiIxL2Hed8yufesV7opsBEqfuLYJcgd5NJtDbDpqW5Wnfb2FmpF4uKFGfwdgfl3xWfj8zdt7k6qFFgiFlY7h59g/aud6tShSZvEZ38PYpDYbYtQqC5Ze5x+uWADidWtekIRabKioZcAMbFgrNyTOgMRKkyYgOzzLbWXbGwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jayoA9dg; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jayoA9dg"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12736a0147cso226566c88.1
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2026 07:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486087; cv=none;
        d=google.com; s=arc-20240605;
        b=W+GsNRkdPJR9JUDVx85sKbc3hVwhY1XanV1hdQYx789z1ak8cPhG0lK1d04TriXJQ9
         WM2BSdjok3fiv7IxwgLAniZv2xoKAMOjLsZvRsghxzcHlgYqTcOEbVusN3V0eeo/jHcA
         JN7E71iQscwjKKObh5IBou1K/EvFIYJkDYYR4a1Q6k2ixyW8s439KO1V58hi+Wf3BIcv
         KKw2Yh9b/5syI/cGIHCXrbEkwAI8yGt5ynG5qz4SzB0wFzs8C3xGd5xA+7xTK0C1oKPV
         xgcYJCDeLtrhl2CNS8UF+gAjcsjIwUUw5PPBOBx7c3z5DQeGF7b1751Dk2H3h4IeCaCa
         9vvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=txc1GgXszHVDSxiwgLcr3FoLM/49u5UMyHGBJqURxJA=;
        fh=+GhzwcfqGIkfIgFJ4f0uDLdcJiwWYBpGJhKiw0RMt8Y=;
        b=U+mn0OppXQl8jfMKDmDXUFEpwMlrF+6NFkWjyJuSnTBICQ4EeCr46qUSRanVDM9szj
         GuY7YPUFv2k4E8yQoXsCuV8mQJD8tUT8iyhE9i962th0U5QtlptAitfV7bXZMwjF8p/u
         YiXyD1Figqh/ywqu6YZNxIpUy4GuV4cZZ8o7fyM9jzpwlEtviNJZ4yZJvmSrh6HmVuI/
         1JxgPbMmf7Wc93sibSWYhirfunrI3+1zMMVJXotS92xjOrI2lVP3BbelDswvdt3ue4fD
         NIhCIOs5IqZIMrJEg+L+nucYpYVBCc9evyKd0p2WN40gqEu1IOIfxMHTQNJydT8OzMbS
         fang==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486087; x=1776090887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txc1GgXszHVDSxiwgLcr3FoLM/49u5UMyHGBJqURxJA=;
        b=jayoA9dgIJM/cTsAdPEn4mfdaDHggQ76xCikP9fbCJ1p7TBFgDyCKQ+AqDO1wwYQ4K
         cPqk4u+f1SOOPsnnDNu/VsXLvpkUAC1udr6Pa0vmHrp9iI/0c/HKj4gMCVH7JPG7P4hL
         /ymX65EQpmJs5uqWGNmmoEBMs3xkCb49lSkMQce73YNdY78Pq5FjqWMK9fxczd+MjV7Y
         jjIDbNS270vsh9oOD33ZKN6n7rd0Obj+rZueFKvXWxVQ1KBTM8bQ0W01HP6xbmJESahA
         41eTs2q7HbP7MqG5Iqnjucr1ithJPgYwPwQnEEv2VUTV9xhOo5iR/iTtelGP4OiMpWWX
         qYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486087; x=1776090887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txc1GgXszHVDSxiwgLcr3FoLM/49u5UMyHGBJqURxJA=;
        b=h8oPjvdhmTihWYJMt6WMAq2QPE/FqQrBLC547cG1ZP1YNuXFR7hVVD439/cNkiBCS4
         SPQ6Z7Qs2abOlaiw6dCQuTVHKDf+Uyeqi89VtyEuFW0QCmI6mToEc57d8tJ9rWMkUTBV
         qA6KTuvBzwgr9t6f3PImUlKqUmHGPefqrcM59Yh8sE+lvfJ46hAJB+sZ7GxYlhM/rYP6
         g/3KTG/uXooN1vhQ+sxERyyX3SpajuRORZo6gdBPrbPSZ7XmifIreXalqKHZQ8KsZ+Dn
         UpUgMaOAEcqJ7zOQdVP2CXO5KFgaO1GryUT0OdrPcoOGsaicPa2VxlBpwqnDHpm+KvDm
         o6ag==
X-Forwarded-Encrypted: i=1; AJvYcCWn8Za3zhJvYGOYs8Pj/Tv3OPB7faxr9nD3M9qXohVAWJrbV35mr2Ss5Hcf6xJ0JUdML2zMViNRMRW2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5YQMevSHqAbTyuGoc31WkyKnb/GsKtL+UAiuPyMBC2Cn2JyFs
	KxSXLA1GCRLZrhAS7d2T15WOAgndPFZWJbD9orJotc5BGVm3w8vB7gqbif5E4Q15XWnBc5lMePZ
	tgf09R6tralo2g9BHOJThXrxqo/WMREg=
X-Gm-Gg: AeBDietzgTHRkwoCtnpmaW6Ws/41inPwxnX+ulrfuvZC4m1kFxu5zHOPr8vr1CfzI4z
	FxzLAYuxf7rkSbr6MQq50S88EIG/sa2yabbryj3NL0nc9KvDXFJ/bJeVqSXTsDKox24Ye6EQtVc
	3J+TXVy4J47weOGtE/LDZfgqhS4tB3X7AUXuF19umAJub2MqZPLjEOkFBmDEHkZAdz0ZUmh68Ss
	AEw5yj0GOLXKClHzFM94ctXw5orxdlM+0TL22ydE0mtTJH245LcLLbWYaTcchjFyp4ydmFDUjEy
	Gl7nRp9CN5jIeEwfAwc+5uPtGSp1rnleIFYcft/gaQ3C5LL1l+sSSX8FUiaqvkvJ0THVUolDQuR
	ROgp24nAFklTvkagcqUEgK4E=
X-Received: by 2002:a05:7301:2f8b:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2cbfd5652c8mr2525685eec.5.1775486087120; Mon, 06 Apr 2026
 07:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adO3fzHT81hnO2B4@sirena.org.uk>
In-Reply-To: <adO3fzHT81hnO2B4@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:34:34 +0200
X-Gm-Features: AQROBzCX_P08GU-8bqwxCda3woDdlNoD5iWxzaK9HD93KlyqVNZ07s90bW7xWu4
Message-ID: <CANiq72=On8c2zXqzkyyV7rHGu+r5peRzhJCFf1XLS6wjU-RktA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 3:39=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks!

Cheers,
Miguel
