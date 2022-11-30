Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED73C4167B
	for <linux-next@archiver.kernel.org>; Wed, 30 Nov 2022 02:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbiK3CyU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 29 Nov 2022 21:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiK3CyT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Nov 2022 21:54:19 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8A549B56;
        Tue, 29 Nov 2022 18:54:17 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMP1L45g5z4x2c;
        Wed, 30 Nov 2022 13:54:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1669776856;
        bh=rmbLL7A/OECr8Pm7FvnSrW7zvHrKAED2jbkgPYet9Ho=;
        h=Date:From:To:Cc:Subject:From;
        b=jRPZgKvUFFdPP2V9StpxYv1pIomCDRzyiTKUqZ+f1tqvXVmVQ9D5Rx0LiiarZ0HHN
         eX9dBAbMXFovt71W8l9wFBLRoBQiDKsi0ZJSFkHGDZcAzfD1jgjCsngvm/IpVuq0po
         9fPLGuliRegoiTxHwo7HLhK2YIcRw5gtfdu+zRBjZSigvzdpgHJZThHzidOsISsa+r
         uTQqdT+qgcAHxZw1jqBN+HU7/sFRzHj04xi8HI/pGwUjvmP71jNQ2HUDjmBx2y91Sr
         zLm8OmFaRwuoUHlJ47FGTlBwyHK7hEJabnhvJsbM910CiCPU5Mnq+pKHN4Ids6xSFn
         KlXvohHcOLkoQ==
Date:   Wed, 30 Nov 2022 13:54:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ard Biesheuvel <ardb@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the efi tree with the loongarch tree
Message-ID: <20221130135413.140c850b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YF9Fup445u6o3wbBHC8Wket";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YF9Fup445u6o3wbBHC8Wket
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the efi tree got a conflict in:

  arch/loongarch/kernel/efi.c

between commit:

  113b340ca07a ("LoongArch: Add FDT booting support from efi system table")

from the loongarch tree and commit:

  732ea9db9d8a ("efi: libstub: Move screen_info handling to common code")

from the efi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/loongarch/kernel/efi.c
index 47d03b133053,d75ce73e8ff8..000000000000
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@@ -54,17 -52,27 +54,38 @@@ void __init efi_runtime_init(void
  	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
  }
 =20
 +void __init *efi_fdt_pointer(void)
 +{
 +	if (!efi_systab)
 +		return NULL;
 +
 +	if (fdt_pointer =3D=3D EFI_INVALID_TABLE_ADDR)
 +		return NULL;
 +
 +	return early_memremap_ro(fdt_pointer, SZ_64K);
 +}
 +
+ unsigned long __initdata screen_info_table =3D EFI_INVALID_TABLE_ADDR;
+=20
+ static void __init init_screen_info(void)
+ {
+ 	struct screen_info *si;
+=20
+ 	if (screen_info_table =3D=3D EFI_INVALID_TABLE_ADDR)
+ 		return;
+=20
+ 	si =3D early_memremap(screen_info_table, sizeof(*si));
+ 	if (!si) {
+ 		pr_err("Could not map screen_info config table\n");
+ 		return;
+ 	}
+ 	screen_info =3D *si;
+ 	memset(si, 0, sizeof(*si));
+ 	early_memunmap(si, sizeof(*si));
+=20
+ 	memblock_reserve(screen_info.lfb_base, screen_info.lfb_size);
+ }
+=20
  void __init efi_init(void)
  {
  	int size;

--Sig_/YF9Fup445u6o3wbBHC8Wket
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOGxdUACgkQAVBC80lX
0GyEwwf+LWn8tz4gdtKdeXpX4hsfDJAaHHC5oDdvrCfiEyNnu3wTkjjHGdpml5T9
UvXJTQlCWvs9HbNACny6NNwyvq8vsGc4YKobhlUVr77Vf/iU1jt/5auiE1QcDK6I
rPA0eudq3n31GJZwMsnN42q/xLHxZEdWRd14QMk2Xl0PFR0/rdJgWSE9iCjVEC0K
16lJN4eDNx9MacrLWvigp0LdPoONOzFuhktQrNRSof3BXUh1aVvb//Cv4+E+yMMw
0fYqSPQmZiljX5d54kLB/AtSlYsAvN90CKsdZaWpz10rTScbZXbYUXfBV1CX4E7O
DxjEFdQJ44fo72Hyw6T0b/l4s10a8g==
=lKcd
-----END PGP SIGNATURE-----

--Sig_/YF9Fup445u6o3wbBHC8Wket--
