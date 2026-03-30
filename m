Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9541B4257
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900803; cv=none; b=i1c5hC39ZNjhNySkXecnyCfsHGtJ9sralg9ilQnlSr9LuCaaJtSkEQq/I/1UnjYUztK5i38fvkvvPJQY9wSV6JCFieI2+9eu5172N6aqW9F5LeuK1SMcJ2onadmoifmZhWtwy/c4BAq9/hlhy01EUBCld6tERD//wfpn2hpbF9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900803; c=relaxed/simple;
	bh=3JvRu2l1oz6PycC3pQwJg3VDuSeIE7T44GfVA0Ygdb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lm4X3PWcnyT4gTTxAYM8j8+Szldzawl0wZutn4VpWfgN340mn5QHOisJ+vX/uQHbo4GMDuKsweS1wMUAIsaGSLl+0VGCW0edDowI9rqnmZP+VsE5/nnK9WRrqVW5uZAEcaWKZutAFJRFiNsCvVqlNEUZb+NaZqztDCUGRWOIQEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCsfcvBv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCsfcvBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332B9C2BCB2
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 20:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774900803;
	bh=3JvRu2l1oz6PycC3pQwJg3VDuSeIE7T44GfVA0Ygdb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VCsfcvBvRh2ZJEUq4JlM2p5INwtIN43qie7kMrIsvgjInqpDQSbkFGQPxQkBET3WC
	 0QQ0VLY2OnhL0nKGpGBWX84WaXL7bp2nSHkGddCt3jio8umtM4N9RIQql1s1snuhdv
	 zkwcTgHDWFX40Srk0WkXjFr6INCNrjPJ42bcH13diu7QBvn5DyVaw14M36UvIw+7OO
	 OczBnzkTq0lPGwucTSwghCfpQYm12L1XE4ObFr6xX5kokvbbUfIyh/qrSwfFLxlPdZ
	 6nX1I7d9dN+QvG+X7LNtulxAtKpPg+wPaxzuBZD1rFpWPJuDSlS7HzJZ957VS7qXwg
	 LAZpg8c93jp1Q==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-41708f6aa5fso3510934fac.2
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 13:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVle85DZKO7T1Z8TWDJ2892biNYFbS1RWHy3uQFo2n8C7IdcTStcgxstTVuch2IG/J6bLdo1u03OoCJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtL8GQubgrRb7CpryMXha/3e9PTx5Wph8x6dbf1h4XuuvbLLWm
	B0rgJkJCDVVrLAutQt7n2zO6JJCCvyvN0t1f8839b0i/z4y/8F1voZ0TfKeNepe9JYNsJ6+MOGW
	ncCRCjvUh5PysTfLqK4PSzQBw3XX72Wo=
X-Received: by 2002:a05:6808:1493:b0:468:698:a5fc with SMTP id
 5614622812f47-46a8a5961a2mr6026006b6e.31.1774900802300; Mon, 30 Mar 2026
 13:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acrVduPfV42PD2_q@sirena.org.uk>
In-Reply-To: <acrVduPfV42PD2_q@sirena.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 30 Mar 2026 21:59:51 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j2R-vTM+Zaq+hWgC7F7HxaOOHs00zL9+9-QUHzUanRhg@mail.gmail.com>
X-Gm-Features: AQROBzBUSOiY0-DpR-ufhvIpXh8tvMcfoPpmBwF9XKePGj30Vtm51lesmCCc_1E
Message-ID: <CAJZ5v0j2R-vTM+Zaq+hWgC7F7HxaOOHs00zL9+9-QUHzUanRhg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pm tree
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 9:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> /tmp/next/build/drivers/powercap/intel_rapl_common.c:1143:32: error:
> 'IOSF_CPU_POWER_BUDGET_CTL_BYT' undeclared here (not in a function)
>  1143 |         .floor_freq_reg_addr =3D IOSF_CPU_POWER_BUDGET_CTL_BYT,
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/powercap/intel_rapl_common.c:1150:32: error:
> 'IOSF_CPU_POWER_BUDGET_CTL_TNG' undeclared here (not in a function)
>  1150 |         .floor_freq_reg_addr =3D IOSF_CPU_POWER_BUDGET_CTL_TNG,
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   6cec0a0079bc1 (powercap: intel_rapl: Remove unused macro definitions)
>
> I have used the tree from next-20260327 instead.

This has been fixed already by dropping the above commit.

Thanks!
