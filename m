Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706049;
	b=reWeWInrJGFFrzQYHWAhWAnGKHD1duZyGyI+MdlkmFX9Nh/QZ7z5q+Stq+eOhLkWDsyk
	 Cgd8gV9KM0JZT5BpXXaPdwYdOGiiNuhSr1hy3GyIlOqyOf2EIfdfDSOEnHNEaNhlDkokh
	 29NRzKy2fEBPFE9gXro7G0gwt2dmwnwQkuoxUDZ7jmNhxFSSyTaaY4KVqcxnySONYyMWC
	 gZpdGgZDTPYIRx+KeLkB1tM60Zp352THSIS1MJdHFxm8WMLM/sV+6K+B+AVbPRo6bjeIV
	 GUvhX0VGNnIHnfQiS23Exnfgva5ckmlMv9vL5KcKF+dsgSHj0qbO3V4FqHWK+1UKSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706049;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=5qrK3dPHIDLDJCAK7pwOhgo0XUjp026/y7N6Gkx7MIE=;
	b=fCvVSVEQ9qof2sF12Kql2xwDby3t9J6bMRlt+52qPFiN3ruW/quuodiL2uLGDVYTLPv5
	 CMkvW3pqErVuF+YiQhEiyZF7AE1IqM0+md6Bn9DZY+wZ+1tt9wCAOMoKFkEyhRDIopBEh
	 HT+mcu3pZvIfuaHq2/7rHPwTfJjO8bo1kFaIGzq5p59b1spcpg2opzjgs3TTAXoaWnjPY
	 bI7uBHWbtObOfSrFe5g3boYttqcoDB+K5VnAw1AZsnDwHc2T79YmuSjDI7EY25tS0d8Qq
	 y30C2tizDGi8nPr/yGdfgdnWni0IVCG2bOZOPt1oc+kUFPpNgdIM/p7MAZw7HxIvAdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAXbYM0L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84EC606A321;
	Thu, 26 Nov 2026 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAXbYM0L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE021F000D2;
	Thu, 26 Nov 2026 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795706049;
	bh=5qrK3dPHIDLDJCAK7pwOhgo0XUjp026/y7N6Gkx7MIE=;
	h=Date:From:To:Cc:Subject;
	b=IAXbYM0LViE4DbsqLtsI5fM6bOaOQcik3jL5Wx8fGhA2+UndCSyRh4Xi2n3ufECmj
	 neInWeuwKCmXk770VYXhFqEKRjy10h1PMy/GBwwO17jqm8/zwzSqLZAPgNtwgpwtSS
	 2j7GDS3/NoUeyWv+ZGzFToxGuTRqu9rThbA4klkeEZXnSYQlGSAoHyZO0JMH7sGkez
	 5XGbYIX4i4D7ufo9Gy1Iw6ne2nxgngJ6Z51gNYs/IwwFqYT518F4LbXBzFFoqWxtLl
	 FhbRwQTiXdM+yfgqB5m1MZZGta58VvlPR8bqztIk6XVU88RJEP7owiuaOUmurDi7Vu
	 tkiqxvbwk2+vA==
Date: Thu, 26 Nov 2026 15:14:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Mimi Zohar <zohar@linux.vnet.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: linux-next: manual merge of the kexec tree with the integrity tree
Message-ID: <awhMvDnzcpc5mv7G@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwi5A3M40icvYNF4"
Content-Disposition: inline


--mwi5A3M40icvYNF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kexec tree got a conflict in:

  kernel/Kconfig.kexec

between commit:

  4e15e8ed59e07 ("kexec: Select ima_get/free_kexec_buffer() with CONFIG_HAV=
E_IMA_KEXEC(_OF)")

=66rom the integrity tree and commit:

  e583fcbe5b585 ("arch, kexec: declare kexec and crash capabilities in Kcon=
fig.kexec")

=66rom the kexec tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/Kconfig.kexec
index 86a230505931a,af03cc773145b..0000000000000
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@@ -17,10 -20,9 +20,13 @@@ config KEXEC_EL
  config HAVE_IMA_KEXEC
  	bool
 =20
 +config HAVE_IMA_KEXEC_OF
 +	bool
 +	select HAVE_IMA_KEXEC
 +
+ config ARCH_SUPPORTS_KEXEC
+ 	bool
+=20
  config KEXEC
  	bool "Enable kexec system call"
  	depends on ARCH_SUPPORTS_KEXEC

--mwi5A3M40icvYNF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsITLsACgkQJNaLcl1U
h9B9zgf/UGCo8KEeQ4L21Z4sU7flB0MvRCs0XrS3logxJ3av4K79nucY6H9ycBCR
AfoPdhXHNvyytaOSObWbPEvrbY8W1Ggoqs1V5sG4a0vwfb6a74jYWhnHv/hMKAVl
MNFBInanYQI93Z/bW9HRqlmw1waCAfu23iIwNolAxgLP51JVJydkjQscCgclr+EI
HPR1N1L5+ipOC+55BChp27l7zlzLnJQT/eo6QLbFNO6L+jJcoDC+nshQjk67Rg8Q
WUlgF3xnTyvgpYWK7gTtOPiWRiJbUuJv91VYrDPvBR2enLInO3SFt/7SAdM13x9P
IeFZR8aoPwxHa6kW0THKHMHLpYXlig==
=9q5+
-----END PGP SIGNATURE-----

--mwi5A3M40icvYNF4--
