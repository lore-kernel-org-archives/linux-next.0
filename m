Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF4FC433E6
	for <linux-next@archiver.kernel.org>; Sun, 21 Feb 2021 21:34:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CF3064EC3
	for <linux-next@archiver.kernel.org>; Sun, 21 Feb 2021 21:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhBUVd7 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 21 Feb 2021 16:33:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230290AbhBUVd7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 16:33:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkJT82vsJz9sBJ;
        Mon, 22 Feb 2021 08:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613943196;
        bh=IbxGJsxvj1ZlCQ4RbuFebUEI12K8mNzBOa1yzPukin0=;
        h=Date:From:To:Cc:Subject:From;
        b=cfc0a6+fKs8E0CW4Z4UueIVlF9cS5I/tBeARuNuW5cOTmZbU+b4f1STsZZHeLnnJJ
         Zg32YiOWF7moVwPTyTbEwXxlpj5FnCjxFAS5ymwt0OamCfednsoEPUFuawEzJnqWya
         irSv/moFflp+DeAMVErLWTllb3FYauSJ2HFk5UhgmJ8RzN4YfuPDoAS/x8DxkwInf9
         wlVAUSxvZKFEtcN3NjCtq6/whwv0Axyt3DM8RKMsNG7wNHOYtKZRPy5JrqgoGL97OX
         3MSu5zqvsiyfdbeeXjlk+TcBTGxDOEWjoHh+fTOo1j+fdvU+LbqlI8uaiRwFelmf32
         QR2wYMWnHtZqg==
Date:   Mon, 22 Feb 2021 08:33:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20210222083315.39fbe380@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cpTwF4.AgG+mkXhmV9rXrof";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cpTwF4.AgG+mkXhmV9rXrof
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) failed like this:

cc1: fatal error: FORCE: No such file or directory
compilation terminated.

Presuably caused by commit

  15bb90419621 ("arch: syscalls: add missing FORCE and fix 'targets' to mak=
e if_changed work")

I have used the kbuild tree from next-20210219 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/cpTwF4.AgG+mkXhmV9rXrof
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAy0ZsACgkQAVBC80lX
0GxsXgf/UFuUbBqYw/lR0iLNffEvS9DbQ6l8Qj3X1k9vLTwZ59OIq541kyBwf5TZ
JOK48Bq7vG86V6nnpSXH84x4tuAUGNLGyMoPJYm6crD2wmexKoHqeLIwuL5yitSl
cyYd2aZrLz/JSIUv/cw6ikz2CXMbzjNdAG7isMEkMZ2TEFc/G3jRJJ4LK4gpRVwE
8vwP1IfaujlY8Pk2z9aSEYvwn0C5Tl+a8FGL1TBiaelQM3p8WB2atKGwtkfaipZz
Ss8ac3vvC3mrD8imxOmyXDzcKfXMJTzuN+EiLXqtFhJAu6R/ppuZ+62Lfc3/F+9T
ENmA6ecSXsDyJn5tonoI3x2ntFzmIg==
=d6x2
-----END PGP SIGNATURE-----

--Sig_/cpTwF4.AgG+mkXhmV9rXrof--
