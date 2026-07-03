Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCDE3D25BC;
	Fri,  3 Jul 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093320; cv=none; b=t37eSdROyere8A0SRGkJBxsQjjNYkjykA6yDzuWjHPjiyfyDGv26pVl8n/7rZIvSWqp3vkSzlqbIGZxhGzBN28Yl3Js4oWaJpYlyhKkHe7TZ1WNonNAH/xy9V8RKRihC8mo2QKlARrZLxsFQmmuEsQfvli7KL5SkkSuZHHPK1vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093320; c=relaxed/simple;
	bh=NvD91V//vjvLhVGt7Pxb8rSgeM2rdgVZDVDR+zHZSXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HzVxLUqk92WDP/3cIASJ5C77hpwmIEPwJSW1dJUEE+oUmB23XnBPIK5dWj7a2BS0rXJQR88bmFtpb5ZWy0wF9M5vWArOiyLvLAPVFhBhOD8xPQWBkdxfhyJ7xqjRSjel5ALZ9CcHd6fweptWWnbtLVuXpZZ/YmrGtHmrpRbvXjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc7l7M9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc7l7M9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1551F000E9;
	Fri,  3 Jul 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093319;
	bh=f0bo37RlBaJqTjGw75Z5/WBrGstylESujUzwAo8EpSo=;
	h=Date:From:To:Cc:Subject;
	b=hc7l7M9geZKOT2utCPMhvNiJ0/ZhjZKbIf1vZcOtqgkmi0VdCKeSg96iBP1xJFHTC
	 lLVsNxFytr5WKVbkZe6xkmAPQTh6VkBz2z/7VQICVFF8Hda36Wz6rQR9QtAvQmqbSs
	 VQ6VSqbjQ2bxm5FhH59fU98APh9KAUsymrZ13ozaq4T0fV+M8XEClu+2cH0uN9ZVbz
	 dwWAXzc3wEofQeBEhzDYR9140p4JwW9aKT/bMjRkhbLd225XVP5R114oum+RD1CQoY
	 ea5gxrIfgD8amhQIlstREZwe2hZ2hTA7+e5A8CDFjIm7V1kW5f16S6V4GZkGJiyPkJ
	 6ih+Pt9kxFP7g==
Date: Fri, 3 Jul 2026 16:41:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Violet Monti <violet.monti@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <akfYQ5jdASorRNo7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9nL//A+P5Oxz/Uzb"
Content-Disposition: inline


--9nL//A+P5Oxz/Uzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/tests/xe_rtp_test.c

between commit:

  e23fafb8594ea ("drm/xe/rtp: Add struct types for RTP tables")

=66rom the drm-fixes tree and commits:

  5ff004fdc7377 ("drm/xe/rtp: Add struct types for RTP tables")
  c47ffed42b016 ("drm/xe/rtp: Add kunit tests to exercise FIELD_SET_FUNC ac=
tion")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 3d0688d058d97,367811621880f..0000000000000
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@@ -280,6 -280,11 +280,11 @@@ static void xe_rtp_rules_tests(struct k
  	KUNIT_EXPECT_EQ(test, err, param->expected_err);
  }
 =20
+ static u32 bits_2_3_set(struct xe_gt *gt, struct xe_hw_engine *hwe)
+ {
+ 	return REG_BIT(2) | REG_BIT(3);
+ }
+=20
  static const struct rtp_to_sr_test_case rtp_to_sr_cases[] =3D {
  	{
  		.name =3D "coalesce-same-reg",
@@@ -300,6 -305,29 +305,29 @@@
  			},
  		),
  	},
+ 	{
+ 		.name =3D "coalesce-same-reg-literal-and-func",
+ 		.expected_reg =3D REGULAR_REG1,
+ 		.expected_set_bits =3D REG_BIT(0) | REG_BIT(1) | REG_BIT(2) | REG_BIT(3=
),
+ 		.expected_clr_bits =3D REG_BIT(0) | REG_BIT(1) | REG_BIT(2) | REG_BIT(3=
),
+ 		.expected_active =3D BIT(0) | BIT(1),
+ 		.expected_count_sr_entries =3D 1,
+ 		/* Different bits on the same register: create a single entry */
+ 		.table =3D XE_RTP_TABLE_SR(
+ 			{ XE_RTP_NAME("basic-1"),
+ 			  XE_RTP_RULES(FUNC(match_yes)),
+ 			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
+ 						   REG_BIT(0) | REG_BIT(1),
+ 						   REG_BIT(0) | REG_BIT(1)))
+ 			},
+ 			{ XE_RTP_NAME("basic-2"),
+ 			  XE_RTP_RULES(FUNC(match_yes)),
+ 			  XE_RTP_ACTIONS(FIELD_SET_FUNC(REGULAR_REG1,
+ 							REG_BIT(2) | REG_BIT(3),
+ 							bits_2_3_set))
+ 			},
+ 		),
+ 	},
  	{
  		.name =3D "no-match-no-add",
  		.expected_reg =3D REGULAR_REG1,
@@@ -417,6 -445,30 +445,30 @@@
  			},
  		),
  	},
+ 	{
+ 		.name =3D "conflict-not-disjoint-literal-and-func",
+ 		.expected_reg =3D REGULAR_REG1,
+ 		.expected_set_bits =3D REG_BIT(1) | REG_BIT(2),
+ 		.expected_clr_bits =3D REG_BIT(1) | REG_BIT(2),
+ 		.expected_active =3D BIT(0) | BIT(1),
+ 		.expected_count_sr_entries =3D 1,
+ 		.expected_sr_errors =3D 1,
+ 		.table =3D XE_RTP_TABLE_SR(
+ 			{ XE_RTP_NAME("basic-1"),
+ 			  XE_RTP_RULES(FUNC(match_yes)),
+ 			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
+ 						   REG_BIT(1) | REG_BIT(2),
+ 						   REG_BIT(1) | REG_BIT(2)))
+ 			},
+ 			/* drop: bits are not disjoint with previous entries */
+ 			{ XE_RTP_NAME("basic-2"),
+ 			  XE_RTP_RULES(FUNC(match_yes)),
+ 			  XE_RTP_ACTIONS(FIELD_SET_FUNC(REGULAR_REG1,
+ 							REG_BIT(2) | REG_BIT(3),
+ 							bits_2_3_set))
+ 			},
+ 		),
+ 	},
  	{
  		.name =3D "conflict-reg-type",
  		.expected_reg =3D REGULAR_REG1,

--9nL//A+P5Oxz/Uzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH2EIACgkQJNaLcl1U
h9CNDgf/akCtMxiRhLgMGnrQliQfNo0md3zSgu7GmWA9yJIUgweXhHuotRFBLzQL
CgXW8Vj801G1DtvCumEAjC91rGB30hVm3LptddWXUe+yZenkyKcl3n2PMqByX5oP
zTk0nFZ2FzX0fGKRSbA2pAQ4Vtabb6n+qOkQs4Md/Ptsdjr/xHpG62Y6hClLBs3p
yxIkZi6YVPPvdGEdhLp2coBNcKDcpKb0Fuu3vh9NDY7XeEZHNoa6JeX9UNcYXQuM
g8xkEawlDaRqc+BQMTBP01Iz1qSqUbPOQy1cKLM0MVGe6ue7Ni8bkhruLGMKGxWN
TgqO4E1PIkS17h/E/gixNPxgI7pr0Q==
=/cpJ
-----END PGP SIGNATURE-----

--9nL//A+P5Oxz/Uzb--
