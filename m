Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9630DEAC
	for <linux-next@vger.kernel.org>; Thu,  7 May 2026 11:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154442; cv=none; b=Ypd5Usl72xPJzKBzfcQprerhkWWMDFocGDqOE2ecRDSun/uk3fU1gyOdqMc6nPsNe/uKcfBrCgy+1wgHaod7otVGswp3kCl9SyTCYVNJWOBbPSxuwDgSKvIvLgT+5AySJK/LeEL1vVAzwAhpb6FXOs0y7gzikiwfrXNdFTFHwX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154442; c=relaxed/simple;
	bh=ilTduFrXAvCWZSLlH5vbPb8wrGYkkNESUyFSbe8PxOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzXSyYLc1h2o/VHIqUhcwx4Q7nMwb8+1ABoy9dYtczhBwhlW8OTGy+RF9nXmm6z8EOSkE9WH44oZMwPGAliHFFHOfsCxCq8RBgnJE9d3XyUCaqn+QMF5SCTJjL4YyrXy4YkKWI5FmoazB599umoHm1vy8AaxVBFbqmVzztfQUeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvwYtbP1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvwYtbP1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6296455e9.0
        for <linux-next@vger.kernel.org>; Thu, 07 May 2026 04:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778154440; x=1778759240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55NEgtG3LM8iRkNaz7bp0ajUzOvotXY99hHfSoDMbJU=;
        b=RvwYtbP1b7PzQJ8XezatGH7xt5fpQ9+5lBnl41dVPL7IS2R68+XxUCWAI5ys6XiYqQ
         diz5VtfrhlRpms5cRPdAif2vL4wlERtV9DHMY8oAC3i+HmRaQbrL+Fmd2QuPT5uvWcRQ
         /tbfAGNutJZDuFGyVZrw1aCRkYlxrvVlk5qfbDYOA5KBLcoDFs9hZkuCXBWq3MnjT30E
         Jb6Go15kGt1lrNsGlbDpF88GYKP+rSkfxsG7y0J00f7ZRkHQ1gidIShm5Lea4QnMlsBw
         LxZDDylpPRtS0H41mJCN9WvIIBLXYAuXP53ysHa6cntY19lgZ8qCxAVQCAkifGRO2x93
         i+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154440; x=1778759240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55NEgtG3LM8iRkNaz7bp0ajUzOvotXY99hHfSoDMbJU=;
        b=Gf82FgGARVHiNjT0BRSrtNmo9JWTINZilkwVwy5X8dozugNc5Ac2sZZPSNMS1TduoV
         07UpS9an5g9cUR18pREwgT2+edOadxxY6SkRWesECqcCADHmLMnHb741gsP6HxCpWOwI
         62l3i8MdPRfm07nfwcg9J9GbAE/XSvI1wYz71vqoPxQPhFQegmr+NjlIooGUkt56nssl
         aPQHaWjfiku9kAVuPG2rNslG77t2yii6Oameb5vt32srESbWMt9G88B0YZruyNGpD6uR
         nkLJaDN17VmV6Q9awlgigGrkrnZWOatoCAj9WuUS/nL/E39i3X0f00DFERmE9/2sjBST
         dP5Q==
X-Forwarded-Encrypted: i=1; AFNElJ87JXXz7zA9q8ujHE+Yyk+7NrpKFhtPXnCpXSR8TXH+mZq8lyGQHNAtcz03HzGCbvYSDSKrl2/B60cE@vger.kernel.org
X-Gm-Message-State: AOJu0YzwunA2L7tDT0SF4K6XfHLkqBr1uPtDIcNbUoN01tn5YIhyN/9M
	waG1FSZlXvReVm0rJTjBBvgZ8qW96Xmw3X8oSd2fFkgiy1IhImAF3bLB
X-Gm-Gg: AeBDievSE4ENWCvyqk35srI3rPinc5zc0HO8sqV+V/tFgjdm9EBSRK5gAc/tiOIIdJf
	ZHDG0SSLbrKiYWBnKDd22rU9VDNPppnZ7O8hCGt0shSCsig8bFJTlhiwqZHrdsIwsXSr1cclLVZ
	EHIDVobWwDaPEy381AmP6xyWqk1Au0kvxzQgnzqknpAkxXUrw269dN+gaeqh0lMzP0SuiBIE9R+
	kKpX1/W4S4E2RKJC5Nla3tDMKoh5U+aT7UsGMICD5EnFMwUxd3cxy6tln0h3v4NugNfKrwAnqcE
	l2BKWN1LlfdxZpjY4LIHLbtrLEi+3G+udcanMIhpwNj8JTpBHy6bovTq06sxxyCWS4rzlj5mUJb
	UVp/NULxKHsMP9MHwqSAg+AibyLTjvroFoVVbVShXDH9nYDpmgDc5tvV9y86yQpmCp3ry74rDaY
	NVQZ8iZ0XdUp7uYfqTNs0QMdHL1ey3CShxvPvTzgWZa1Diu4rzNskRjfyE3QXAzmfSjHfgBr5kt
	n5/Nc+CwVckyL6Cax8wPasH
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48e51f3a538mr123431255e9.21.1778154439459;
        Thu, 07 May 2026 04:47:19 -0700 (PDT)
