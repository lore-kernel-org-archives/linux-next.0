Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B331607A4;
	Tue,  2 Jun 2026 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416970; cv=none; b=Zo6Za5WxKAJksiBJ3WturyHvJY6+7hOGwpiNgs9G5yMLJPqinGiNrvAO/Q2JkZeoydOUAF6nF4SQryzHDt66Mv3920ETrXuIhMMcKOwDVxDPQ3fPj5Mx+P2ab6ZGPm6grRyiItBXH7L7qcnrI12Sk7mo1GmX7m4xGki0+0Sudlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416970; c=relaxed/simple;
	bh=npe6nFhTdUVNdWwWsaMog8tOLCPzcTo79DYFAUG4xqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uu/fBQ6Vz0CicIOrWnx6W195B01dEknMxr1dVCqzRLTqAvor4ybJF5bxgjRE8n9HWrkCz3O919UHWkzWm3sOYGb2GAJTKFH8rHsrCvzxVxUK9LND/+zC/X999NCChXPvp4Aq+aEcsQzRnKdpc5DI/10MtgxaIypdnX8fmojtqMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgEh/84u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgEh/84u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510251F00893;
	Tue,  2 Jun 2026 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780416969;
	bh=MEr7yPF9PUxTzUn67xnZxRPBF6Y91ScdaRdosi7rb9g=;
	h=Date:From:To:Cc:Subject;
	b=OgEh/84uuXrPfysejPaznhJyicLPXJUXm16AbLUHXMWIy+DC0khVtp3/T76d+bR+V
	 hC/dTtE1ps7ndV+mG6SvXQKHaMZQ1pqZp6SpUFO178lUnqEPvxA+lG9KN6goRyJNkV
	 TlGtpNkuC1XxnsCzOJZAlt13/5NZG+Ksij31ZX6+uJw6epl/JyEwbNBCYmsSQwG63E
	 /o7j2MWktLfZGHWZBVXpS90ZyuJBEV7ArQeAb3VJbJz30Mm7F1/t0zRZPPrMJg6zhh
	 m8R8bQbrB9DW1Ox3uNKh02dKbKGwx9tuvCDsyV6dpuDFCOORzlAEwNOF8KvvUR9Wd2
	 c+ekOLeyPHTWQ==
Date: Tue, 2 Jun 2026 17:16:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the origin tree
Message-ID: <ah8BxJTDKIqVzdgD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mi+U3BFHl+Mqz7Fq"
Content-Disposition: inline


--mi+U3BFHl+Mqz7Fq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got conflicts in:

  drivers/media/platform/qcom/iris/iris_core.c
  drivers/media/platform/qcom/iris/iris_vdec.c
  drivers/media/platform/qcom/iris/iris_venc.c
  drivers/media/platform/qcom/iris/iris_vpu_common.c

