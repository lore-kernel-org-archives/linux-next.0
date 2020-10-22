Return-Path: <SRS0=Zjsn=D5=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8EDC388F7
	for <linux-next@archiver.kernel.org>; Thu, 22 Oct 2020 23:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A744223C7
	for <linux-next@archiver.kernel.org>; Thu, 22 Oct 2020 23:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W6fjfQuw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373510AbgJVXsq (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 22 Oct 2020 19:48:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S373215AbgJVXsq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Oct 2020 19:48:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CHPFl4nyHz9sTD;
        Fri, 23 Oct 2020 10:48:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603410523;
        bh=Vp31XlspfHAT+BdkSJjOEMe9eXm8LZQtrhl5aVZzyXs=;
        h=Date:From:To:Cc:Subject:From;
        b=W6fjfQuwevJ6eBPORixfK1SSukbrsNfluic70iRctJ5HJMrSOftaClHJgovs6338h
         jog3HUBBZIDpF/mFcwwSPp/yyyGJ+OgI9ANwyoAT371kHZ61plAxaMlJyi9hXqJX3F
         nAsbZ4cZbX1lYopp1/eAvRwRAicZHImDUaFd1q05C0btHtyWX2gfKyBFXO9wwBI7yR
         7bM02tbdZXgdAblaceUVUaLmKKqZ44mzfywK/3JKzRIaD8Fc+au/Hh2PnYFUu4vtC8
         Gq3LyvRjQRJtHQxdkicG3QjyDquuN0ccYi5F7GqZZVefFZ32id04UBK+HsIqdK8VuL
         iC+62ojhEp7+Q==
Date:   Fri, 23 Oct 2020 10:48:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20201023104840.7a94077e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b.Ex.W_psq4csBPO4Q/Nqpb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b.Ex.W_psq4csBPO4Q/Nqpb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (KCONFIG_NAME)
produced this warning:

fs/io_uring.c: In function 'loop_rw_iter':
fs/io_uring.c:3141:21: warning: cast to pointer from integer of different s=
ize [-Wint-to-pointer-cast]
 3141 |    iovec.iov_base =3D (void __user *) req->rw.addr;
      |                     ^

Introduced by commit

  a5371db1e38d ("io_uring: make loop_rw_iter() use original user supplied p=
ointers")

--=20
Cheers,
Stephen Rothwell

--Sig_/b.Ex.W_psq4csBPO4Q/Nqpb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+SGlgACgkQAVBC80lX
0GwTOgf8CmVd2PxRmX0ggwKuOLlKbqJy+iYIMwdUfPKcJb4HjTDP2xakQYz+IrM7
UQmpqB4grIak/kO/XpahnKcr3m3foDQmcn5DY8ZBtJjrGiH7uy8vdrqG/4QzU/8x
23tk/nXksvPFJywM71kdoLp8TyU+61x+7Dar3tIneTQAwK7Jdhrlx1PV9KLrG5li
XQ9vQHjYO61Av6KN2vxPYf9AghI6TDG+iukY2cnmpQy18BO3Gzt3ye4zfMEizLAa
k9Nx8ZG1vPC0IFNdNROtIUuMaY5Eg5jE4RupWWgfAsqjWdqeACUhOp18shKXbMd5
Ev/U10SNn65H/4LgWi2qXCBNpNAHRw==
=zl2U
-----END PGP SIGNATURE-----

--Sig_/b.Ex.W_psq4csBPO4Q/Nqpb--
