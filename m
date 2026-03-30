Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71B3B8945;
	Mon, 30 Mar 2026 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900732; cv=none; b=hDWIBUzD401w8jkRIs2mgzaNGhnE0Gtv+V4nn7k0PRebJevfGR7wgwvPnz+y3xb8ILkKYj0eHkwEXwI/M/Pe7yGs/k66L4v6HloSqeB400Lhsa+eQVh9b4hXGOgMzzYVS/qB1r4I08ECSR102AEkm0snQtVlwVDn3VK4h4YE2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900732; c=relaxed/simple;
	bh=lZVJKC6pnEp1BcoiCGQB0J0PUcH36eQIXHZtT1zPt0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knD9T1rK5VdXfgJFnn+v1YmKthalrIY3NvtKPILl4bm15jpfiNEDcf1MKkyG2AOOI78ppfKtBiLwCijIRWZr3gYeGx79wH19HvXRxRMZUJjFcJUQ8UAkm+d0buy6/DckAP0voXw7yhR2xrWJ9uRzi8n9D1NKcSmZg4vlA2uCo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGK/01vX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGK/01vX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1D9C4CEF7;
	Mon, 30 Mar 2026 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774900731;
	bh=lZVJKC6pnEp1BcoiCGQB0J0PUcH36eQIXHZtT1zPt0Y=;
	h=Date:From:To:Cc:Subject:From;
	b=hGK/01vX3Cey/m8iqe42p1Bi826n4ee2AwjmC2Ywo+6VYB7AHk/JfW0fqyfdzBF0m
	 R0xuQe2AnAccFwwBKkXTxRGCavTMvOoM9eO9mTP1K4goW0hoPvjB1HT11ccXMwTHDv
	 YRu+KqYDYMVfaj0D8U0ngFDHopNCGCUj+lWVvQwyqmBekdtW5+SjT3gqki/+hFRJ4R
	 /pQatl9OJ2aZETgt1ZRG1wr0MJrdCkHT6ygNOzjQLML5i6mcyMpxPH1rYq47AIWVgm
	 PZt1/IA26HypjLSkHPYgIfzG4dCdH0pSLcd9Y9TweEbMCS9Bn5Fax75wKlFXrJxN5b
	 pISm3t+OtYcog==
Date: Mon, 30 Mar 2026 20:58:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <acrV903iryXvDjyA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QVceulZvY8rafgeA"
Content-Disposition: inline


--QVceulZvY8rafgeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml

between commit:

  6b5ef8c88854b ("dt-bindings: gpio: fix microchip #interrupt-cells")

=66rom the gpio-brgl-fixes tree and commit:

  ececb46fc9477 ("dt-bindings: gpio: fix microchip,mpfs-gpio interrupt docu=
mentation")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index f42c54653d521,6a0c5341d8a42..0000000000000
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@@ -82,18 -90,19 +90,19 @@@ examples
          compatible =3D "microchip,mpfs-gpio";
          reg =3D <0x20122000 0x1000>;
          clocks =3D <&clkcfg 25>;
-         interrupt-parent =3D <&plic>;
+         interrupt-parent =3D <&irqmux>;
          gpio-controller;
          #gpio-cells =3D <2>;
+         ngpios =3D <32>;
          interrupt-controller;
 -        #interrupt-cells =3D <1>;
 +        #interrupt-cells =3D <2>;
-         interrupts =3D <53>, <53>, <53>, <53>,
-                      <53>, <53>, <53>, <53>,
-                      <53>, <53>, <53>, <53>,
-                      <53>, <53>, <53>, <53>,
-                      <53>, <53>, <53>, <53>,
-                      <53>, <53>, <53>, <53>,
-                      <53>, <53>, <53>, <53>,
-                      <53>, <53>, <53>, <53>;
+         interrupts =3D <64>, <65>, <66>, <67>,
+                      <68>, <69>, <70>, <71>,
+                      <72>, <73>, <74>, <75>,
+                      <76>, <77>, <78>, <79>,
+                      <80>, <81>, <82>, <83>,
+                      <84>, <85>, <86>, <87>,
+                      <88>, <89>, <90>, <91>,
+                      <92>, <93>, <94>, <95>;
      };
  ...

--QVceulZvY8rafgeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK1fYACgkQJNaLcl1U
h9DrdQf/eipNT9Wc4qARIOdxfEH+hsh5oF2OtBPYRbdo+RaISzJuiTmi45zOmFVK
C1Xqgdsw3DSTebKk3IFaS9XWZk6Qf5Rp12QmoiUWcmOm5FnNMhqcGTeXBsQI1kAM
mzAWrBbVMSVu8wDnlXVIHUG9bnPrwidmr08/chY6Ov49hr5vbUacNDh84Une/XTk
j+pFvg/mQKtStZEbKQlXW1EbL5uL3H/g81uM/VFOlPDdIl1MZAnqVDlLGvO0EeAf
g1MDr9CONvvU1i+ZAYfWWd6CWji0E5o3BGZ/nzu4z8dLBSLJwQFyT/PuiZ+sVrkY
nheb2pnBo3AUIALrpPq7/LYCCuejkQ==
=hsXS
-----END PGP SIGNATURE-----

--QVceulZvY8rafgeA--
