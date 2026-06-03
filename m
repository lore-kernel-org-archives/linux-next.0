Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF4175A7E;
	Wed,  3 Jun 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493589; cv=none; b=j9oTNWGy072pX9wWT9rPkBCpHYRTF5OvF++bHe9yYjzrqJQ5eRwISWqCEEhqmtgnZlHw3QHIU3wGnE5BCYHv6K4+r0wmly6Gtt5rBuNy2v8Ge5nyHjvRRm1EQiBHsE7IlDDzgwiwTivtkUa12wwOQDWqPP+vNU75YvUmujQ3RKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493589; c=relaxed/simple;
	bh=WQZJvqDFtMvi/jB3ZMFbBXnEnqmNb0J3SGgmvKbfzQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lzb4ssmhyXdBJlPSgnoVBAn1MQtNxNuIsxWvN6Fl/0tXgkQTmHgpSFIAh18T2s/L5M+HuvYeAdG2BFsTXwbe8QkXYo0EilrRV8sOXyKKsJa2j+N5/oWK+VHOF4NKc+PdExT7mx4ajs7G4SxOtcVKUPTGGdcynB8QiLhhq2i0elQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PylJeV8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PylJeV8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C321F00893;
	Wed,  3 Jun 2026 13:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493588;
	bh=9m/PxBT8ItTlK48ZaUPhgFlywGV7QNkVec05UZeCdmc=;
	h=Date:From:To:Cc:Subject;
	b=PylJeV8tPl9j5NFvx5dFTFKWB6P2KrrEmFDxi93GGqx7p01KOTE8UzSwn0zhKFAjx
	 qynUnTb8DlyiVrLIroWz6Dp27X1OVBnLCmHddMWnqP7GKo9LEztglHyhYpXy0aocqD
	 49cpup+0RLwkJsUkJhz6tX2G02mFXwam0CvO5MYAFL+7rcsuoaVls51dGLmqWATNRn
	 Of4qyy4sTqDuBU9yVAJ6r6bRiCNbs+FV8IqEWBZLVdkj+BCHnS8TgxsxV8EDJ5WPeP
	 J5ldKqNg4lNqjzYzIDcanCe4QiIA9e8yng1dDo7NzwQMDNNm2nAAhn9Nrvso4afBFK
	 AiF69CyWqMU0A==
Date: Wed, 3 Jun 2026 14:33:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the origin tree
Message-ID: <aiAtD90wYV8-pibf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="skC+jn6T6rHLmYa4"
Content-Disposition: inline


--skC+jn6T6rHLmYa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/platform/qcom/iris/iris_vdec.c

between commit:

  3d9593ad1a58c ("media: iris: fix use-after-free of fmt_src during MBPF ch=
eck")

=66rom the origin tree and commits:

  65c06d2edded3 ("media: qcom: iris: vdec: allow GEN2 decoding into 10bit f=
ormat")
  56f93da11a7c3 ("media: iris: drop struct iris_fmt")

=66rom the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/media/platform/qcom/iris/iris_vdec.c
index 99d544e2af4f9,a8d6354bee28f..0000000000000
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@@ -61,23 -62,24 +62,18 @@@ int iris_vdec_inst_init(struct iris_ins
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
+ 	[IRIS_FMT_TP10] =3D  V4L2_PIX_FMT_P010,
+ 	[IRIS_FMT_QC10C] =3D  V4L2_PIX_FMT_QC10C,
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

--skC+jn6T6rHLmYa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogLQ8ACgkQJNaLcl1U
h9AbJgf7BNfuOHMs6V2xfqXxma4NB0JUy0uGLza8FyCKOY5aVWBC+U0eRQ1/qJ8j
HBhRCp3/NZvRKTQCRA0KyzwLEmmMPHt5bZ3L/kZbvBi1iLim6xjhkcBGQ2xQMvxK
F8wcKVOsi4nXRG2J5sIcT6siyfjaSJ2ATiAJcAtGPOpDmK3OBlAWe7TeSwAWElGO
cipQe+yHObZSOAqVFhuI1+j4EvwVhVZ4BSmu4hAmBdZ8KHyeebTInR7e5dEq0o1d
IZOX8wEuhODPNakoQcWMGkf/CjuqhPOzd+YPY3Bh5yyfLZXh+gxysnUFXq31lIGR
FWGBQeqf0qnHf0xfRKE0rLO8Nl16bg==
=gIgB
-----END PGP SIGNATURE-----

--skC+jn6T6rHLmYa4--
