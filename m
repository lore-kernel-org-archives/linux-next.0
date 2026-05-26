Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455EB3246ED
	for <linux-next@vger.kernel.org>; Tue, 26 May 2026 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781895; cv=none; b=jS7UR24LwT+CoEz/WbUkgdttYgNJSM9xKP3LRaSRgNXVLfuZB5scbIeNMavWBJr/1vAIfcCTrT3SQ1b7Rkrm5KOvndmOXGRTWl2P2j/gmzLI2rupiZUHVIrttrcVl7qRp5oJRAvigdJNtHj1LkZZuFL0NeXkCwZUvPx14fIrO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781895; c=relaxed/simple;
	bh=RgP3fTuRhb4V+kcUWPeQlZmzQrb0waX9FU1S315rxJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hB6w9jhnnXdWogoKsXmUO19BZKWQIcUA0TRFwnMsx1X/Zi1+9KM3QrEFz3xqT9CCb/6dTpPoHcfxF3QFIUbIcO4D+D2hq6XO19Sv7d4fMklLDXAGYLIh0tUC0prin4A0bamJHMmOyCyqZMGgYlX+J5hIXP7Nhkry4MOxFxWVZuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NSvCwfU+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NSvCwfU+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso3244015e9.1
        for <linux-next@vger.kernel.org>; Tue, 26 May 2026 00:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779781892; x=1780386692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRtYftGbuLKY29fvP9SP1DOTQn9of7J4LtHfHugZ1X4=;
        b=NSvCwfU+rORaGiOVo4gQuMon9+CDLCru78u6aZak7qe081Imd9JMVRLHSX7R/1DG8O
         3312q75rFmG+Ah9EM7NELxBYuvm6Il4/PH1/RukhrVyOr4LJ1v8XGR7ItNc1UknlvMGb
         dTUbVRc74O6U/ve9EFOTGwmHR21BeXji3ZDhWwGRW4noFQkq/S5rBUhH5AM3TNVc/pwa
         IRae0w0AxJxSXV+XXxY2rLXQWxeR57IZeBlGRy3AmZGXiyjSODNz4Ub/+FAqwQsBuUkL
         V9Lc+CFu7IorKmGjEGP31ZxYy2ljf6rRtPrfqpSjZnGv4UabGIHzXP5UcuX1I0PKdX5S
         CaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781892; x=1780386692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRtYftGbuLKY29fvP9SP1DOTQn9of7J4LtHfHugZ1X4=;
        b=HWNos64QXC9ukaMC1237tWDt9T3Jd5TX+OWb3Er5mMV8DJuy6tzRK+pgRqgpwX1maU
         HArtKNfsny/Rqe+xMm1PhxQigVUEVXKbfkjSZbRL0Mv3cuaHKHnAxCubAMdQLGntEgNR
         NNOZgKi+xBL/bKCr3CjfuHHEHyJjgCcTmV5nwV9OwSxmBLJZuqmkb0rYPfUcWkYkbagx
         pV2Exs1NLK07+26zJbvii5vGc+J9a6w/Zkayo5NmJ2uqBSMOu9iudiQM67kNi0StqwF5
         Ii8AiaTCFJHx6/Q6uK0/ZHR+vE+O3L3XrrS0xTc6Q6Bc7+5Q/XS7nKPYdVH/LY4Tv9Uw
         FwLA==
X-Gm-Message-State: AOJu0YyNRyQQsksvDbMHIttk63I+zFfD0Vw+1XfmeIKjtaCQ5VrzdOkm
	cauzvOyiVlAz8XtPBkCFI3EjAM9O4uuifsv46IVrOUxWa60d6ytpLHEQRYExqSlpXVU=
