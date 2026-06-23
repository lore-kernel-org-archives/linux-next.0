Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1AE331EB5
	for <linux-next@vger.kernel.org>; Tue, 23 Jun 2026 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196837; cv=none; b=Y8QoToY/9KdY+AI5P4JhyaLR38LNKBLr8yYd/J+O5OTRx/SIoKZPJe/ckrnhv4PGfUfGzoDNCMCNsKsRWI/Ir/LKpC0mIS05it9qKDpZDrJ9vd8Apt2OGftzKhzbhdJGBU83kLbgDzGMRTqSrJHl9gc+ae/9P3eBQJhW5pjT5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196837; c=relaxed/simple;
	bh=D5HeiqLycznqcXIGJoYjmRBUsCggGGxe9tPSOJAjzq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umILy/KqgidlTUXjBanMw+r9ATGAbObxG5ToeUIFAoVfKEe3U8PK2gh53m3YWy2CotlSZ7Y2qgH7FPMx+uiHMoIRr5j+2OEdwWE6Xe65QSA1ifPcfNY+fDea1gJIlN6ub6Cwof8R62usuaRnliMTGQruS4pHyPm+VUXZ82w0tSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZB9u3/Qm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZB9u3/Qm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so4237495e9.1
        for <linux-next@vger.kernel.org>; Mon, 22 Jun 2026 23:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782196834; x=1782801634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ahh58Mj3c1V1PexaMFq0PuRXZOj9dAbGaY4LqFsFXQ0=;
        b=ZB9u3/QmdgNWoIyuYfT7UxfgSuNQOyZPOiAWsDQuSfEBEQwKtLfMzVG240h35qHyTp
         4TlPsvIXUocx/x73FVZURgPAjafNgxkeLlYBMp+sKQIA0S+lJxNiE38EC2E7kGjBucWM
         9r4PLiSVeTZiI8ynm/5tkI0HUUKxs6zAQ0WiE6A0r7Kujw3Ly2N+T6DyeamYpQMKZu9k
         iZTxGnlQuQ4F/75hzWKVs/g2DXFcROo+qPdrUVK7pRMOd/krRy9bh/Lvk7KTPkczmQX3
         xSV44qPJYEE7sRSqxsdCje6raQt6Q7o6VlFSCE6Yeh1u7KeJP1Y6yNEV8CidU4jIZYr3
         4nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782196834; x=1782801634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ahh58Mj3c1V1PexaMFq0PuRXZOj9dAbGaY4LqFsFXQ0=;
        b=o8hJhT1AXkhrT5/ArEnpMpmwNbIQ+UsMr6zVyUiDYjwJnNGAKHAI84ZDlLiYoqo5/V
         yUo6IMtW3enPQQPomCgTuUYQ5v1Azbeg//kVg7QRtpAelXihbpl6GTkYkrPDhFK54Vtw
         oaynOujAvAFHJiGSK4jX1848JHzoPC+jGBX97vQScUGOVAcwpva+VOUxVdoRmoa23+5L
         FMOpciiUm8aS3OjScBI3kr9TgY1rKimQ8lQcb0lE8553McxqGEJtBx9BtObH+J6QQh79
         ABFs6XZwe7uqq8Db4xMCD4KLIWNhLZg3NLp89Ks1jJAtBiQQ84xZkJ9amO+lfQpWRYVk
         G9dA==
X-Forwarded-Encrypted: i=1; AFNElJ+SiGG9cI3iNQnKvczBJKch4FnQkHzGMnfnb1KFVwHfnU3UzN6QGZR19iFhg4nI9F/CGYarRnlwkvep@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkzr+NLybPGu0u5INiyYE9ri+8lKzmA/9T7nDGBMnMFD+jtyUi
	ZuLxnblZD8j/pdQ2UENVcfNR30CYFPai8dpkHDCEjBMq/4qPOQlmMliG1vl7SGWt0zo=
