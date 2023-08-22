Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47814EE4996
	for <linux-next@archiver.kernel.org>; Tue, 22 Aug 2023 06:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbjHVGtK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 22 Aug 2023 02:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbjHVGtH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Aug 2023 02:49:07 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2810F132;
        Mon, 21 Aug 2023 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1692686940;
        bh=9ashWCaTQlyedMrQiD4mxVwH5WerttvZVHlRU2iz5RA=;
        h=Date:From:To:Cc:Subject:From;
        b=c3dhzSD6U37PLkz+te2Lc3fSPoPxZjyGcMXre8eheE5v6I/c0T0WViMntwGtGzCHE
         et5PCm6ZDc7JNVLQelURIzLUvjBRIzXe4psD03rw85sZJwHfXoKNta3FAMDBffe0su
         iKo55rsHQu5L5bF6LBKtTmh1zw5DTtZdYJtkFthjlZVpj+U6scFPH55feT6qgtglor
         szxubZUXY5NtnHWQXk6Z5CHTBSPGxtP/sbhIJ43n37DLc7tOs8WIM+U8M9WNI6bwxx
         BzXISB+a5dwhOQsEh7WeHreCrU74YvCORy0Dkr+G2hLcE2R85spd7qSR1/0rYWdjwp
         7Tx4VJhrQrhMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVKgw5pS4z4wxQ;
        Tue, 22 Aug 2023 16:49:00 +1000 (AEST)
Date:   Tue, 22 Aug 2023 16:48:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the efi tree
Message-ID: <20230822164859.26b0b8f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JOboGHrVUi1dGMnAw_Wk03f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JOboGHrVUi1dGMnAw_Wk03f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the efi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/platform/x86/uv_sysfs.c:14:
arch/x86/include/asm/uv/bios.h:118:22: error: expected ')' before '*' token
  118 |         u64 (__efiapi *function)(enum uv_bios_cmd, ...);
      |                      ^~
      |                      )

Caused by commit

  73632c8c865f ("efi/runtime-wrappers: Remove duplicated macro for service =
returning void")

I havwe used the efi tree from next-20230821 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/JOboGHrVUi1dGMnAw_Wk03f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTkWlsACgkQAVBC80lX
0Gz1cgf/QQGeZO3NVwT2mw7tdbII5yCHcrJ9X6+0oUSt/c1h4NdXGtzebgE2uKeW
PD32LiWG5QnpDwcl46byi8vjqekXlV7wanY0447rm0N/0Es7mW1nIQ/tikLSTGc/
hnXQQ1WOjDY8Gaceg9Rq/kYDkOf3md5Y0mnhn3T3dxh6qaJoFxVYnEH2SBD7iizY
eIxWBT0OWPBavFiKidqtuX8DnPuEkOzuQqChpCrmC5OI+Q53VktMatUt3T32nSta
zgMpLhHBNhp8+SW+RBgwehWdiJYolzH+4CJAEJ+zsw2eiCAM5hipCEtl4ZUDsEU2
YcZmZeinZ0kKx3aJQnOJf+H6NQKagQ==
=S8dF
-----END PGP SIGNATURE-----

--Sig_/JOboGHrVUi1dGMnAw_Wk03f--
