Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26322F39C2
	for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612759; cv=none; b=Lou4Cx3C2ImzHfXg4K/OSbUVZAXfMM841/e4HVewuVUN9hw5IgVl+jlIt8Mlg+3G3guIO1+LqofgIKqraXzRcPDbEkPZW6bHzHjEk5FXdJrJdIRN1KQCJqlbLw5c/g/Fs79QI40ec0I+3EcJfu0KdPJ5F1a/qIQY3V30JRlpN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612759; c=relaxed/simple;
	bh=i1pEQLt9b5BmdYX2L2k18sKBGwpMiIRZZjYHP7CdLk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4LmQWxX6tjU/kBtv+ok8ohs39Qrox8wzvIARPOGBAn8RLEVt4yoKnmn5M6RcHQwTSEMZ226oM/KFc1uT0yATzmVmS10oXh9kESyagppiTTPkb67Rhvv8h6JQACiU2C54M47g65HUTnvn3OaCjZWmmNfNZAkugo7KtPLV9VwLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HUaisSay; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HUaisSay"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso114315f8f.0
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786612755; x=1787217555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89QNDcDICPubSYitB1C02rOjH4RM3ObafCDINbH2gYg=;
        b=HUaisSaytO2HkxbxW0uomLelgOpCCeat8Fy29KBzUPXYhjbOsBN0SnvXrRFRsE6MVH
         j4XsI/FeiPCHY6Y1sTQCWeyes1hjdiRMm9gtgY+rs13yUperADya8rKlJ7R+H+BI/qJ5
         OtLhGTHhgVd9Dw6jCJ7QYYHWTum4WBQuXaWtM0/PMmJ2rgfuBZtQYlQUk/We0VqoRAaO
         lerMROf7Cktyub840IB5HS+LyhIlYfIxSsHIui6EDOZ6vMxr/1LONpUtO49juqbDa5++
         gwna7MBvJgffij74/u+pFhLJIJWE8GXKxxGvgPGE/CSod0csAsBJkUEhiGx51e5HSrs0
         ltDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786612755; x=1787217555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89QNDcDICPubSYitB1C02rOjH4RM3ObafCDINbH2gYg=;
        b=HjbpBNe8CYiXOvWIYE1EDXFJx6BVM8Ue9NzvyiSnx9bje0HBy+Y90tg4qcEK3X5g2o
         o6ncxsyk4Y46iA7U6yA4l2ns/zfWBUBa1Qsh6HpHmTpdZHQ95haGUg5jsORZAWmD8z13
         SCR8ZpdLuxpYpUlaR6wl7dw0eDU2DnpW6UPzMyruw93y3V+tmW6pQf/jFVmRnfLmAOQ+
         zdhSTfaKEI7yo/ILBBH+9lg1ajUgKiQmhAk/ul07xofMi1Jdm5NN3GISIH9zn6t8v5KV
         ZxcoUusAAPGMrr85ivnPYzt1si6iOKdwbYTft3/LldICLVNZKNcXqMmhgfSn5F37Wh4M
         U+Cg==
X-Forwarded-Encrypted: i=1; AHgh+RrQeeEMX86AXijDsPSyLPs6twonqMAkrGXw5eEsdJV4KgX6+esIethv2OEtVOr5rcsAiMQHZy2jWpXe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nYahDIsS2/PGQSUAHQo4dUSyD6LBj4ea+vSz1K+U487fAAiR
	+H+De64WhsgZ7aspPWipLMs9nxFL2zM7X1q+sHh0UDj8CJvRVS/ND9pXXCvNyqhFIn4=
X-Gm-Gg: AR+sD11z/72yWZYsWdl6rl0KdG8USgpPFF7kXYXKYX/RSwn4daFisBKmd+NekbMkcx2
	DxT3+ZimFdzU1IeflA5VarNcGTjz6rbM+RGdyHnIobDnPYkkSzoa6Ki1n630V99z2/3wC4BT/5k
	4RjdNZtbr1Bb7qBq1Xr669luOU9rNzihELee3IvOtKu90LU72oxTnSlgEBO9PsDwEgsN+kM5YaH
	e9xWv8Bzq7YFpbK0es3Gh0ccItIMXR0PHj5HFfPJW/Qy0cRCxN/Mm8QtLLn/JWbWgpFZhxFLnjM
	z3TEjznxHmnh5cgrqwdrd71M8r7/Zi7yJ21y0MNvSrHSHUETdBNl+yHG4w8BP/iju31Oc9F0eFM
	+YcNsmSkPKFhEWhu386LDfMUiwfTiD+rkyRFO/YYcgIsaHiONL9dlWj14CRszby/M6rYRM+Ap/t
	KBP1YLbvsuD8zCmx0v0MPuFg5B80o3Ci8U2JVHzAtxfUc+YfTRgYveGOIPnp4q9QjRKUL1+tJU8
	PcJbn4DOwkMSAkERzD6zWUmOPTLTj0h+9u31FtFfZnMrs72Bt99
