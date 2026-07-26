Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3556189F43;
	Sun, 26 Jul 2026 21:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785103023; cv=none; b=dBGKClMs7V2MR7mq85DUd4UTtuCZNX8VMk/VjhJON+5p0pIZ3ORAzv/qRbTWyQF8O8MsDalyjBMnqZ7G5USYnnoDnF+j56KrvcIIvFHOeEi5+zzpnJd6WlxsAeRldrKIbw82GxvzQeG7UR/od/XwXEDp0Swr9FO7jtvmnwqovDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785103023; c=relaxed/simple;
	bh=ew8hxf1ryECbzlUnwwJWuANFCPRrpjO6ZKp+ItSM0GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcJq4n9DbhYzyDiSnde7d48eJwk9DTtuVo8CP1lp/MEX29uiEPa4qR0FScxAPnjdl7fUp6L4170R5KZbzEc6XUIfF78en1Rk7LCIad645Ri5rOJ6YeKgqpKqUK7o83xpfj6MvsGzDcAyF28iPvn9iAwbcxj4V0DILj9GWSpZ8lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFsV9pp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFsV9pp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D711F000E9;
	Sun, 26 Jul 2026 21:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785103022;
	bh=dOvjsh1gzkjEjNRgyoHCy5+8RtI/nCp3HxRC5VV1+AQ=;
	h=Date:From:To:Cc:Subject;
	b=iFsV9pp47HP7vQwmzv+j+NJDTF00NMvzI3kKocYarrlHWNyIsMJO7G90KNk/Qm79b
	 PeUsRjT6x/yWe9zB4IMorO4fSQiZlrg3VpK1gcFkJIGVucTe9Gm3neQ5L80b3IcvgE
	 OZ9tvwW857ozxv8+j+8/rAhPsF22WDD/nR+Vw4uld0/2F203/t1GTqmiFDPEYofd64
	 3do4Jn0Am+hPzd4NuhcsGQWxvMFlr0O3XCvqkv4XWwfEkVdoYPls/LYgaVRKlCE4tB
	 8/Jb2XC0CXS9y+4vKJ+4nqxWL008jgcCAlQr1mv2pENOjkCfSGsHzX8hI1grilFD8p
	 f/HWbMQQhTN3w==
Date: Sun, 26 Jul 2026 22:56:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the driver-core tree with the drm-xe tree
Message-ID: <amaCqZUpvgKLe9gC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwmnMha3dOiUJ1ZJ"
Content-Disposition: inline


--rwmnMha3dOiUJ1ZJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/gpu/drm/xe/xe_i2c.c

between commits:

  5d8ed6b64220a ("drm/xe/i2c: Allow per domain unique id")
  9420abf8dbc2e ("drm/xe/i2c: Drop manual VF check")

=66rom the drm-xe tree and commits:

  e766abbc5191b ("drm/xe/i2c: use platform_device_set_fwnode()")
  0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_i2c.c
index a26c38bb17a15,5b0026bdb1c60..0000000000000
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@@ -93,15 -93,7 +93,10 @@@ static int xe_i2c_register_adapter(stru
  {
  	struct pci_dev *pci =3D to_pci_dev(i2c->drm_dev);
  	struct platform_device *pdev;
- 	struct fwnode_handle *fwnode;
  	int ret;
 +	u32 id;
 +
- 	fwnode =3D fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
- 	if (IS_ERR(fwnode))
- 		return PTR_ERR(fwnode);
-=20
 +	id =3D (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
 =20
  	/*
  	 * Not using platform_device_register_full() here because we don't have
@@@ -109,11 -101,15 +104,15 @@@
  	 * uses that handle, but it may be called before
  	 * platform_device_register_full() is done.
  	 */
 -	pdev =3D platform_device_alloc(adapter_name, pci_dev_id(pci));
 +	pdev =3D platform_device_alloc(adapter_name, id);
- 	if (!pdev) {
- 		ret =3D -ENOMEM;
- 		goto err_fwnode_remove;
- 	}
+ 	if (!pdev)
+ 		return -ENOMEM;
+=20
+ 	ret =3D device_create_managed_software_node(&pdev->dev,
+ 						  xe_i2c_adapter_properties,
+ 						  NULL);
+ 	if (ret)
+ 		goto err_pdev_put;
 =20
  	if (i2c->adapter_irq) {
  		struct resource res;

--rwmnMha3dOiUJ1ZJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmgqgACgkQJNaLcl1U
h9CuZAf/V+TMKTxsxBu/1gQjqIN/cqeNIvnEjKaB05svSoZtt98IwOIU3wP+dD+Z
yTBE8E+BnpNI8MWKiziy2MYWdv0GQo+6LmuFWeVaBN0abPqRGZfZHuRoAqhL/uy4
HaJVQb9Cn02ZYjBnG5GikTExXqLikkSj8I9YBi+3tcoXGZAWB0mRIOylZMqbkC2R
7FQZ5jo0YMaIfjhOP9W4rX86rqiAzg5O03wOobw0haOZwYiTswZrqoonsHpLhIqZ
8hX4e06Y60tT+Th3fO4bYBKtTgYD6EvRP9+EOKeGnX+0EFK8pBGMd46CGi5LBqMH
A22LLDxNl0PgVzEqvurB5Si9XVgxQQ==
=SjWj
-----END PGP SIGNATURE-----

--rwmnMha3dOiUJ1ZJ--
