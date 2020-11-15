Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EA5C2D0E4
	for <linux-next@archiver.kernel.org>; Sun, 15 Nov 2020 23:45:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61BB1241A7
	for <linux-next@archiver.kernel.org>; Sun, 15 Nov 2020 23:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c6+W8xXg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgKOXow (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 15 Nov 2020 18:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgKOXow (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Nov 2020 18:44:52 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FB8C0613D1;
        Sun, 15 Nov 2020 15:44:52 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZ8270zfGz9sRR;
        Mon, 16 Nov 2020 10:44:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605483887;
        bh=CJI4uybuXE1Y3DgSUlwe6M6y80s0lD85qJPkm6MMXXM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c6+W8xXgg2ksq3PQCI2anSprRiGUzuNqoxR7MtZaO1KW2BgzYFM2jCoSWtMKlm889
         BSXklsWSMCAJNHZZ/jZTQuwOHkdQjO9b8lmotOMepEidJMpGEefaxsQuwB1WUHCPCI
         shuojrvW77HcQJ+DKhFURUvDaCz2dS4bD+H8fBozYwCKiTdnmSv3btZIiU9Q4fF7Lz
         /8DRpT/qau02we/zngW0XFoLx8LM+tlKFSK1tUCcaAaqNS0xjB0RGdFDToFk3YhEvQ
         08lOvWXayu6+UkpjHPTIG3p0Cmb8VWtrgxdLyoBiXeTtU65GMowv8WZQ6iNt3p6sNr
         rv+x+OF+Y5LvQ==
Date:   Mon, 16 Nov 2020 10:44:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20201116104444.044486ea@canb.auug.org.au>
In-Reply-To: <20201105175031.00e0b081@canb.auug.org.au>
References: <20201105175031.00e0b081@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5KjDEq3ByPRtzQ=Ny0g3gZZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5KjDEq3ByPRtzQ=Ny0g3gZZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 5 Nov 2020 17:50:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm tree, today's linux-next build (htmldocs) produced
> these warnings:
>=20
> include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vadd=
r' description in 'DMA_BUF_MAP_INIT_VADDR'
> include/linux/dma-buf-map.h:106: warning: Function parameter or member 'v=
addr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
> include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vadd=
r' description in 'DMA_BUF_MAP_INIT_VADDR'
>=20
> Introduced by commit
>=20
>   20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() inte=
rfaces")

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/5KjDEq3ByPRtzQ=Ny0g3gZZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+xvWwACgkQAVBC80lX
0Gyj7wf/aUzJdgB96pMouyzaU+j/xWIW5tyyigOoZp12WVgj7Pguu1HvTsijVYBG
1mkewmjaeYBQqMqzAWLsZyx3TlbqQVTBL2NG1r7YqM9B+/6vDrkOOyqHV6VXfQP2
0b7tHBwd8Pude0QxV0+goFtSeM7ac8ayOKH2GD1A40oEHUybqrHIAb29udiJkaiP
XOkMXCGyRdCvGtt4DHxfcop1u0KYCwsjAECol/yMUUBu9uZrq1YCR7mnU2hWmG5q
8o+BP5m9NzqyedXJ5xhObN3ctk6GoPHx1ujDbVWqEUpXSKiCsTVfmD977cV/qPgS
FjfOpc+HSpKsBWX9Dxy1sB199HZnOw==
=aCSm
-----END PGP SIGNATURE-----

--Sig_/5KjDEq3ByPRtzQ=Ny0g3gZZ--
