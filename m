Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A42330648A;
	Tue, 17 Mar 2026 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764350; cv=none; b=hV6I29MWY1Qgn1oVl2VpdT6v20+ON15DSUjIEMmAQDxRlUsampS0EKPuow3CbKO+quRcbyUiel43J6BLOXi/F8i4RGsII+50kiyqUlzZ7RWEvV+0X0TjK774QZFRp/tvemvzbebEBI3b8UPZ6mrEZPom0/ilm9iNXq2qNPvUEAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764350; c=relaxed/simple;
	bh=bs5oRrxwH4P6GH+ToXgPd1iUwlfloVmDAM+yfJ4NlIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eyqe4WtH4w7vwVhuVSEDxK/ha/5nGIEh80t21Fubd99Ul4wcknFt4v/zHAOXtuFZD0GAJ1MGwZiocDXGLU8KTG5C7S/ZU7kq193tgyfbpajb8IMiGBhkqxrFRdkBMMEu36VsHgkVWGnKrpuExLx/nE80tnXqqaJaEcgmGCqaJYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU2VkmE6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU2VkmE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B955FC4CEF7;
	Tue, 17 Mar 2026 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764350;
	bh=bs5oRrxwH4P6GH+ToXgPd1iUwlfloVmDAM+yfJ4NlIA=;
	h=Date:From:To:Cc:Subject:From;
	b=VU2VkmE6rdAsMw2X21vSntnMTycGoZx/V6ChNNXFrZUbjaT0184d2VMdPXH9ser1J
	 A1kgikMRVJPdqf61tFkGTLwnda/iukqyf+be9LR4C8wJybwm+qFdp9eH/tpBlGY2xa
	 GXQRg33NrX/oQKDp1K7CbXW2sokTikJX8VskpcLtykC8u9C2t/2COpMgRCgHeuyMa7
	 ksznAkkmh1sExqbO3FYDICMfvwkDnd4QutsiJ9saERRmU876n5ag4B/IeFUk8FBlaC
	 DhlL5WpeDscITNA/0gTjHRN+lFJm6eOosUoLAKmqSnygQ2zXcU4kc7vDMNL3CWym1U
	 d622huXrkV3bA==
Date: Tue, 17 Mar 2026 16:19:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: linux-next: manual merge of the devicetree tree with the qcom tree
Message-ID: <abl--dSMoQ1FiQz1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j7KrsWqlj1HRmx8b"
Content-Disposition: inline


--j7KrsWqlj1HRmx8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  drivers/soc/qcom/qcom_pd_mapper.c

between commit:

  cdf0e445ee211 ("soc: qcom: pd-mapper: Simplify code using of_root to get =
root device tree node")

=66rom the qcom tree and commit:

  3ee3d8a44976a ("soc: qcom: pd-mapper: Convert to of_machine_get_match()")

=66rom the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/soc/qcom/qcom_pd_mapper.c
index 21e4dd594295b,8a1a18f8c8594..0000000000000
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@@ -401,16 -401,6 +401,16 @@@ static const struct qcom_pdm_domain_dat
  	NULL,
  };
 =20
 +static const struct qcom_pdm_domain_data *qcs615_domains[] =3D {
 +	&adsp_audio_pd,
 +	&adsp_root_pd,
 +	&adsp_sensor_pd,
 +	&cdsp_root_pd,
 +	&mpss_root_pd,
 +	&mpss_wlan_pd,
 +	NULL,
 +};
 +
  static const struct qcom_pdm_domain_data *sc7180_domains[] =3D {
  	&adsp_audio_pd,
  	&adsp_root_pd_pdr,
@@@ -582,7 -572,6 +582,7 @@@ static const struct of_device_id qcom_p
  	{ .compatible =3D "qcom,qcm2290", .data =3D qcm2290_domains, },
  	{ .compatible =3D "qcom,qcm6490", .data =3D sc7280_domains, },
  	{ .compatible =3D "qcom,qcs404", .data =3D qcs404_domains, },
 +	{ .compatible =3D "qcom,qcs615", .data =3D qcs615_domains, },
  	{ .compatible =3D "qcom,sc7180", .data =3D sc7180_domains, },
  	{ .compatible =3D "qcom,sc7280", .data =3D sc7280_domains, },
  	{ .compatible =3D "qcom,sc8180x", .data =3D sc8180x_domains, },
@@@ -628,7 -617,7 +628,7 @@@ static struct qcom_pdm_data *qcom_pdm_s
  	struct qcom_pdm_data *data;
  	int ret, i;
 =20
- 	match =3D of_match_node(qcom_pdm_domains, of_root);
+ 	match =3D of_machine_get_match(qcom_pdm_domains);
  	if (!match) {
  		pr_notice("PDM: no support for the platform, userspace daemon might be =
required.\n");
  		return ERR_PTR(-ENODEV);
@@@ -661,7 -650,7 +661,7 @@@
  			goto err_stop;
  	}
 =20
 -	ret =3D qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
 +	ret =3D qmi_add_server(&data->handle, QMI_SERVICE_ID_SERVREG_LOC,
  			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
  	if (ret) {
  		pr_err("PDM: error adding server %d\n", ret);

--j7KrsWqlj1HRmx8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5fvkACgkQJNaLcl1U
h9Afqwf/UNNsnSF+MMER8UCHjZJnJtATpVLUOyOrtkvUu61x96RJKbGT5rWwWmEK
+jnZGK6eysgetjn2LJa+DszbJ2srobjVS2HxNRvP37fRT0ZBlOrJlzU856ffVarT
dt8xS3iplWb0IVORywwgAlj38fW+vQ6oiZGlG/fPozBtBcDX7cdZRf3UYXq2Emrl
NHl4yeZJAqoQXhZhWXKZtGY3ThDt+AUpbjl/VHX8ckvpfjDe4wsbVT6kUxLSH1B9
psJrj+kUQnP1ATbMJiZh1ztke8wj0D52n53gkAwfoHZJJidaldbuH+jsVZdcgeGk
lgCJSi5LRkue4B4yaEEQowwkx4yz2w==
=DIgz
-----END PGP SIGNATURE-----

--j7KrsWqlj1HRmx8b--
