Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932537AA9A;
	Tue, 18 Aug 2026 20:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086471; cv=none; b=r2f7P+G3t9W+bD+UhW+DWwuIJiN7CSrKG6UI6lPJ5JfCXw966Ai2u9aywel3beoKZfjL1t76e6MGKs7fTSXJd2R50wLQu88leijuTWkmpRc5q0lan4hvX6lmS7TLuuVvROgWSYv344e+TWldKsTn6u9JHhcx4FE+dGQsYHd836M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086471; c=relaxed/simple;
	bh=ZOM97AdhglQaOLW94dgmSuR29Je3kjTlTfWO8JCpBOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=csnzNDeJSOysZhP7mFz2BvVVzlN1yHWgjZuP8PfvI3T5n3pZ4pNCKGrhTEXThkGs+RYdKJsD6P9LEncGvWCke5DZ8566/fhhjfpP+E2a7yqsyXwUziA6/50nEKB77UO9d5PGXDW3GVf0molQ9UygdmjKuZGKaiz92aQ3thiFCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWecNz8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWecNz8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C542A1F000E9;
	Tue, 18 Aug 2026 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787086470;
	bh=Dyg3zX+xqFc+z+sgiUVS1oN4Oo22li4y9Rm4HnMHR6c=;
	h=Date:From:To:Cc:Subject;
	b=bWecNz8UipTxxz/qlbWM0M4nZyUv2SY26pXhUGHHclaVQVh80ShZUG8xa+yYuQ5pr
	 OIdCeC7fSNxOtfn/BVeH8nppxuFSw+46Q1pR6t8flMYbnmWpgNbUC7OU2qR8k9jthH
	 yavj2c08FdBCsPFOCRkwt6RyPqbUWegH2CtaFkM/3PFT0Ri55GiHgdCHn6ce6ELD4j
	 OIQ9RLp3NnxAkwzTECrkS/vffAWggXB2nZE3b7TnWphUlqDRL2oYUhWsaADGI1FBTC
	 DpNHDgCIa8Fh1oj6sAMCcuI8spGh3t7vHMLAP8VbZPvHCaefTae6/H4g2iH/ERsJ05
	 vq4Qi3a0M8BQg==
Date: Tue, 18 Aug 2026 21:54:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <aoTGgoeZ_FormkL-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/Z36UJLNwThYb40"
Content-Disposition: inline


--z/Z36UJLNwThYb40
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the  tree, today's linux-next build
(arm64 allyesconfig) failed like this:

ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/efi-stub.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/fdt.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/file.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/gop.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/intrinsics.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-fdt.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-fdt_empty_tree.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-fdt_ro.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-fdt_rw.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-fdt_sw.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-fdt_wip.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/mem.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/printk.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/random.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/secureboot.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/string.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/systable.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/tpm.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/vsprintf.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/alignedmem.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/arm64-stub.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/arm64.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/kaslr.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-cmdline.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/lib-ctype.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/pci.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/randomalloc.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/skip_spaces.stub.o'
ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/smbios.stub.o'
make[3]: *** [/tmp/next/build/scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1

Presumably caused by commit

   c19ac4abbd696 (efi/libstub: Remove obsolete .note.gnu.property workaround)

though I did not verify.  I have ignored this for today.

--z/Z36UJLNwThYb40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqExoEACgkQJNaLcl1U
h9BojQf+LdFc+t3LPPkBj6+vw9UMtiI5te81KuDM7KRbIty746U3b9Cw3XSFVwxk
Uxgx5yPuvFu54H72YeA/114Myeq6CORBhmAROEal3F0wSiuj3+tYpyVv9pNVU9hg
n9PeCyOZ0BjfGR5fCxwcCK20loycLdweZmGV7wWNSoUOTSExZpBXrihr99lf5PaM
LLMwEYco7ESY69IwE1046WRKANcbmUaRCffUuLRR9LV7LqWGnMRPTUMifmtCUeht
cY28rl3btqg/0HyA9Ia+Xwii/3mXPeAxSygzfad+Vz/Tlsc0lHFlj1BV7ltuAFoI
ZIHrrn5BLbP9Lwdy3jhi5LjCRxWHSg==
=HenW
-----END PGP SIGNATURE-----

--z/Z36UJLNwThYb40--
