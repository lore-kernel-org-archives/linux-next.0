Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706198;
	b=Pju7C1p9l1MkgHmKWEdE7cEMyaSy1OYsSiYGAZvHjMoGqahin9qeo5roP81MgkoWD58H
	 72ORzZ0c0Vpz30Q3axTWmJ5o6bInZN0fUwRaHTRn5mM2XNahKlxe/ONfkeeNvrHNUvfQJ
	 CJFRGnrfmfZHbi/I4CwNrplMN/hfBK/y2nRaeNdgwZW4qZcfK2e1gkrgki0qEn/ehGsVB
	 RMUy+jWOBxTqiJ2ufeqqL05AVpTdIZXTj1JaZuvlXBadoAsdEp+dXJo6BH3/Z9I4wfJjE
	 fGKPYEGCBQk2kZYsuD6Q3YtddPuqPCJeQMhlOBoJgIzukkASP1/iKGWXsSq1igCUp3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706198;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=qudMBcNoO9UBxMWp+ZB34v3HVnJHiuGS8CcvWLCJZW4=;
	b=REU+MLhlzYaZlvgGf32+91w7MDLdyOxejCI6VJE5Px64qr1NXb2RTrnGKyaXx1PmLeNN
	 t++9Xq95EpSm0xhOCcK9g8nJZIHZuUroZ8HccduDe6gBtcGVsxoey8OZP1C1SGiwVZuWB
	 IWz4nlOuucUV/89pslZxDk8+rgHxy41SfyrlCeaD+plCz36jCOg9QW9zd0UZwFguHTYnf
	 H2OIj+crJxeShLxEQR2HTsIswQUYzxzepU35uWudL1DSDEC+ChAncCQcYxEwvSsIP5O4I
	 FRbygutioFP4nTvMzXUHTMYjBO2huKoYvCb6Ofh5Y7VWr1mqLy3Gfa6epN2ry5a6Svg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsJDk4lD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B74606A32A;
	Thu, 26 Nov 2026 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsJDk4lD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514321F000C6;
	Thu, 26 Nov 2026 15:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795706197;
	bh=qudMBcNoO9UBxMWp+ZB34v3HVnJHiuGS8CcvWLCJZW4=;
	h=Date:From:To:Cc:Subject;
	b=fsJDk4lDRYLPVo9rkQNioWcoERjwTjGO4d/4h0KkM6R206t5n39oWiM1LzDu4YKQ3
	 uV1pC6yBZhoTwbwlbxX+8JQ04xbR725JKSLB7ZgAWzSV3vxmL2M2zyLmcTPxzvMZ8p
	 Qb9Ogrju3cPbz9okVijfTWssqLGt6CJv3uYocvgaJbxkWT0l86IFCW8Mm9EkqC/O5s
	 GY2XUPeRdEE738IniWT6ezai0R3EfkYDggFOeu2+cnx2ygBRc0PE8/z1uasLdTe4N4
	 gAvamdgdLHrvCRLimsA7b0iPdlrsfkqeRafTXDRHSFOZVCvvx/HM1dVhMt8QKq73fc
	 cx7/DxDZB9Xxg==
Date: Thu, 26 Nov 2026 15:16:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Chen Pei <cp0613@linux.alibaba.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the liveupdate tree with the kexec tree
Message-ID: <awhNUUXe4ywAjq8b@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="NaCE6olhrV5gsvqL"
Content-Disposition: inline


--NaCE6olhrV5gsvqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the liveupdate tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  e583fcbe5b585 ("arch, kexec: declare kexec and crash capabilities in Kcon=
fig.kexec")

=66rom the kexec tree and commit:

  48ea610913a6d ("riscv: Add support for KHO")

=66rom the liveupdate tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I imagine this isn't an ideal resolution and the new hunk should also
move over to Kconfig.kexec but git rerere won't remember that.

diff --cc arch/riscv/Kconfig
index ed02c6ad0cca2,a5c56252ff44a..0000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -1120,9 -1116,30 +1120,12 @@@ config ARCH_SELECTS_KEXE
  config ARCH_SELECTS_KEXEC_FILE
  	def_bool y
  	depends on KEXEC_FILE
 -	select HAVE_IMA_KEXEC if IMA
 +	select HAVE_IMA_KEXEC_OF if IMA
  	select KEXEC_ELF
 =20
 -config ARCH_SUPPORTS_KEXEC_PURGATORY
 -	def_bool ARCH_SUPPORTS_KEXEC_FILE
 -
+ config ARCH_SUPPORTS_KEXEC_HANDOVER
+ 	def_bool 64BIT && MMU
+=20
 -config ARCH_SUPPORTS_CRASH_DUMP
 -	def_bool y
 -
 -config ARCH_DEFAULT_CRASH_DUMP
 -	def_bool y
 -
 -config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 -	def_bool CRASH_RESERVE
 -
 -config ARCH_SUPPORTS_CRASH_HOTPLUG
 -	def_bool y
 -
  config COMPAT
  	bool "Kernel support for 32-bit U-mode"
  	default 64BIT

--NaCE6olhrV5gsvqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsITVEACgkQJNaLcl1U
h9DbCwf/ShGENleX95A1csOqu8XGQRStMhhpPnNXrfSJRapIjveTtx+Znkp5iVsW
gDg8x9JU/b3eSUf8D/sYul6rjrUOqfId/piKCTPbDcdg/oWGQ2zbop0E5uHZq7NJ
x+ThSLTLXPxXoKDbqPAnR5naYdSejhu1VRKU9cuT1sFLHQ6JAYtX4/JU+XqD2w+c
lxXmWIL3bszQfP45fNoQpvCbDp3mEb42rJc7fj6BHe7tH5M34LmzRnQuF07aOOn5
uboKzQrkn5e3LFTn1gOCGJrbu3OEu+8279hGV7TODPtqf/BGQueTB9GwjRnO+UwS
D9ueUUBBwW5NS4PDri9ifaKURYaZKg==
=R8BK
-----END PGP SIGNATURE-----

--NaCE6olhrV5gsvqL--
