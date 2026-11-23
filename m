Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458082;
	b=Fwfh2Z5LqYc8dl+D3N97659jDarlKs3ajYazDJ8KJIKSozmOJUy5rd2PZQsqUPW2AWXH
	 hYz02oYyx9LblDCcAwa22QmCzb1TLjVOWb/YMH5HzBT7c/TRkRlEZ68Lc14ph5lajE+qq
	 nh08kxffz34dW8y1LrCB4pG37+TezipnbHIgD3J19jj7vbjdvgFzssbuGHsr+5qukTjcv
	 uFsgbY/ZOaKmpsoya0RRNwHGhCCnReVn76BLndLi2kwo6nGcqzhEh6wqlqcPGfaKcSOFl
	 qT4gH+mfaxgpDxfEsa80hVaiE4MItDI24ioZGUSG4gfdnTKeP1pVQj/cPhkZ1Nb2Rdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458082;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=DMFJWLlwc5pul+0VLMZP1nIXedHQe4kuVQv1OvmExD0=;
	b=x8hBzCLB3vo2r0YIlHwCPIT+djs+XT4p/muilWQvWpo9F1eOj8+PZ7s+znScRxgfIWz6
	 UmJTjmajejZNHYCQzZ44uU/DThXSUPfQ9l50myKDAdCWXCaRu4azMw/IjfyDChoLRXuQx
	 D72BvZmWlLrtHd7501Vs6Xjqf1cap/N4AKaBiAJoV90iQvPzPgFDf4LpRkgfmK5AYigiy
	 AY94kNqpZHMdIpENSn7+CWJEodF8QC26Rv7vSeYkbSyc+QJYwDT9JFk2NihcXsb2oKxxj
	 Ha8lBUaolbDZ77CHQJ2rBhACcV0BPeaZgNL1W65sHTOWzCqMG3MUwZCtYcPihVWuqLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7w54SJa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E292606A31A;
	Mon, 23 Nov 2026 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7w54SJa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70F31F000C4;
	Mon, 23 Nov 2026 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458081;
	bh=DMFJWLlwc5pul+0VLMZP1nIXedHQe4kuVQv1OvmExD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I7w54SJaXgNpMDXbzdZvlTkM1RpmDNqxhpjkCeuYTIrNZT7Y78uMvNWlhaie9rl4R
	 z7M75V+1+/ORFhlpBL+nfVax7NjHBoPMGhany81CjzVffd7m9PMup2Jxps/09OyiJh
	 rBcAhHttEYz0dVgAmp2zQXg9Dg8Log7mNYKrCYKmGhptc/LSgk49P9eZGvmBKJtMTS
	 4GzPNeIC7Ns4d730u0pmdUl3gfHLrlc1GtbQRKBWlerS9xWkWGPsJga7hYcM0Sh/n8
	 8vYSfXvR9g5wD16unNh4GV0DGS2+REBJbTNkKbqJ/P6PnYIdDM+y8vKxdOjowdwGE2
	 XkkK803+N1dXA==
Date: Mon, 23 Nov 2026 18:21:18 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the mediatek tree
Message-ID: <4388067b-a139-4893-b5b6-e4604404d66e@sirena.org.uk>
References: <avw2yoxCfKfHK9Hv@sirena.org.uk>
 <a7337b3d-2621-4c68-b165-904f7b88e4dd@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gnhsLZOL7+PXQCQY"
Content-Disposition: inline
In-Reply-To: <a7337b3d-2621-4c68-b165-904f7b88e4dd@kernel.org>
X-Cookie: Brain off-line, please wait.