between commits:

  95a337f92f0a6 ("media: iris: switch to hardware mode after firmware boot")
  3d9593ad1a58c ("media: iris: fix use-after-free of fmt_src during MBPF ch=
eck")

=66rom the origin tree and commits:

  56f93da11a7c3 ("media: iris: drop struct iris_fmt")
  4147ffa3d96dd ("media: iris: Add hardware power on/off ops for X1P42100")
  3395d7526386d ("media: iris: Initialize HFI ops after firmware load in co=
re init")
  56f93da11a7c3 ("media: iris: drop struct iris_fmt")

=66rom the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/media/platform/qcom/iris/iris_core.c
index dbaac01eb15a0,a1823ded46e87..0000000000000
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@@ -75,10 -74,8 +74,12 @@@ int iris_core_init(struct iris_core *co
  	if (ret)
  		goto error_unload_fw;
 =20
 +	ret =3D iris_vpu_switch_to_hwmode(core);
 +	if (ret)
 +		goto error_unload_fw;
 +
+ 	core->iris_firmware_data->init_hfi_ops(core);
+=20
  	ret =3D iris_hfi_core_init(core);
  	if (ret)
  		goto error_unload_fw;
diff --cc drivers/media/platform/qcom/iris/iris_vdec.c
index 99d544e2af4f9,b65832042dc85..0000000000000
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@@ -61,23 -62,22 +62,16 @@@ int iris_vdec_inst_init(struct iris_ins
  	return iris_ctrls_init(inst);
  }
 =20
- static const struct iris_fmt iris_vdec_formats_cap[] =3D {
- 	[IRIS_FMT_NV12] =3D {
- 		.pixfmt =3D V4L2_PIX_FMT_NV12,
- 		.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
- 	},
- 	[IRIS_FMT_QC08C] =3D {
- 		.pixfmt =3D V4L2_PIX_FMT_QC08C,
- 		.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
- 	},
 -void iris_vdec_inst_deinit(struct iris_inst *inst)
 -{
 -	kfree(inst->fmt_dst);
 -	kfree(inst->fmt_src);
 -}
 -
+ static const u32 iris_vdec_formats_cap[] =3D {
+ 	[IRIS_FMT_NV12] =3D V4L2_PIX_FMT_NV12,
+ 	[IRIS_FMT_QC08C] =3D V4L2_PIX_FMT_QC08C,
  };
 =20
- static const struct iris_fmt *
- find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
  {
- 	const struct iris_fmt *fmt =3D NULL;
- 	unsigned int size =3D 0;
- 	unsigned int i;
+ 	unsigned int size, i;
+ 	const u32 *fmt;
+=20
  	switch (type) {
  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
  		fmt =3D inst->core->iris_platform_data->inst_iris_fmts;
diff --cc drivers/media/platform/qcom/iris/iris_venc.c
index 4d886769d958b,2398992d05960..0000000000000
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@@ -79,34 -79,27 +79,21 @@@ int iris_venc_inst_init(struct iris_ins
  	return iris_ctrls_init(inst);
  }
 =20
- static const struct iris_fmt iris_venc_formats_cap[] =3D {
- 	[IRIS_FMT_H264] =3D {
- 		.pixfmt =3D V4L2_PIX_FMT_H264,
- 		.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
- 	},
- 	[IRIS_FMT_HEVC] =3D {
- 		.pixfmt =3D V4L2_PIX_FMT_HEVC,
- 		.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
- 	},
 -void iris_venc_inst_deinit(struct iris_inst *inst)
 -{
 -	kfree(inst->fmt_dst);
 -	kfree(inst->fmt_src);
 -}
 -
+ static const u32 iris_venc_formats_cap[] =3D {
+ 	[IRIS_FMT_H264] =3D V4L2_PIX_FMT_H264,
+ 	[IRIS_FMT_HEVC] =3D V4L2_PIX_FMT_HEVC,
  };
 =20
- static const struct iris_fmt iris_venc_formats_out[] =3D {
- 	[IRIS_FMT_NV12] =3D {
- 		.pixfmt =3D V4L2_PIX_FMT_NV12,
- 		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
- 	},
- 	[IRIS_FMT_QC08C] =3D {
- 		.pixfmt =3D V4L2_PIX_FMT_QC08C,
- 		.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
- 	},
+ static const u32 iris_venc_formats_out[] =3D {
+ 	[IRIS_FMT_NV12] =3D V4L2_PIX_FMT_NV12,
+ 	[IRIS_FMT_QC08C] =3D V4L2_PIX_FMT_QC08C,
  };
 =20
- static const struct iris_fmt *
- find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
  {
- 	const struct iris_fmt *fmt =3D NULL;
- 	unsigned int size =3D 0;
- 	unsigned int i;
+ 	unsigned int size, i;
+ 	const u32 *fmt;
+=20
  	switch (type) {
  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
  		fmt =3D iris_venc_formats_out;
diff --cc drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d95,5a85568c5ee1c..0000000000000
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@@ -292,8 -293,20 +293,14 @@@ int iris_vpu_power_on_hw(struct iris_co
  	if (ret && ret !=3D -ENOENT)
  		goto err_disable_hw_clock;
 =20
+ 	ret =3D iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+ 	if (ret && ret !=3D -ENOENT)
+ 		goto err_disable_hw_ahb_clock;
+=20
 -	ret =3D dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWE=
R_DOMAIN], true);
 -	if (ret)
 -		goto err_disable_bse_hw_clock;
 -
  	return 0;
 =20
 -err_disable_bse_hw_clock:
 -	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+ err_disable_hw_ahb_clock:
+ 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
  err_disable_hw_clock:
  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
  err_disable_power:

--mi+U3BFHl+Mqz7Fq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmofAcMACgkQJNaLcl1U
h9CS5Af/fpJCfc7w2llfQTQKmkBYxtwzhDmIEvKeuFN1ixwPAZWiMyy3yGmGm3Ib
O9THbPBr3eJf3AJ4wTHx29LHcp7bmpie3PK6N6UtDd8MRRq0fZM19+LI4YqlxihN
GhNfSNvj14CuvRJ4XINlCjfQH/LlSQgYujM5EA+3JGxDi8qX6TT3RmoKdl/EuaIO
VN5ONTCe7yS13HAaVva7GxqYO/SW1jFYpXbYb93LL6G7aq4rV3vFqh808KorWAkF
8vEsr/Iw79YmZzv3Leb1dSdj5aZFV62RSFzZG1ggYaJC1Fh3SFQt9OiQe7om+8nH
pwLaMrOgTKenoVNiZhgBmSuR1+oTdA==
=j7mM
-----END PGP SIGNATURE-----

--mi+U3BFHl+Mqz7Fq--
