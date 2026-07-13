Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33F40F8D6;
	Mon, 13 Jul 2026 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951659; cv=none; b=i01CplxGLbouXBbUy3qb4b3IKYIYe4OGCQgdAj9NUwBExf8F+9HMnghhV5L69zo+1TRj0GALY3nnokorkx58HDxQuZCtDZR+5ad6iIy671R8FUDViRvm1usSIPvZgQTCk/dfeRWdMezZ+3egWNhGglDC7a1vm7n4bRQK3Z+UfpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951659; c=relaxed/simple;
	bh=gbtIr8LdoiZTuYTYCac4g/5KFGar/ILbkUjly93lM74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3yyKYQ+D05jAn6vKHgWVhWfIVt+E92g/SIhIVEJbPv7AbTtZ4rvIAydwEMchNt/UB7LCmre9KVwRSNPcogiC45dsclbJqh1gedgOtcGWwZQphxQKuvUju0G/K17hyGc1YbLcNXySVFjS3188d4QtMqxr0lmtsvaOo0cE2X8tAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBppPA6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBppPA6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8201F000E9;
	Mon, 13 Jul 2026 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783951657;
	bh=Nd0B21Jmj4yBpvxfCJcWcLEtExDJX8lxm8UdF+DcQLk=;
	h=Date:From:To:Cc:Subject;
	b=TBppPA6fTmAYerdbOflrzZD64x8ux8Z3wC251+au2lrRexvz7kyqAt83TbNlyTLIi
	 QoGnlBH8kYGRI4pd+m5/hZhfNXS5YS79WGkHfAIPD9DH/MmlYDf6SOHmg/GqKNw5dA
	 4Syp+air2VWIZpx8jhdrc+TGEkSI23OVcDAUN9ZrrnSoTgwQv8c/gSDHX4QVGS5VJk
	 OMP+NtAJBUatXDP+iWP2iVZ0aiKE515URIt8n2GqkNd9C0QpvIFLv7N1L3Og3Pl6Tu
	 Ae+rvbbRpE6AMsbRMgmz56uB1LC2yWoSEP1ibKksEo0vVTjKfr5x4qbd68n6nN5veq
	 m2pYY75hTgiww==
Date: Mon, 13 Jul 2026 15:07:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the driver-core tree with the origin tree
Message-ID: <alTxJTV0crJ8DNar@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wm2bdSgtkvEopsGK"
Content-Disposition: inline


--wm2bdSgtkvEopsGK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  include/linux/platform_device.h

between commit:

  00cd8fc630e06 ("driver core: platform: Include header for struct platform=
_device_id")

=66rom the origin tree and commits:

  714cfe9e143fe ("driver core: platform: provide platform_device_set_of_nod=
e()")
  8877c06885ce4 ("driver core: platform: provide platform_device_set_fwnode=
()")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/platform_device.h
index 8c566f09d04ef,94b8d2b46e913..0000000000000
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@@ -19,6 -18,9 +19,8 @@@
  struct irq_affinity;
  struct mfd_cell;
  struct property_entry;
 -struct platform_device_id;
+ struct device_node;
+ struct fwnode_handle;
 =20
  struct platform_device {
  	const char	*name;

--wm2bdSgtkvEopsGK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU8SQACgkQJNaLcl1U
h9DslAf/dsAxq/bKBe8Yc2JbK8FJDTUhRHsNq9swiSx16f4w0e0yCXitfvGRsdAR
NZgDGLErJCuszHeOk12gHst+en2xLo/VlxXRVv+W2i8q1qjNMh4DDVifzjgGNsfp
D6Eq7K8EvvW72rqmnief74YRWh+omUQkYD0UuTSGi6oUSj00GPcYPo88IMm1eunB
Yak+Ot56jpoPNrgjyCKgNM1fJgYbJgYt8Bejm9RdHdGlD/DPV3xqTFS9/n6TmYCF
SldHyYxOuZOM3G/0DCbfrduixMHd4oC5gxpP+pEjceqqsWmCAGv5z6clU9n2oYVh
IcxywYkyonO9hZScv/1X40+nsBPWwA==
=dl6w
-----END PGP SIGNATURE-----

--wm2bdSgtkvEopsGK--
