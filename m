Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794910619;
	b=1CqTsqG6txhnoblzTZYYLKW/IeUxq/pGcdNxbH7CfFz75RNqDQm+XwXvYfG7CwvbRiey
	 eGjkOJRt5j/323hqXqduMpPJNXQs/PeX88fOrHtgWFb5jI7OOIP48D1Vvix7MwrmjnicB
	 fEvz0oxrNG/BUZJIJ5kkBjOS9Az0WEiR9ptccAhZKaT8412ec68ctFpXj/bDYS+L0PHFX
	 YCj8ZBJy1lhglvtCd6IImx+Byoz0Gdctb1yI1c3v8tFBxGywA3BqXTHtAO5gTrF268mhE
	 75hSqMEveRyGbrI+DA0CZVr2m4YoAbz+RpN7Mwe2H66W777z4kZXcVRwjz3tH5Udczw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910619;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=UZWhukwqk5/uGCEKqY0bYXFwIBC8tPpLJC7rUK68Cg0=;
	b=VT/YxzIhSLpfoNuPD95/xpC7JaO87FLYzr/ATue6wsBStj7otomhmoa+GZ/X+P8zHSjh
	 6gWdzNdDnksvpXcFTXie+5LRDLrFu2FoGf8ArRAgg8GFVMMXDp1930hfe4vBVgyIPcdI8
	 FZnpwV33PzhHLkv5z0UgzLFong1MkTsOpr9J3NfnBVRibaRKuqLvXbKCEhNEkExdPJ/aM
	 x25MkV84llGi+IM+CSpIh9gDdBD/O+OEpe0OR4yBPu22kkI7aKuCJaBIhjYe3pVstP/zK
	 6BXi1l7khR6gaSEn0Hs20uWVuJzFqZAwP/kRPNItQAtP0vlMiEBjvWFbOFkEFxIc8EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NQYOU3d4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E363606A33E
	for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 10:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E363606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NQYOU3d4
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 10EBF20059B;
	Tue, 17 Nov 2026 11:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794910617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZWhukwqk5/uGCEKqY0bYXFwIBC8tPpLJC7rUK68Cg0=;
	b=NQYOU3d4C5zwTKP1yxgo4IvBYJIavjBEMZdoxF7vSS8EVjxN/q85SQY/B25rrbX+Mc5eJL
	UClh4eZRnPyhuIfhPjzoXD8umvMGH5liHs0CCvGwZr/mt00cjK9H9TtEFw1ERVXtwTydD0
	fa2Mq/PEvJ+2nFE8/AOl2d72zUmv9GaAlv3f6jK+EzIR8aYD68aby5N7nVAJDQsIa88D/K
	25AM4Zqpz0SFst3Ql3Gx1WpVm+UxA2kDVVW/TaUz/TZkwrZRdpNcpCxbEZhr6+csm7LJLZ
	e+iJnQdMX06cyqLU0yK9GTQImGDGokhUvhzxt2O42iCNvAtTAuBnAPiIP74R+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794910617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UZWhukwqk5/uGCEKqY0bYXFwIBC8tPpLJC7rUK68Cg0=;
	b=Kr8ZjPDDYOdK6pv8wvtOnZ3gPn4nr5DAxikGDW91Vleof3sGt0jI9ya23HxnDrcgdNYdZU
	x6LJePzFHk4rMXl6p9fZ9j15Rhz9mI1ggI5FAxBoheoPs4Mf2njzOixERrCWjlVGI/0i9r
	yfREFtJ6t6uUSWrlxX6SVODDMXLK3ll1EJD1QGf+i2F66yN76+4B1vuAtOqchpEfaT9eDC
	agDimXqiygLsGdIp/jw2zA9zPXCwIr7Vcjb4JgZeBVBI3At4f9dXUJORZXZwiIF/hJ2VRo
	A3BX/80Eq7NDFvyQ5f2WE9fPOlKxRKy04b9nwPkkV/WkMfUThV7rf0x/Q09dRg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794910617; a=rsa-sha256;
	cv=none;
	b=ZUvFYemGBSKKzCcqvv8+KHa0h+1Fro2tCJB/zyde3qKAmPykxEx9tB+BSFDRqoomOxwes0
	rVtQjpmoOgfhmp+LcRyTcje2w9jktmq8yJlHi+Drd0dKJTWJ62kRVKMnqh0m8rnYEw71aN
	rqG47Jix3wrs6UlGxjmUWtWBxB9kmdoCX7cogDouzXtyCV7d7jmiENYCxbcDZgw3GQl9Ye
	NMXx8aAHEHbsGQHBhKaJw8NkdiZAkbPfbIx69IOATAzmf0eSDOeFlQdVi/3qcpteYoQq/A
	TDPjWSq7AfwC0Vg+RVH8/fr2dtLACaXqmuaC3YOqfDLQFncL072X6w2Kj2jS8A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <0d9724b190d94495ff1ba266cf1677c7f53fd543.camel@pengutronix.de>
Subject: Re: Moving reset branches to git.kernel.org
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: broonie@kernel.org, kernel@pengutronix.de, linux-next@vger.kernel.org
Date: Tue, 17 Nov 2026 11:16:56 +0100
In-Reply-To: <20261117082157.494071-1-geert@linux-m68k.org>
References: <dbca57be9066a3853236a6395a7fccd8932bb65b.camel@pengutronix.de>
	 <20261117082157.494071-1-geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Geert,

On Di, 2026-11-17 at 09:21 +0100, Geert Uytterhoeven wrote:
> Hi Philipp,
>=20
> On Wed, 01 Jul 2026 at 17:42:07 +0200, Philipp Zabel wrote:
> > Could you please update the linux-next repo urls to pull the reset/next
> > and reset/fixes branches from
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git
> >=20
> > instead of git.pengutronix.de? I'll send pull requests from the
> > kernel.org repo from now on.
>=20
> Oh, so that's why my copy of reset/next is still at v7.0-rc1...
> Any plans for an update to MAINTAINERS?

Thank you for reminding me, this is long overdue. Just sent a patch:

https://lore.kernel.org/all/20261117-reset-git-tree-v1-1-85185b891ba3@pengu=
tronix.de/

regards
Philipp
