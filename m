Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F93FE353
	for <linux-next@vger.kernel.org>; Wed,  6 May 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075473; cv=none; b=s9pStni13PZj3rNH64w/nmLiQOEe+VvNfh/+CJknZjT0B35l9hcUJRce9tnTxNI0vX5/SjCeUFdHv7DNXaINi4DhFNphxEU2XFaCiM0tUerZngZatqEnNIV3eFsA+RfkusLVumyKMOJNtkUoNU0WwaIdE3grQ4Ve2sN7tM8NNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075473; c=relaxed/simple;
	bh=C2B3QxEKafzgtpLGs/t4iNXlXg9I1G2zhFlwP1kffJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP/4aO94oyCGP0pBgxXVE7kEYEGDhhUgi788aHYDJYALEPpqE00T4T/OCnEni6YiqjGGKqAg4MEu8H3MhzRWptePNyaG7GwcBwXVDVkEfDiTzB1xe2vQoH1m9fZFnrr0rIntAXJbPjX3pBXTBvqROMP9vkX91nUOfXIS6zHz+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwVf7rJ2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwVf7rJ2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso57695215e9.2
        for <linux-next@vger.kernel.org>; Wed, 06 May 2026 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778075471; x=1778680271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Romqkwo6S2kZ4wlk8RoVw4poKmRE86I0F/vnPSwbKgQ=;
        b=dwVf7rJ20zbhIaUHSbAWZpvUqSFUPvS9MreEZS45mn9S4pAs6s0oiaUIOlGhYkezEE
         qUgJmCKHuGYgI8cHr2TARqWX4Rae7eidw0cFCmmSP89YahTY0P7PTeBZzLFAxG8pcJFi
         BD/nLLA0EX541OfuKOYvBGaeaw7u0mU5jwx7c/m5sDEhq3eqyrZhXf5r2D3LZodon2FY
         HnUjvr4a07X+d3n9HbMnoJ0mvcAEI3X017Sns51mOo1EHiRpadPhI/zWvuK1J8b/xYma
         J/3zCe5Rw7cLFiFfAbURudJd5iyjLAYtzh8rbqHL01GNugCwbZbSUMAqu2ABk+a4fjwf
         iY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075471; x=1778680271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Romqkwo6S2kZ4wlk8RoVw4poKmRE86I0F/vnPSwbKgQ=;
        b=PrZcaJz6+T4Znc1/vzByDWvYC5yMzf+DR9UEskXx980avPNo/tPLevbxZhaGDsPLST
         Zm8tWPUhkFx5i0I8ULpUv8xps8kV4czNQywIy0T8oRWzMGEajxY5Iah0YKc/KCUzmuXC
         eQGBbDA6abzL4XJZiA4W7L4hAS0fGhLxMk03MJhYUidrVvHoGojpe4COvNrRwNWr5ZGI
         vXXwQFhZq2LW/t/QgkxfJxhXFi7DQDRfiooDGEK8L0HTrqSi+RF6VTfLXC1M8tgnD/i/
         Ro8m+rL7tSKrD7Mm97KE5Kq99hfgkz6mQEQPplNl/M+Rs/wUReHf1PkPG+X9HcyQiJ/X
         gFTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pr+NBA99VLXdwnUfNlanTaCKtdO9sojwd4p9wNjslnz0q8W2Ardf6WiMElGv94fvd2CsmLQyqyIo8@vger.kernel.org
X-Gm-Message-State: AOJu0YwQezqsJRHBe2Rxk9V7EQDM5BmDGnVyrIeH2nsJbFgT/muc1Pgr
	ax8xdQnC+5vWFPM1VpAOAL+t2AcYBv+1+9g11h7Reuy746DfiEUyh5dhdUYA2Q==
