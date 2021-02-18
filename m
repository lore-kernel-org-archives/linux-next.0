Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC15BC433DB
	for <linux-next@archiver.kernel.org>; Thu, 18 Feb 2021 01:57:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B9116146D
	for <linux-next@archiver.kernel.org>; Thu, 18 Feb 2021 01:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhBRB5o (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhBRB5n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2021 20:57:43 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6517EC061574;
        Wed, 17 Feb 2021 17:57:03 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DgyWH6NPbz9s1l;
        Thu, 18 Feb 2021 12:56:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613613420;
        bh=Rj1JFTBLhwgOYcq4a6cmRW8u5pmuGljtPL6ihhJukfk=;
        h=Date:From:To:Cc:Subject:From;
        b=HXitPA5PkPxkL6f7NHnabeIcfZfaxiMD+VW+gQZuW+3HCGIJ8WYO6i7VlXmfIDx12
         PZuL/LNUDImugF1iIDd0XilEtdyZk1HDEJnd/xMhbJHTrOtuYpW8asi4XiC3DbQXUN
         i9DFzc+lk/wFuxAoyl5/OJYqitdH7rVTo90mGXAwcuvjp17EX9WHl57QVysyFyrrBQ
         79o2Hwtiitj2VsSnZYQ2SZPfpEUGZ4CE8N7fIFBj+FTaRw2d+cb86f6QXtMtQr8Vk/
         oJ+bBAXxyboO0CeBSar4K2KN5OPncwJS7BuK4HvQvyi/uv9AcB8JWwNPaz/elrwOhg
         fA7uWsiKYFn4g==
Date:   Thu, 18 Feb 2021 12:56:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the devicetree tree
Message-ID: <20210218125657.5cc7bf07@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O2=u=w676jhKk9KoJV2WEje";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O2=u=w676jhKk9KoJV2WEje
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  bc5d1d0f8b38 ("Revert "powerpc: Move ima buffer fields to struct kimage"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/O2=u=w676jhKk9KoJV2WEje
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAtyWkACgkQAVBC80lX
0Gzdvgf/YeT8osX0Yme5D6w5QDlnkZ9/LaQkW9wIKKyxpozVLdG8fGdFRCJyHYw5
CIMst8hmo/Q2bBxgmdj+Wgvg/YmOVjhp7iH8De5BnfSJ1t/hdyXplRA3gpZhTdF6
NjmvymOSHyJcFeuzoPc1IiTZaFrwYHetn/P7fWzDQeoTLWDYGQZ6bdRoFTHKAKuT
yKMSWIF9RPfimqbVJLwTso8jegGgEC77HK9kpWAhpQXfp1i1yDs+v0dYCKHGXQZ5
Xwj4v19Bp9pSavwnXmF97TuaM6WTg7PTfkGkwKOirbpffJEq1VKcPB/88lBK/6rF
7RMIYYXTX2tAcH9pFiGiREP2z8f6qw==
=ABpi
-----END PGP SIGNATURE-----

--Sig_/O2=u=w676jhKk9KoJV2WEje--
