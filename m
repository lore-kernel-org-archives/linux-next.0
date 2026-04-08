Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF803D1CB4;
	Wed,  8 Apr 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657401; cv=none; b=AmFDLGom0LScrxgsWkV2Fa1UIcH7ny7oYrEIrpgpxgds2BGLtxltjPmZQ27nGk+S0cczJ9Tv5yxvwnGHHPxQ2HeC9bqf4/6E1VBZGwg+kmtxLQu7Vr6ug5vfgbUbu0xfWSOXWAsQKgHJRpqND3sKQfiksmiaG8pkZduVtcWt9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657401; c=relaxed/simple;
	bh=HwMjuFf9hFpInJFsEXQixQH/FdqdINB2qpjZrXxK7iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OEFhcupk776UNFDzz93vc/YhLX9IwXHmt/jTk8KJSKdBme3riXWwdvv/I3dBlH3LZ1JICI1MP/IMAck8dbPWhmigrwgCCG6vglNEsT/srGyAkTeLMTfBulLoPZPOdtE6+qPhcbRb8HGwFPvfqqVU/laVauuvokhCJSEwYCJ7YFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyyIDC+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyyIDC+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C553C19421;
	Wed,  8 Apr 2026 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775657401;
	bh=HwMjuFf9hFpInJFsEXQixQH/FdqdINB2qpjZrXxK7iI=;
	h=Date:From:To:Cc:Subject:From;
	b=MyyIDC+9+e9KkRbdsH3uLMWKqAljHQVuD8Yy8PvVDB+ivN6c687Y5RAnYQnCmcUCs
	 CIb7YOcOMieiXUrvlkT6/1V7Pe8m7DWyRXU3zm34jgv8DIyysyz0/w4VcdSM+jkBhw
	 UA62A7Uguhx7iTDQM4MhLptzzsOt53JGEMSA5pIJbGBCHWRmYxx6f5sJXf0A9HOSKQ
	 quMUvo0YIBTvrygTTD+UXpqfgOZBRgtqWFch4eYkbPGXNW9cq3Vcrl9JNnjWIitm6A
	 xFp1mmsSaYl7Sps7q8msCFJN57ijniIVi4eYXxo2wC5DU3qdLtjEwUVtp8wQnlGZmk
	 hUxloY/lreDAw==
Date: Wed, 8 Apr 2026 15:09:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: Helge Deller <deller@gmx.de>, Joe Lawrence <joe.lawrence@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the modules tree with the parisc tree
Message-ID: <adZhtIAd2spyp2Pk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V8wG3/7pi9P6KkdL"
Content-Disposition: inline


--V8wG3/7pi9P6KkdL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  scripts/module.lds.S

between commit:

  a62155bbcdd56 ("module.lds.S: Fix modules on 32-bit parisc architecture")

=66rom the parisc tree and commit:

  4afc71bba8b7d ("module.lds,codetag: force 0 sh_addr for sections")

=66rom the modules tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/module.lds.S
index 7c017b997fd74,2dc4c8c3e667e..0000000000000
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@@ -38,16 -37,14 +37,16 @@@ SECTIONS=20
  	.init.klp_objects	0 : ALIGN(8) { KEEP(*(.init.klp_objects)) }
 =20
  #ifdef CONFIG_ARCH_USES_CFI_TRAPS
- 	__kcfi_traps		: { KEEP(*(.kcfi_traps)) }
+ 	__kcfi_traps		0 : { KEEP(*(.kcfi_traps)) }
  #endif
 =20
 +#ifndef CONFIG_ARCH_WANTS_MODULES_TEXT_SECTIONS
- 	.text : {
+ 	.text			0 : {
  		*(.text .text.[0-9a-zA-Z_]*)
  	}
 +#endif
 =20
- 	.bss : {
+ 	.bss			0 : {
  		*(.bss .bss.[0-9a-zA-Z_]*)
  		*(.bss..L*)
  	}

--V8wG3/7pi9P6KkdL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWYbQACgkQJNaLcl1U
h9AOJggAgsxuRU9tYhP+8YgXWx9xfyuYUDDxMlerp4EM+oKnREQJ8Ly0kOaHfuTA
caRKqAf6DGvONy5CJ0+zaiv/x4ylnAMG6s4Y1h8i7H3uuJUpg/czZPfxJQR8SATa
ow8u50MuK0G4yu1bxNT5rfczE/kkPxv/f43gH0UKWrRsqpgj5nzBUcdAXY1vrDGt
OSPnj0/sXBOPHkAJwh9Q65ey+5kCnDItw+Ef0BJHHP/0z76HQUXZiHvx4F70vdpM
+0r5VepmrGkyTH4mRPpZb9nF7U0PZ8tEbtGCM6BIcmYDaMykly8pxZrByBd5Tlwj
2WyM0Mmf00RbIZCq9Ymz998jEtEtBA==
=daSU
-----END PGP SIGNATURE-----

--V8wG3/7pi9P6KkdL--
