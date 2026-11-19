Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109390;
	b=xVSrFPicgWLm/USwhf6ErlHjcQbbUmPxfVl7J/P4IiBTga36wpYpiTBwSOp/xpQPXuJJ
	 6c7Jf+LO+BPLu8VQtOnpzdgZPz2UZg8Y8a9NaqwqI+GQKXxHhsxG1AHOxU7V7+3hqEoLM
	 gwNBkAv+Isa6vIF6Q4qHYC0cUTkSuS+2pAQcXVZ5YC4LSu12IxQooVIioCnUwXmvtAM6f
	 TpISJ48kVsJjKktId6NfQTFAlkl+OuJyB2fjHpiEz7u940apU2WFNii1gikEKMXN2i7wt
	 wTSgKOtjFCC2ls94OIrv1t5mJt2FXfbOJjQqfpb8gJUSDuVedyCEz0EBEuswLB2y0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109390;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=wB2sgMKnJtDtEWR3D1pZR9JzcTk5RE7d2g1PbIXERiM=;
	b=ciaqa6bMHulhubbgdab+JxFzqr52oeI/R8DDngBu+oLPmet0Wn423blr438ePwlmJ54f
	 Avq3tPkXUt2JSh1MNlJ5g7EIxnYDbh214phU9vkOB/F4gNTXvU52UBfpolhkJRUkeIVBl
	 AXK4idUOmCAmBcwgwti9krBN37PNHpjHi4Yq/lfISELYa48OGZFzuIeGeA+Un71UjLtvq
	 CfvfiMCuN66G4PTJ9bFdSiIi7izMK0vWXE7ViTOjMshlw+GhesHsqimfZ+C3zn9qNildI
	 UjpuycEZowwckrmaxIDj6gvFVxVQtFrh/22Zs/t9f/pQL+Sp/r4HuX3SXGJtVKd/+eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQWq+MBI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525A3606A324;
	Thu, 19 Nov 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQWq+MBI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDC61F000C5;
	Thu, 19 Nov 2026 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109389;
	bh=wB2sgMKnJtDtEWR3D1pZR9JzcTk5RE7d2g1PbIXERiM=;
	h=Date:From:To:Cc:Subject;
	b=hQWq+MBIrLWq6lGFMxODKYDRPYeuj0brCOijufDsrCstdCX5gRVW3ofhCexCl6Ew7
	 sO+Vg2s84CWLh45djacYIydHNdpAqCImvYwZlZ9Wh9CtMMSqPpZ+S27OI2GRH7ACxK
	 BRzhPdi4LwUGpTDNHzQ2FuER9SwF5lJRW76Pm1/T6p5/IW7KUlT27kGwHEDGP2u7e7
	 ezSASlqjFWMwQXZusMwBr3FW6Y29kfY3LcCY7Z4OsNlvivRRryUmQ+VIdRR8r1Jx0W
	 W8Cc40tw2BzLnmCmzY50hzIE6Hc4wAgvy3v05ibbQG9jy3Cg9B+3uDfWT+wrMN8Bvr
	 gGGm2Z2mk1lZw==
Date: Thu, 19 Nov 2026 17:29:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pinctrl-intel tree with the origin
 tree
Message-ID: <av8yCr4r_U8R_mul@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="WR6kv7pt4EvtAmgX"
Content-Disposition: inline


--WR6kv7pt4EvtAmgX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl-intel tree got a conflict in:

  drivers/pinctrl/intel/pinctrl-intel.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  34925b925793b ("pinctrl: intel: define iterator variables inside for-loop=
")

=66rom the pinctrl-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/pinctrl/intel/pinctrl-intel.c
index 51a86975909cf,833640fc40b09..0000000000000
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@@ -1437,10 -1434,10 +1434,10 @@@ static int intel_pinctrl_add_padgroups_
  					       struct intel_community *community)
  {
  	struct intel_padgroup *gpps;
+ 	unsigned int ngpps =3D community->ngpps;
  	unsigned int padown_num =3D 0;
- 	size_t i, ngpps =3D community->ngpps;
 =20
 -	gpps =3D devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
 +	gpps =3D devm_kzalloc_objs(pctrl->dev, *gpps, ngpps);
  	if (!gpps)
  		return -ENOMEM;
 =20
@@@ -1484,7 -1480,8 +1480,8 @@@ static int intel_pinctrl_add_padgroups_
  	if (community->gpp_size > INTEL_PINCTRL_MAX_GPP_SIZE)
  		return -EINVAL;
 =20
+ 	ngpps =3D DIV_ROUND_UP(npins, community->gpp_size);
 -	gpps =3D devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
 +	gpps =3D devm_kzalloc_objs(pctrl->dev, *gpps, ngpps);
  	if (!gpps)
  		return -ENOMEM;
 =20
@@@ -1514,9 -1511,8 +1511,8 @@@ static int intel_pinctrl_pm_init(struc
  	const struct intel_pinctrl_soc_data *soc =3D pctrl->soc;
  	struct intel_community_context *communities;
  	struct intel_pad_context *pads;
- 	int i;
 =20
 -	pads =3D devm_kcalloc(pctrl->dev, soc->npins, sizeof(*pads), GFP_KERNEL);
 +	pads =3D devm_kzalloc_objs(pctrl->dev, *pads, soc->npins);
  	if (!pads)
  		return -ENOMEM;
 =20
@@@ -1580,9 -1576,9 +1576,9 @@@ int intel_pinctrl_probe(struct platform
  {
  	struct device *dev =3D &pdev->dev;
  	struct intel_pinctrl *pctrl;
- 	int i, ret, irq;
+ 	int ret, irq;
 =20
 -	pctrl =3D devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 +	pctrl =3D devm_kzalloc_obj(dev, *pctrl);
  	if (!pctrl)
  		return -ENOMEM;
 =20

--WR6kv7pt4EvtAmgX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/MgkACgkQJNaLcl1U
h9DV4Af+IUz4+wrsNh9UX/M9yuVTLpyYRMKdyDyB/PD6gNs/GmzHgK9D0p7nMKO9
cKg+j74j2XCCpSgN4WzYwKFlG5ZEYWVLsmaD864TVnfbQXcoCT8GoclhU8SVhrHS
hWIqsBuVf1ocYdE/4oStpifCvNmCDppKahSDikDnl9JqV87ej7Pgf9WDRwAucf2b
r2JpsicUiki3Fz09sdolfDwVOAB1cbfQXHixzgeB+9REO4w6hmdgQ3y2dBYKmRch
gASd9av2nHo5ozQurbeOL9wk/g9n0pYNk4AMo5L62aD+ABFn5DkXGQlA1FBm7K//
+dnV1Oxs3iAii3BHH+KBRmi5RM8aaw==
=d6pM
-----END PGP SIGNATURE-----

--WR6kv7pt4EvtAmgX--
