Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00F2FFDCC;
	Tue, 17 Mar 2026 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764378; cv=none; b=J83bjJ5gMFV44brhs8hvpkkyR95Kj/jlhdayrOhdZsg8MZQz4NCKkAuQBUG17AZNfmQ5kKsas8IKj6lyvwwvWankPhepRtdXJwYCivSCNMGiHhUX7XTAmdBgYwUb8cpFfra4wlNSElDqBZvmO1OaUfWkya9WBNYcAKXS8mTJmiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764378; c=relaxed/simple;
	bh=TI/bfk75YPlmIO85GC371K8CM6F6hCgLX3jW2g3BddU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8UaMeRH2sNRa4iWcE/Cc/ycJFUx/wP0ra6ZFJFiF18r376XPRj5sDqrC4V3rwm2gn/65fplHiUOsOU5muZ8Mv6r8EhyC2WWZSOnYXaLI50GKcZ6KlhKfamGipaag9kejvScEonkPXg4+1e6MR8ueNZ0o8NdsZsIXRFr/eiiu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEPbz2n+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEPbz2n+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087A1C2BCAF;
	Tue, 17 Mar 2026 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764377;
	bh=TI/bfk75YPlmIO85GC371K8CM6F6hCgLX3jW2g3BddU=;
	h=Date:From:To:Cc:Subject:From;
	b=AEPbz2n+qtIgeWzjuKOvY2arZv2/t8ZHIAAxVlMm0v7afZ7w5PT8L3QsNOOZEFvpQ
	 Kq7PEZSBHpvop9zH0HVg8bMhgY8Of47t0wfOn5R7wK0FxTEzzIibkRxUttER6WnVhH
	 nVN6Lj4SkyczgWx4cZivOZG3sPXpom4fnWvJCLlOaPdzzihZZ7OPIb85ljphvyZNmD
	 O2bbJcSbjafbRpi8ExCMfKdo68e5vrWu1YiRbVm2gT60+LAqf2MT7lClekZPGaKPhQ
	 vbF9ZYplAqavGySBnD0AUm372zNZy9pDOpZlwbMDmBCBpxnyXRsbpUGllJeeyzLoGM
	 OzGHfOC48Q/aw==
Date: Tue, 17 Mar 2026 16:19:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the devicetree
 tree
Message-ID: <abl_FcMjGGAf1YHt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DX0f66W2rgqbxXTE"
Content-Disposition: inline


--DX0f66W2rgqbxXTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/of/base.c

between commit:

  82b6c1b542ea0 ("of: Add of_machine_get_match() helper")

=66rom the devicetree tree and commits:

  59621105ffca7 ("of: provide of_machine_read_compatible()")
  c86d3b7b847cc ("of: provide of_machine_read_model()")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/of/base.c
index af048ab88e694,bf4a51887d742..0000000000000
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@@ -434,13 -434,42 +434,41 @@@ bool of_machine_compatible_match(const=20
  }
  EXPORT_SYMBOL(of_machine_compatible_match);
 =20
+ /**
+  * of_machine_read_compatible - Get the compatible string of this machine
+  * @compatible: address at which the address of the compatible string wil=
l be
+  *              stored
+  * @index: index of the compatible entry in the list
+  *
+  * Returns:
+  * 0 on success, negative error number on failure.
+  */
+ int of_machine_read_compatible(const char **compatible, unsigned int inde=
x)
+ {
+ 	return of_property_read_string_index(of_root, "compatible", index, compa=
tible);
+ }
+ EXPORT_SYMBOL_GPL(of_machine_read_compatible);
+=20
+ /**
+  * of_machine_read_model - Get the model string of this machine
+  * @model: address at which the address of the model string will be stored
+  *
+  * Returns:
+  * 0 on success, negative error number on failure.
+  */
+ int of_machine_read_model(const char **model)
+ {
+ 	return of_property_read_string(of_root, "model", model);
+ }
+ EXPORT_SYMBOL_GPL(of_machine_read_model);
+=20
  /**
 - * of_machine_device_match - Test root of device tree against a of_device=
_id array
 + * of_machine_get_match - Test root of device tree against an of_device_i=
d array
   * @matches:	NULL terminated array of of_device_id match structures to se=
arch in
   *
 - * Returns true if the root node has any of the given compatible values i=
n its
 - * compatible property.
 + * Returns matched entry or NULL
   */
 -bool of_machine_device_match(const struct of_device_id *matches)
 +const struct of_device_id *of_machine_get_match(const struct of_device_id=
 *matches)
  {
  	struct device_node *root;
  	const struct of_device_id *match =3D NULL;

--DX0f66W2rgqbxXTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5fxQACgkQJNaLcl1U
h9C0LQf/SX3k41AF384MP9fcW7LdrHB9OVa3Mandz/Rd0gh9kXUm3l+KhClawGUw
JaONf7NIKzsKVJuT6cUMWSFRaD+QqrDRBzg7bC0I55NeSlUPkibO4f8HdADAwtqT
oFsx9D6ahE5y6KO5xx4L0DUe3hZFp6uPmhUZo+/xEmdDxRTgWSniH9Up4GskJosQ
al122yudL+jOx9JX0Aj7V1U9tCa3tR+vXouVkcdrfebLbkIk+pLPoSVYJawylqEn
8DIASyr+e+2GUbHP/DFynyFKTZEPPuTFskzPIWdQRQlV1u27amtU0f31h2Ol9e85
MOm41O09070EAOUiVM6YzazGzoVsWg==
=sgpF
-----END PGP SIGNATURE-----

--DX0f66W2rgqbxXTE--