X-Gm-Gg: Acq92OG20/ib5lwm8gvr43h22VNrHBHy5b0R6LDsgcER9au3arNqm/cojgZ8gujMQwq
	NxIn3c8dPAQc56wKEHb4jt0fOT4gnGTFpUdtWdVHQ47acNIddwKE8VaOIV8UADtdIT/Xb0FYd4t
	3QCivcGoSpwBoYJxtySwTn/K79Xbe/BX6xUapGv5iPVWejI0XC8Y42XdC9M9SUyBQgBma7YfO5d
	HbaBEupQM/ApxaUVGh4XrI6s+u55ETJ0tON7z63zg1awXt//OlFhpOPkc+E9EUHRtPf6yE33I8z
	JOS1UdY4lAtS6R18NXvydTlbi9JcjqpORfnO/YVvngI/FqPkeU8kcoPZbAkHkiH8oM/CWq/w+cR
	1qHOkdAITHC5K+dMkd3H6Cfxq5EemUSwARdo7zVOik7QICKko+CUfBQ90RajqljEOl1hj+tiQ0x
	g52Vu5zSuBkOu2XwK+gwkfO77nZ6CjpK47gvunGNEMBZdzKr/YwA0blZg5mnqfe42L4kESNeN8X
	V36Z77FOzDi0A==
X-Received: by 2002:a05:600c:821a:b0:490:5cd8:d21c with SMTP id 5b1f17b1804b1-4905cd8d437mr177658385e9.14.1779781891684;
        Tue, 26 May 2026 00:51:31 -0700 (PDT)
Received: from localhost (p200300f65f47db047ec792ae18ec05cd.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ec7:92ae:18ec:5cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490417b3cccsm102488015e9.9.2026.05.26.00.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:51:30 -0700 (PDT)
Date: Tue, 26 May 2026 09:51:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for May 25
Message-ID: <ahVN8WXF5WRX-Y_1@monoceros>
References: <ahSDZV9eR6zJ1pxG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ecjnlotartvu3ixy"
Content-Disposition: inline
In-Reply-To: <ahSDZV9eR6zJ1pxG@sirena.org.uk>


--ecjnlotartvu3ixy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: linux-next: Tree for May 25
MIME-Version: 1.0

Hello Mark,

I got a build failure and I think this is due to a mis-merge in next:

	WARNING: modpost: vmlinux: section mismatch in reference: tdx_module_run_update.cold+0x8 (section: .text.unlikely) -> get_tdx_sys_info_version (section: .init.text)
	ERROR: modpost: Section mismatches detected.
	Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.


Commit 6e49a980dea9 ("x86/virt/tdx: Refresh TDX module version after
update") drops the __init annotation from get_tdx_sys_info_version() in
arch/x86/virt/vmx/tdx/tdx_global_metadata.c

In commit f2deea555964 ("Merge branch 'next' of
https://github.com/kvm-x86/linux.git") the __init is readded however.
When I try to merge the two parents of f2deea555964 to reproduce the
issue, git gets it right for me without a merge conflict (in that file).

Best regards
Uwe

--ecjnlotartvu3ixy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoVUP8ACgkQj4D7WH0S
/k5vhAf/e4JqXWEpyh8O8lLu2F3XS++ywleLjWS2J9ZNWd/R7xm5w7LA3smw5Agk
OTMBrREL+EKBNq/K8al8ELHbZ02zNot6a1TAS2UVUo9AKX7QvbC/ptROCd1MfrDz
C7GP/6leDzS2RtgEYNntmc/buM4iPFAc93WjB8Geg1jeGt+cxGFp3AYiSfK37nWR
n3/LVPyAJ2QfMo5jiBNXYRSajo+Vt2frOQzG046A6C5fGPjJBFLQWMQYCv5WqnA7
iLihtXrohInY4fItQEhj9YaAI6K/aOKizDdJ2xkkoPtAwooSx27pTLLaty1BdaQu
aGnXSJExpOJYScPEOgtZ2Yv3ecmcuw==
=6p8I
-----END PGP SIGNATURE-----

--ecjnlotartvu3ixy--