--gnhsLZOL7+PXQCQY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:50:14PM +0100, AngeloGioacchino Del Regno wrote:
> On 11/17/26 12:13, Mark Brown wrote:
> > Commits
> >=20
> >    af557feaed1f9 ("clk: mediatek: mt7981: fix "emmc_400m_sel" clock mux=
 sources")
> >    6fe7aa32b1063 ("clk: mediatek: pllfh: clear state data in mtk_clk_cl=
eanup_pllfhs")
> >    a3ef44f33667d ("clk: mediatek: Move fhctl_parse_dt call into mtk_clk=
_register_pllfhs")
> >    2def5260f4be1 ("clk: mediatek: pllfh: Add ops for PLLs using set/clr=
 regs")
> >    4587b6170ea5f ("clk: mediatek: pllfh: Add configurable clock ops to =
mtk_pllfh_data")
> >    7cbf375f78def ("clk: mediatek: pll: Add ops for PLLs using set/clr r=
egs")
> >    b7285135ac890 ("clk: mediatek: pll: Add PLL stabilization delay defi=
nition")
> >    efa27fb633420 ("clk: mediatek: pll: Factorise pll power on/off seque=
nces")
> >    696eb5f8af066 ("clk: mediatek: pll: Add BAR reset register offsets")
> >    e998b6e82a481 ("clk: mediatek: Harmonize mtk_pll_fenc related symbol=
 names")
> >    294637d60bc0d ("dt-bindings: clock: mediatek: Add MT8189 system/base=
 clocks and resets")
> >    dc3a6ae2eeab9 ("dt-bindings: clock: mediatek: regroup MT8195 dt-bind=
ings into MT8186")
> >    833dc5fe7832f ("dt-bindings: clock: mediatek: regroup MT8192 dt-bind=
ings into MT8186")
> >    09b156611b0a8 ("dt-bindings: clock: mediatek: regroup MT8188 dt-bind=
ings into MT8186")
> >    3b372542144aa ("dt-bindings: clock: mediatek: reorder MT8186 compati=
bles")
> >    cb47a7976bb5e ("dt-bindings: clock: mediatek: Make '#clock-cells' re=
quired for MT8195")
> >    1a2b86804febe ("dt-bindings: clock: mediatek: Make '#clock-cells' re=
quired for MT8192")
> >    51928be3081a2 ("dt-bindings: clock: mediatek: Make '#clock-cells' re=
quired for MT8186")
> >    24bf5189aadf3 ("clk: mediatek: Reserve missing MT8516 top clock IDs")
> >    8779893558124 ("clk: mediatek: Reserve missing MT8196 MDP clock IDs")
> >    afd8231b5a434 ("clk: mediatek: Reserve missing MT8173 topckgen IDs")
> >    3ccbdb37d10af ("clk: mediatek: Reserve missing MT8167 clock ID")
> >    dbed26f4c4895 ("clk: mediatek: Fix MT6797 clock onecell IDs")
> >    8dcfe9e6b3cc7 ("clk: mediatek: Fix MT6779 clock onecell IDs")
> >    336f7db3af40c ("clk: mediatek: mt6795: fix the FHCTL DDS mask width")
> >    351444cd006ef ("clk: mediatek: mt8173: fix the FHCTL DDS mask width")
> >=20
> > are missing a Signed-off-by from their committers
>=20
> No idea how this happened, but it's fixed.

Still seeing this today.

--gnhsLZOL7+PXQCQY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEhB0ACgkQJNaLcl1U
h9Br0Af/Y4WlWHASqJuehMLC8C14wHwLZi+dyVGtGqhSm344Ga+9/ZdhPLkkssCO
rSukqf6pzGw1db1QCdPddOGEVtjHwuCSjOB06tSYSR+Aza3ohbL7cC+uP4aUmFPh
ySWSKnF3a/s3hdpmRp/2XDFXTkoyxuZw8+VUZ7KA4LurhexUyxPNWEpwGmjtlgfP
2apIha4S2af5ti/O8Q8Dji4HpRFMd2pPrsQ+0rLdNO2Nfkk8+gWGupjWvm4cnBwP
kQQVF2Bx78RB6ZecGBJ9ptMfKAYQ843ya1yP0ZN4fLrQI3aM+cbyi99N6zr4/JU1
P5ft/DzYSR49A+oGzDA9AbeKZwlUvQ==
=W3wR
-----END PGP SIGNATURE-----

--gnhsLZOL7+PXQCQY--