X-Gm-Gg: AfdE7clafR82FMlCjNpk9xTOVi7SFQhTKfiTVoMpbFB1c4odHSKtDeO1bi2fFZKW2gE
	yQYmC8jUr3W5VOJlkJWULxMiZiiJyuj3CMKKB207ypASzdqUPO5gpRgxFyndxyQ6pvYcOj7pYze
	EEXZjqlD65bbq7Qq4i43fCMuWpxiVEnWDlQzYVB+wu/6KQByi7KdXHnKipSn9rOWSuK1JZanBe9
	CGZCz3FfHvqJUwSfVQY8xM/o3jEAHkav7dc/4Yn7kPhiOJ8UMGc8wdrigaPZtF7QOujQUolbjLQ
	47Tt1jeXsVYNQ4m+A4HwignvyX/EIk5aq/7PNo8AWcoJbBr7bIcydmlyRF46WBy1ViO1cCcS4w5
	4/PuBi/vjO6rMeuF8OE/tibU8EuwSuw/+dqEbj7d5eqk7v6A5X1lhR6vNrP+1gMLA4DetLCQtnG
	Ha1Epaw1u6ByhjWaJj9g==
X-Received: by 2002:a05:600c:8012:b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-4925a09d73cmr33447785e9.3.1782196833640;
        Mon, 22 Jun 2026 23:40:33 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46666c57b95sm29709565f8f.30.2026.06.22.23.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:40:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 08:40:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-next@vger.kernel.org
Subject: for next: ukleinek/linux.git:device-id-rework [Was: Re: [PATCH]
 mod_devicetable.h: Split into per subsystem headers]
Message-ID: <ajondrElYavnW6Am@monoceros>
References: <20260622210733.1743063-2-u.kleine-koenig@baylibre.com>
 <CAHk-=wgYL0xJ=RaT+t1FR6Cw8E+VZkRKZjhw5h7m3FAqqNU8Hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dtxfsntetu4kmycj"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgYL0xJ=RaT+t1FR6Cw8E+VZkRKZjhw5h7m3FAqqNU8Hg@mail.gmail.com>


--dtxfsntetu4kmycj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: for next: ukleinek/linux.git:device-id-rework [Was: Re: [PATCH]
 mod_devicetable.h: Split into per subsystem headers]
MIME-Version: 1.0

Hello Mark,

On Mon, Jun 22, 2026 at 02:49:01PM -0700, Linus Torvalds wrote:
> On Mon, 22 Jun 2026 at 14:07, Uwe Kleine-K=F6nig (The Capable Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > If there is a general agreement that this patch implements a good idea,
>=20
> Ack. This seems a good direction to me. Not only because of the whole
> "don't recompile unnecessarily" build optimization (eventually - when
> drivers start using the split-up headers), but simply as a "we
> shouldn't have mixed up different and unrelated drivers in the same
> header".

I applied this patch on top of Linus's tree and pushed it to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git device-=
id-rework

=2E It's on top of a "random" development state, but the next older tagged
tree (i.e. 7.1) doesn't contain 39d260d6bc7a ("firewire: Simplify
storing pointers in device id struct") which modifies mod_devicetable.h.

Mark, can you please add the above branch to next, to give it some
exposure to build bots? I don't know the timing yet, but I'd like to get
this in before the next merge window, ideally around 7.2-rc1, depending
on how complicated and intrusive the follow up reworks are.

Thanks
Uwe

--dtxfsntetu4kmycj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo6KlwACgkQj4D7WH0S
/k7IlQgArSh1ediCZdj83D5gFxdIE6LTGeqNyxi7Jd8t/neflpfxIKPUxS0OpKSY
xTo6u4exN7KJIPyzMTA+Z3YDS6V1QpyUfo8+dkQjyBTdvpqdNXNeD1cFejU/ykQ+
xsBxuWck+FxTA1wX+hkj78al0zcCbafU/h6Fy4Cu7yR9n1hQnAwywiCkyUstH41G
/VLlQEq4O+Xu/vF9X4H8EvDViX3C5tqDNmDjMDYYLxuttmWoY6F9zfcfGf8X23jJ
lPjlWe/2j3MHOpYZHArLGH47YGH/KKaYedoNX1U/BIjgVSyWbsz3Vh+q3Z+SeLqv
W7YcxZ1y69GLGsFRkV0bh4awUXj+SQ==
=FnKl
-----END PGP SIGNATURE-----

--dtxfsntetu4kmycj--
