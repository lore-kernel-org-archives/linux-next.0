Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713E43ED3CA
	for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649795; cv=none; b=tWqdxEoCL4YMXRU3IcEF6heHmGc0asuyaVDLD0batukrlo6DI3Qk+EP1NdeXCeUvHQo20yj8iZ9RtPJh3miVm4Xu0HmkqZt3ppQySIm1EU4J3P33sVp7+7S9YyU//jho7vCO11yl/lzb2M49C0mtVLWJ+LrS84HKKgixDLziCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649795; c=relaxed/simple;
	bh=OdtyIaUquOmAEJcOSQTNn5PmcZNeDFtguVHqT9/uYdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KS6ZSjS28iFfb7O9s95adglq2hGoB7SzkJwLAZ6vpKG1rJfyKmwkM0g/5dod52gxeq2/Sb+25+Bm9TFAU5a12WIsu0fiJGGJul2ao0A1JKbd61H9Wp/xVaclaDx4W6ctIrMnMnruFOCyI+TP+VZQzmC6CiT8VruW/5SV09MpxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LTjPoImM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LTjPoImM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c167aa9500dso686345066b.3
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787649790; x=1788254590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XX5K81ve7+LZjWOS81IJEJu4RVfjdI4dGeLBPWUtyo4=;
        b=LTjPoImMeHA5wJdQlW0rOH0tbNua+A6tVphYG17Ik3bVopCKy73HDmtnXhOBp450vM
         Lmo5Ku/S0dP7Hsw4HYTP5gKtPorUtqtR8oJm78MFz1rvFQeiQV5BDc1W6Fz5F4kpNMQ9
         JXOfFvvjQVJOspvl3nchNASmWz1VgMGOPrsazCSgwsZUwtgvIQxkbobdaMFw16gXHe1F
         yLopB9yjiKbpRGOYoCq2QlRwnA2zvBLFGxdsnT4xwITxXXqL/HTewivkU1vOirSrYdRR
         xvqcC5dKmKsFIgqvJX3EviaoP0htsQYv+Vb8Cu4nwLb9T8ZqsQ4mtgzHWs6zmsnM7/DZ
         ouyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649790; x=1788254590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XX5K81ve7+LZjWOS81IJEJu4RVfjdI4dGeLBPWUtyo4=;
        b=WWr6VlCMplyuDjQD6w++TbOhrduzTCNMZeQEUpbSei+D6CeI3GbWN6WNNuWOCJhx+p
         /xRvoc2I5yKgQRKk4AjIq6y93D/u2s2xYK3iFUJ7RYJMK/kPFPpFtVgn1Rjfo4oyKhog
         nJ1RcIvoIB4r2zbvQB4Ge5/ZS0ejNNBksVrkV1PayAakL58SDJ6xF714PB/C/88rWBGN
         yEU1a/NiFPhxsO1aSHOshutbREE/WQkly7JBDPx/XgXHqpYAlFGR6Y3GxeYnx4imxCSp
         JWo5XD1PsE1yUF5q7X7zWcvHMDozZGgzC1W1mNb+Ae+VuBSnbokrknTPv2nVIuAsRMNg
         kzUg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6AWWXJPztkYNUaHhMWtTow282M4J4lzXFqFZNiubLYaa5uvyKVhYARofc9w9wOZZF9XKum/bUPN6c@vger.kernel.org
X-Gm-Message-State: AFuF++mI87PoxEX4tXHAwzXwxUQXPKFeMdMNqZtMmy6lvGOMoISSmRaF
	GFt8PEDGvBj8jkPFWiApmTKFu4w3H6Zw+ByWx0XiazQAWhu7qeRp3dLyTjZNJpAqG2s=
X-Gm-Gg: AR+sD12+pnRTwzdq1p4fuxROy5cQvh2lUrAyqM7UghuJD6SOxznnaEBooRxCSrepXMN
	Fjc9Pf75WoRzDj376RR8wyCvN+akSJz4aQRwSLSQXezlCFtmPidR55wY+WX+V67L843QztuN2mk
	ULLD905GHJ4MZWB7F6GGtEwJNJIuD40a3TNL6VI324DXO/aIStVa7g+wjVn+IKXqTbkbwLVyH44
	ELjiU4j/e7fu5iHBpUOoc7L97CvBgKfyD+2Lnte8w6aaWe7vBfaFjBZDEwagJkvuiVhs4NWEu4U
	ECJ1IQh2JUoMCDbv5okeLYTQAcrbKV6Uk0WHb7xYZh9wPk52ezwhMPs9l8pJmUNpgR9oWsHYZh2
	Q035b2PWqSaNRNdOv3Ls6BKQLY/pSxukeY/plKeWB80UCH1SnObxvpyvnRVtJRRYUKBl2ul1jWk
	YGwOGDwpOIJ9hsR8de4urUbmrIg0eg32/EDaoTL9Anz1dWtF/B4zt48+92CR+YuCrJOU+KbKyLL
	kMtNmLt/7Cee/IxrqEUnVy6KRnpxCdTCwlkRU8Oh/PY5N7ILQ==
