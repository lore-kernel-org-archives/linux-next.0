Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4914E448B8D;
	Mon, 17 Aug 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982221; cv=none; b=RIlBJD4/Qcn18lD+QLw95SkXHc7DunupWXI+fgSdnHH04dFI1MqxgTQQo/prP1eBNXh+PQJrnChh7ooeNnahN62IaMqgz5nKd1sJMBAoOPmJvUZhWh5Ag350zzXgDndfj6BrhDKmy7T39mE5yKSB4bkoUMcyWVk6+cZdajuPp3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982221; c=relaxed/simple;
	bh=ujsvPlEU/we951ftrXPiBX98afwm6KhVqLEu9th6L+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aGOIhtkOZgo5Klih0wurKFlNbKGPzk6txqwajNCEaxNgMvlfSYXN5f4OeXRQ1HN5IUHK9/5yxRXppoowbnWunHEMfFOyXsQeQjc6PSgmiQIsKe8AnV9keAw/N9KJwtCEF5RQbNWrOm9b8zkRCOiHvauZSrjePMoz97BZHtVYMU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZtMyV4y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZtMyV4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6931F000E9;
	Mon, 17 Aug 2026 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786982219;
	bh=L8zxNuDSMsSTkoq8KM4HQKF2yHqfiVQ4ywxhuKtAFCo=;
	h=Date:From:To:Cc:Subject;
	b=OZtMyV4yQyAyTqrupl3yjvHwNPdujJDgm8w0QGpkcqz+fC+/LMZenF+sGoqlFrQw2
	 3lRQlyjlQ+P3mnh2M1n/tyVoGanMOA4YNcyk/pjLQEHByCgdGycT54HpCWaoG9VFWU
	 DhppPFNjb4D3gaJvghnm/a550s1RVLohKTWemEUyEWXjy30NWXMbYdwA8JzW/lH2hX
	 Y3fBTFX6PWj/q9VI2PKoGXbUymeUYjyMWRd9i6LtfGND6X11d0yVjiQiruoiSbQy5K
	 47E3sRCUDPiIF+D6y/ZEJruGrQAoyo+AkxvByKKoVebKbZLO/mwxRSvBL5s1iWN2vc
	 JihAaCz2B6XZg==
Date: Mon, 17 Aug 2026 16:56:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the driver-core tree with the pm tree
Message-ID: <aoMvR5MHCsykmdEO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VQYqF+uVVOErLuxp"
Content-Disposition: inline


--VQYqF+uVVOErLuxp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  include/acpi/acpi_bus.h

between commit:

  72530e1f72b05 ("ACPI: bus: Introduce acpi_bus_get_primary_device()")

=66rom the pm tree and commit:

  2c5d17cdc4e97 ("rust: driver: remove open-coded matching logic")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/acpi/acpi_bus.h
index eaf13f6ac2d3a,7e57f9698f7ce..0000000000000
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@@ -953,18 -996,6 +949,11 @@@ int acpi_scan_add_dep(acpi_handle handl
  u32 arch_acpi_add_auto_dep(acpi_handle handle);
  #else	/* CONFIG_ACPI */
 =20
 +static inline struct device *acpi_bus_get_primary_device(struct acpi_devi=
ce *adev)
 +{
 +	return NULL;
 +}
 +
- static inline bool acpi_of_match_device(const struct acpi_device *adev,
- 					const struct of_device_id *of_match_table,
- 					const struct of_device_id **of_id)
- {
- 	return false;
- }
-=20
  static inline int register_acpi_bus_type(void *bus) { return 0; }
  static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 =20

--VQYqF+uVVOErLuxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDL0cACgkQJNaLcl1U
h9Ds2Af5Abg6GvVD6vCh7Xe2jdsIKLcAPsG39yGUNuC5sngAxYLs1YHZZSTkHq5h
vGgCGE+/pbWzlUxj+AkwtwqRX5x7AuHzOcY3nISR0DQGPB2injHF7f/TTDjq9Z2V
BG/4GsjWQIkKRFxrYRRAKLz/fRd4rDOmMb0OAjp55U+mbGgwo9m3KmkZHf7UOili
SHiECve7odhkIhvsHgpd4GquWtL8frV3bSWtlnO9ExaqoR9z2wuOGd55XlPwqPvp
GyRyiYCTthJatcnjhZC8lm3HwA1UvRjpYAEBGBbCAjBz/zbcbSN6RFc8scfp5iOd
V3KlDfSNd3WztaIf8IJcUxHgqCHncg==
=qKOF
-----END PGP SIGNATURE-----

--VQYqF+uVVOErLuxp--