X-Received: by 2002:a05:6000:4907:b0:481:5ce0:f270 with SMTP id ffacd0b85a97d-4815ce0f283mr1557443f8f.1.1786612754770;
        Thu, 13 Aug 2026 02:19:14 -0700 (PDT)
Received: from localhost (p200300f65f017104fbe193576de93506.dip0.t-ipconnect.de. [2003:f6:5f01:7104:fbe1:9357:6de9:3506])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5af13csm4416531f8f.21.2026.08.13.02.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 02:19:14 -0700 (PDT)
Date: Thu, 13 Aug 2026 11:19:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@debian.org>, ksummit@lists.linux.dev, 
	Thierry Reding <thierry.reding@kernel.org>, Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <an2EvQdRY0z2tmVM@monoceros>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros>
 <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
 <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7nycqk5dpctgj35"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>


--h7nycqk5dpctgj35
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
MIME-Version: 1.0

Hello Geert,

On Thu, Aug 13, 2026 at 09:31:58AM +0200, Geert Uytterhoeven wrote:
> On Wed, 12 Aug 2026 at 18:44, Mark Brown <broonie@debian.org> wrote:
> > On Wed, Aug 12, 2026 at 01:19:05PM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> > > > Any other ideas?
> >
> > > One thing I recently wondered is if it would make sense to not merge =
one
> > > tree after another into the same tree, but first create pairs, then
> > > merge two pairs, ...
> >
> > > The advantage is that if commit B breaks something there are less
> > > intermediate trees that don't contain B and you can still test on e.g.
> > > D+E.

I thing everybody understood, but for the record: s/don't // in the
above paragraph.

> Sounds like a nice idea to me!
> And you can put the trees that usually cause the most conflicts in
> the same subgroup ;-)

:-)

> It may also help in bisecting an issue.

I initially thought this to be an advantage, too, but I think that to be
wrong. Also in linear mode you're able to find a tree that is roughly in
the middle between good and bad.

> I have the impression "git bisect" on linux-next (against Linus' tree,
> not against yesterday's next) shows me more "a merge base must be
> tested" test points than expected/optimal.

That happens if you declared linus/master to be good and maintainer
trees are based on older commits in Linus's tree. Then with linus/master
(say at 7.2-rc7) being good and (say) m68k (say based on 7.2-rc1) being
bad the two possibilities are that m68k broke something or that 7.2-rc1
was already bad and a commit between -rc1 and -rc7 repaired it.

> > There's also the issue of incremental build benefits.
>=20
> That should be more or less the same as before.

Look at my example. For the (let's call it) linear mode that is
currently in use the creator of next has to test:

 - base + B			(new subtree to build: B)
 - base + B + C			(new subtree to build: C)
 - base + B + C + D		(new subtree to build: D)
 - base + B + C + D + E		(new subtree to build: E)

So it's four builds and every time the delta is only a single tree and
for each maintainer tree you only have to build once without that tree
and once with it

With the (let's call it) binary tree mode you have to test:

 - B + C			(new subtree to build: B + C)
 - D + E			(new subtree to build: oldB + oldC + D + E)
 - B + C + D + E		(new subtree to build: B + C)

That is one merge (and thus one build test) less, but you have to build
8 subtrees compared to 4 in linear mode.

Additionally my demo tree assumed that all trees base on base (=3D Linus's
master branch), which in general isn't true and thus you need to
consider that as an input tree, too. Let's say Linus's tree is B, as
it's special maybe create

	B + x for x in { C, D, E }

first increasing the effort still more. Otherwise half of the trees
"hit" linus/master only in the last step (and all together), which
somehow defeats the purpose of next and also without lifting all trees
to linus/master first, the difference between "B + C" and "D + E" might
still be bigger than just the four subtrees.

> After all you're building the same number of times, it's just the
> changes that are reshuffled.

So yes, the number of builds is in the same order, but the rebuild
effort is higher in each build.

> And you do use ccache, I hope?

Yes, ccache helps, but it's still more expensive than not having to
build at all.

Best regards
Uwe

--h7nycqk5dpctgj35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp9jAYACgkQj4D7WH0S
/k5qSQgArmezDN4m5bfKZ7AOKEE0Nh0MYNORLmkPb0LFSSgEoChOkv8hSlLZTvt5
4Ruc+sKRJheTrYWjBq0iprRJErIScaSD1wUhEf2pDHKILnP46XiDd0d2JkgARrRX
yNxUv6UTRp0pxix9Z71yP63OpE5z7xzrIkfIYOUmQZh3qxTFgIbI327kBlUyV4xt
zO3MHrIBoc8z7xt13XH7B5RA7humtVa25S6Us1mMEWkLvee/cwtEcUuuxVlqEzrQ
Oeo6V2gTWtgD8aFZgro4EKxQnx9j0VsCWTLzQDXlHwFL84LRg0mkpMWm0SIA3cdU
bUir6aLovZYP+HAbtrRSH/bqKk0/UA==
=vGIr
-----END PGP SIGNATURE-----

--h7nycqk5dpctgj35--
