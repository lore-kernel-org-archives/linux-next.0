Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F53372064;
	Tue,  2 Jun 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408661; cv=none; b=gBVGyXJtE2FLmwh3ZxpaaqcJb06NLiXchfcKiRVh9kL9FfvJpS/ftlwNXIAxs0BH+t4YA4oK33u/w9DH+lr0+QETj0zJJJP0gFtAH74MxMB7p0GpjDsUpm8825ITOuL8UmdX8JjG7DoLJuBYSXAsPvv3m+3ybj2YO1YTO2RKYrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408661; c=relaxed/simple;
	bh=SUZHyDXN6jmHKTJo1REax5s+PzqgKm7TBXxm43CtzZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VwYBg7vW3C8OslmhzEwVnzwMSyBG4d/e6G3ZnsEhaTlrVidgPxckVAoIxlansc0YoFmieucEebHYH5TtHuDt2glAPSXu5zufeScuHdx71RFfkyzmG04OJalCDBndEJDm1PmV4PdWB5lIpkxtxwUNU1JK13pqLL7vJ0EFosobg10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHj0k3ad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHj0k3ad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678291F00893;
	Tue,  2 Jun 2026 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780408660;
	bh=eYKAbjVOyHat3j+D7Jsg/JLMtHaPM2SMg6oRJOWqSGo=;
	h=Date:From:To:Cc:Subject;
	b=iHj0k3ad9SAvBcj/RY81iTcu1bEGr3W8jnA82HEEKJjrrmglcqqp37mP8tCjp52Pb
	 0Vy3+bRV6AU8UbGRhdht/29/xxrANxoYQtxi6wAJoXBAvXEtysbBEHapkVfa/nkmhx
	 3+6TKZlqcEU478nhaTfXDiu5Iec0JIeVKtV//JGhj7yo9nVM3/yMKqxHYMcCYu7FzJ
	 BcQPr5GZ9RynWydvCXqZh+CkpC19rqDqvK8+sfRiB0uF6eExh4SGTODXfIUS6FY7XC
	 +TuXeRskoiVT4dFnqkbM0d9jYuRRpztC+dpeEOT/HW20bH37nlDrZxwWF+2D8PNWfP
	 FbqjGnjJ0uflQ==
Date: Tue, 2 Jun 2026 14:57:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Pereira <danielmaraboo@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the kbuild tree
Message-ID: <ah7hUGlwC-lBwDvc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pnJR3p4WmDEz+gS6"
Content-Disposition: inline


--pnJR3p4WmDEz+gS6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/translations/pt_BR/process/changes.rst

between commit:

  ce3267a39a92b ("kbuild: Bump minimum version of LLVM for building the ker=
nel to 17.0.1")

=66rom the kbuild tree and commit:

  1af866584f7e6 ("docs: pt_BR: update minimal software requirements in chan=
ges.rst")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/translations/pt_BR/process/changes.rst
index 6bbfe60fd9730,a105581dcf64e..0000000000000
--- a/Documentation/translations/pt_BR/process/changes.rst
+++ b/Documentation/translations/pt_BR/process/changes.rst
@@@ -28,12 -29,12 +29,12 @@@ necess=E1rias em todos os sistemas; obvi
  PC Card por exemplo, provavelmente n=E3o precisar=E1 se preocupar com o p=
cmciautils.
 =20
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-         Programa        Vers=E3o m=EDnima       Comando para verificar a =
vers=E3o
+ Programa               Vers=E3o m=EDnima    Comando para verificar a vers=
=E3o
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
  GNU C                  8.1              gcc --version
 -Clang/LLVM (optional)  15.0.0           clang --version
 +Clang/LLVM (optional)  17.0.1           clang --version
- Rust (optional)        1.78.0           rustc --version
- bindgen (optional)     0.65.1           bindgen --version
+ Rust (optional)        1.85.0           rustc --version
+ bindgen (optional)     0.71.1           bindgen --version
  GNU make               4.0              make --version
  bash                   4.2              bash --version
  binutils               2.30             ld -v

--pnJR3p4WmDEz+gS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe4VAACgkQJNaLcl1U
h9CJdwf/Umae85kPRIVvjA7TOIFBfsGjFiTsD5lg8xw96sBW0masJe7Dlz8JDWRL
4brzhw+11YhpY6Ys1hLzdVK9O+nj6xTkTzUCEeid0bIFdieFf/3ftkVaMPJ2tgz3
SgEdrB2PeezHTQv+Blobm8ll9Q8zjH4JA7P2ixhozhGpZ3RV8aySHN6axMEijDUF
AP32rt/ZxxIVG5maSvF9DUiUo0hDUTZQSKSRF6QsYp9fh5L2Fc0tpZ8yYj4sbl/I
KbLU7t/xBgDuh9LWwrCVJ6WQe1fv1ksEjk20W7LsJ0LHVzNW9horkcKfduqN6Ivk
X065t2Q4d43hMwgEj0enA8kHXca/eA==
=S9lc
-----END PGP SIGNATURE-----

--pnJR3p4WmDEz+gS6--