Received: from orome (p200300e41f1c9800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:9800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53108c4csm55447025e9.6.2026.05.07.04.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:47:18 -0700 (PDT)
Date: Thu, 7 May 2026 13:47:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Alice Ryhl <aliceryhl@google.com>, linux-next@vger.kernel.org
Subject: Re: drm-rust: change branches merged into linux-next
Message-ID: <afx7VUl1PiIWTUvP@orome>
References: <DI3DUMHIM5CI.2FMKD5MSWVCAU@kernel.org>
 <ae6GpnWSb4Mcel_Q@sirena.co.uk>
 <afCi7hSqv6AeGfeo@orome>
 <DIBZCHAXRBPZ.2AM1ZBR61RA9Z@kernel.org>
 <afxEshceOZza_ulp@orome>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vhydiabquyzrhc7k"
Content-Disposition: inline
In-Reply-To: <afxEshceOZza_ulp@orome>


--vhydiabquyzrhc7k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drm-rust: change branches merged into linux-next
MIME-Version: 1.0

On Thu, May 07, 2026 at 09:55:09AM +0200, Thierry Reding wrote:
> On Thu, May 07, 2026 at 01:24:38AM +0200, Danilo Krummrich wrote:
> > On Tue Apr 28, 2026 at 2:08 PM CEST, Thierry Reding wrote:
> > >> On Sun, Apr 26, 2026 at 10:52:36PM +0200, Danilo Krummrich wrote:
> > >> >=20
> > >> > 	drm-rust	https://gitlab.freedesktop.org/drm/rust/kernel.git#drm-r=
ust-next
> > >> > 	drm-rust-fixes	https://gitlab.freedesktop.org/drm/rust/kernel.git=
#drm-rust-fixes
> > >> >=20
> > >> > to
> > >> >=20
> > >> > 	drm-rust	https://gitlab.freedesktop.org/drm/rust/kernel.git#for-l=
inux-next
> > >> > 	drm-rust-fixes	https://gitlab.freedesktop.org/drm/rust/kernel.git=
#for-linux-next-fixes
> > >
> > > Sorry, I noticed this too late. I've updated these now, so they should
> > > be pulled for tomorrow's -next. I'm about to finish things up for tod=
ay,
> > > so it'll have the old trees still.
> >=20
> > Checking today's linux-next tree, it still seems to pull in the "old" b=
ranches.
> > This by itself is not a problem; until -rc6 they are exactly the same.
> >=20
> > However, I noticed that it seems that linux-next stopped fetching new u=
pdates
> > from the drm-rust remote.
> >=20
> > The current head of drm-rust-fixes should be at
> > 0a69ac25bd596d50823d530d0a2004336668c0df, and drm-rust-next should be at
> > 37f748ed0c19e007e7c5677f5d605d6b93841792 (same goes for the new branche=
s).
> >=20
> > However, today's linux-next release still shows:
> >=20
> > 	$ cat Next/SHA1s | grep drm-rust
> > 	drm-rust-fixes	15e8bae5d930c91b8739a87d75db0a6efca3cb32
> > 	drm-rust	d9a6809478f9815b6455a327aa001737ac7b2c09
> >=20
> > d9a6809478f9815b6455a327aa001737ac7b2c09 has "CommitDate: Mon Apr 27 18=
:43:05
> > 2026"; the next commit in my history has "CommitDate: Wed Apr 29 00:57:=
54 2026
> > +0200".
>=20
> Sorry, looks like a rookie mistake on my side. The scripts were fetching
> the correct branches but merging the old ones. I should've realized that
> I need to update both the git config *and* the control file.
>=20
> Should be fixed in today's -next.

Looking good:

	$ grep drm-rust Next/SHA1s
	drm-rust-fixes	0a69ac25bd596d50823d530d0a2004336668c0df
	drm-rust	37f748ed0c19e007e7c5677f5d605d6b93841792

Thierry

--vhydiabquyzrhc7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn8e8AACgkQ3SOs138+
s6H7Rw//YwJSz3ID7sTXDBOZ8KQ5lg4IT/FWpR1QoiHog5duOIqChDcpHcpHkKWr
E7NQdgDSM/Dmf/zD6JRzFgRatDzGGypIxUurZi1YQe4BtepIHCd5OlVQ7E2m6JNX
RN8YpxqXIay3tKNtUwnreV6Wd62B9UHZif4BXDzIO5ruPPFUWYl2/xo6a54L+zrJ
HFVGTULQ9A+lbdMCbVbF2bhSvmgj4X3eRwbrNpYUQiqafRxC+3znRs/sm8vj5gpp
SYFJ9sz480kAcdlqKWcZR+q30Hl8PceavdnnZJt0ufi7qqWJyjZVDsJjNFXvk/UC
qi2qmugb320TNAMsP2uF8gwMi/4rt8SjE564ItxMLwLtWeXikrFP8IhoMR4LWxyp
5cotslI9OvyuTP6ZUbAeBYt2WK8hx5ZFxKBdE+yfaYZ4b+Rok0cL4sdLo4MS7bCV
JBU2FfR05+bFpGPtCqzBgzX+S3tG2ZVpY9lPUQ5iyg9YTI3QECVH3b0KWgIZ3CbU
79XlKgZT9CTtonH/+c/cdMaBqT5vqKzOVwZdOb19cbkgvC//WyHTyteEOIyuCQ8C
3z+ndZMz/v2mc/BPgGMB4XBBXqO1DyZnlurl6EI0WUpMyglUnUFg1cMlxU/hMqL7
jYegpUjJz+eAYGF/INaJev0thTL0krCEvAwR6wAvHvEB46ekf+Q=
=pwvF
-----END PGP SIGNATURE-----

--vhydiabquyzrhc7k--