X-Received: by 2002:a17:906:f246:b0:c21:61a6:8821 with SMTP id a640c23a62f3a-c246a6cd384mr2998570766b.23.1787649789639;
        Tue, 25 Aug 2026 02:23:09 -0700 (PDT)
Received: from localhost (p200300f65f19a904037016a565660d5e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:370:16a5:6566:d5e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c24966f6ad2sm1761257366b.30.2026.08.25.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:23:08 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:23:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vlastimil Babka <vbabka@suse.com>
Cc: Mark Brown <broonie@debian.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, ksummit@lists.linux.dev, 
	Thierry Reding <thierry.reding@kernel.org>, Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <ao1a6qatPjiHmOAS@monoceros>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros>
 <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
 <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>
 <a0e4b0ac-41d1-40bb-b704-67ba71e8ce43@sirena.org.uk>
 <b1adf43b-f37c-4c8b-8370-d5f8f179678a@suse.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bqu6vbso3orcjmxb"
Content-Disposition: inline
In-Reply-To: <b1adf43b-f37c-4c8b-8370-d5f8f179678a@suse.com>


--bqu6vbso3orcjmxb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
MIME-Version: 1.0

On Mon, Aug 24, 2026 at 12:07:08PM +0200, Vlastimil Babka wrote:
> On 8/13/26 14:36, Mark Brown wrote:
> > On Thu, Aug 13, 2026 at 09:31:58AM +0200, Geert Uytterhoeven wrote:
> >> On Wed, 12 Aug 2026 at 18:44, Mark Brown <broonie@debian.org> wrote:
> >=20
> >> > > The advantage is that if commit B breaks something there are less
> >> > > intermediate trees that don't contain B and you can still test on =
e.g.
> >> > > D+E.
> >=20
> >> Sounds like a nice idea to me!
> >> And you can put the trees that usually cause the most conflicts in
> >> the same subgroup ;-)
> >=20
> >> It may also help in bisecting an issue.  I have the impression "git
> >> bisect" on linux-next (against Linus' tree, not against yesterday's
> >> next) shows me more "a merge base must be tested" test points than
> >> expected/optimal.
> >=20
> > IME it tends to walk down the linear history of -next until it find
> > which branch introduced the regression.  I've never investigated in
> > detail but my feeling is that the inefficiency is more driven by the
> > size of the branch it lands on.
>=20
> When bisecting -next, I actually use the "git bisect --first-parent" mode
> first explicitly to find the culprit branch (or precisely, its merge), th=
en
> do a second bisect only within it. It avoids wild changes of the tree
> between bisection steps due to the differing bases.

TIL `git bisect --first-parent`, thanks.

> The suggested binary tree merging approach would make this strategy somew=
hat
> more difficult.

The argument could be somewhat weakend by first merging linus/master
into each next tree and only then start merging using the binary
approach. (Then bisection could be done without the base changes, `git
bisect` wouldn't necessarily do that though. It could be directed to do
that by marking all trees (i.e. before merging linus/master into them)
as good for the first run.)

Thinking further, having $tree+linus/master for each tree can be
beneficial in some situations. But that could also be done with the
current merge order. Not sure though if it's worth the effort.

Best regards
Uwe

--bqu6vbso3orcjmxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqNXvkACgkQj4D7WH0S
/k7kKAf7BZLO6jM1RNhY7qyVZd6l2nJ4ZOecq9fRoxofDFqABj1jP6PI1cXChRkh
+fOzIapXV36O9v3cy5/rZdvwlg+CR1RoreBal/zmeoWKlDiy2m9z1pVbXhRFIxcQ
rmP1PFbxlovGNvm/bChKuiIyvgplfuAmx+BiwRaugBQaQYJz0s77BX7w4M+Yb9eE
j4pA3NuBwSf84k4VzuocfLpDz1Kb/0sJrOhJMAraL5fG2ZihuEbbk/1vHVVZSuRA
cxmV+GUxWUDTghbOpO3eIsGSvm+0Iijt/QOpHgNju7LZQns9AnA4NGwSgZ+8IW5a
pUr4rYKRIKajSc/m8L1RvzegqcKj6g==
=ikiV
-----END PGP SIGNATURE-----

--bqu6vbso3orcjmxb--