X-Gm-Gg: AeBDiesCdjQYzC23zwFWbLwq95fTSLCkvFPF1N6bTs4JGySUZd5aLQX+zxy5Pw9X4Nr
	sBm0XMXcuS/QA6Do+0HPawnPHAIUEO0rnhxWFWQnH62mqX6Fz1m3QAmcbXYJqejOUIpjIcyTxJV
	bLRfECeNb3PYdvUUbPGQZvG99DoWfyI/7zBrZAR9KbbBj8BSg59BpNyUo7z08fcavfaUuNgiefg
	EL//LnG/rEmdOeNUljx7zMIG4ErWKuDmrHPH5EM3+7HgJnqWq0yXArA13ju7GJuv5bDy93bEYEC
	bvxvuxwEGvrXtYHz9eV5c3T6Nz6lkMoBWk8l0f2F3A5TZXA2421hpH7KPssROlpd43zaJLGFwM5
	W5m7IKYwCvXRu+RrV7IsrGPXZDX+Np5GV4R/CcC3G3zKzzeclTgymjy+Uqq7kXMJQH/7jObHqF2
	k4sWvgt8w2XHfL4J8/v8M0DKbrYgYU2G8Q5X+WXfShe161vFzF786cH09VSu4/eKU9+LoonsIod
	our3HpKo4RL6AEqfQ4nFFKO
X-Received: by 2002:a05:600c:608f:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-48e51f4b0e1mr62560885e9.29.1778075470546;
        Wed, 06 May 2026 06:51:10 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e52f5d299sm27927105e9.0.2026.05.06.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:51:07 -0700 (PDT)
Date: Wed, 6 May 2026 15:51:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Peter Chen <peter.chen@cixtech.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the pinctrl
 tree
Message-ID: <aftHEpJMopvbeFKu@orome>
References: <bdb98d48984f53087669d761f771f72e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k65yh3sxj2pgdnvr"
Content-Disposition: inline
In-Reply-To: <bdb98d48984f53087669d761f771f72e@kernel.org>


--k65yh3sxj2pgdnvr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the pinctrl tree with the pinctrl
 tree
MIME-Version: 1.0

On Wed, May 06, 2026 at 12:02:09PM +0200, Thierry Reding wrote:
> Hi all,
>=20
> Today's linux-next merge of the pinctrl tree got a conflict in:
>=20
>   arch/arm64/configs/defconfig
>=20
> between commit:
>=20
>   2fd3902c91c8 ("pinctrl: qcom: Make important drivers default")
>=20
> from the pinctrl tree and commit:
>=20
>   517d8fc52f3c ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, an=
d Cadence GPIO")
>=20
> from the pinctrl tree.

Sorry, looks like I messed up the invocation here. The conflict is
between the pinctrl and the cix tree, obviously.

Thierry

--k65yh3sxj2pgdnvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn7R0kACgkQ3SOs138+
s6HK+A//ePgSo1BMgl+EOK9wVSj+y5z6jXa6eIShTLILJIKIPqfaNF5ccp53jAX4
9SAec/LrbQuKweDxHxXtZdg9ztaF2BdHyePSIVLjJurFanbqtLSnAQvTjBJeL1t6
GsjVqShazDm9viDGaRtGNf9/9wY72eodWDDO5Z4EqB6KCAD+EFj4yebRIGuvCOW6
FKxeulzaCMyUXSmxcLxTCu5/yHmSk20Mgx2qmzxXRuVSP2PSH5+1fnVTknbh1xlB
5LhMatY/NH67M6WcNmp8aTJpdJvWz7cTCMPdO88sa1OYeArEgD4yu5y0HtaLHW18
m9me9AkbVarQO7c/O7nNTWboUj4wL6TPhd0D/uhIBbdsd7Dz0kRBCaxjQ9E4sR9d
KKKwhhPIkB7NS26CZvG6f4XBQNZ1FFN9Wtmm7SowdOiuxUpeAA1Bij28o+GXoMiI
EevYSAT8M+E0awMVRXG9hL9rWbvqvPq6hcCpFhslQkUHItj5mu2MlvGPJJatZjc6
cZ5tG9Kyln4KuL3eXfovFATeI/6Y+4ilqkA9vp+4CFiPB9f+C/yuWGUHFBnC/r9P
l0eIuIwAODTMGLVINfSshnTPEqFUHBvQlIXVhWXnG9vXie9qwEEODIr9YBPpmS68
gx2CerZ9AradZ2slj5o/mo7als7PZhvmzz0pkS5LNDppCk9xLYQ=
=drQ8
-----END PGP SIGNATURE-----

--k65yh3sxj2pgdnvr--
