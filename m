Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB3EC47094
	for <linux-next@archiver.kernel.org>; Mon,  7 Jun 2021 23:10:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47FD861208
	for <linux-next@archiver.kernel.org>; Mon,  7 Jun 2021 23:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFGXMh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 7 Jun 2021 19:12:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51441 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230183AbhFGXMh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Jun 2021 19:12:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FzTcg3rzvz9sW6;
        Tue,  8 Jun 2021 09:10:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623107443;
        bh=ptLaC7sl5knHDy3aO9Mcure+HI4yMOSrffDUY8rxRWU=;
        h=Date:From:To:Cc:Subject:From;
        b=g/+5/TKziTd7qaSYySZajQcUUiSSBjrUS3tbkNb/rbtmzpYHJGnKDes46uRetv6jc
         +/fpauAI9q0yATUqU0x/JY4dixfaxk30EzJPIrj8zxotqTt3eN0w12AcAC40D0QFlI
         aEfCszW04fkB2p5Bwo0jgpotU3kfYM6ZC7SN18dO1ayCKEdB+rE9wZPpxFxwomZWL/
         ihi38qcsbegNlt/IjyId5NxJuRpRH/+okgwAmFyuQpmVVO/ZkrNDswoOboHWDymKTo
         sBGIMSoLPGqcJ0YO+kVouP0vQQloDCqjlLCmM4y0QGoVKS2f00h/S+wI+1xiJ9xO9y
         LUTERlGBneyIA==
Date:   Tue, 8 Jun 2021 09:10:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the iommu tree
Message-ID: <20210608091042.7d1f34ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eAH1osD41ozPhYlqD8l+4Pv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eAH1osD41ozPhYlqD8l+4Pv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9561dd434860 ("iommu/dma: Fix IOVA reserve dma ranges")

is missing a Signed-off-by from its author.

Please try to not use a mailing list mangled address for a commit author.

--=20
Cheers,
Stephen Rothwell

--Sig_/eAH1osD41ozPhYlqD8l+4Pv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC+p3IACgkQAVBC80lX
0GwJpAf8CbNzmdg68KsjH5QaIiXLe1gVv4K0QlCGbcPsLwzdO0HyWHbAUcFU2Bk0
MGuDyniGmr6pmkUAUQ3jFJpUuJFRYYT//q9jO9wGkj9iO00rWQhHDyP2/Cdh4NhQ
s5FrlZBBVTD3IA8JIN4k3i1yd6dU7CEn90XbPlnX2LgQEH60jUtkov7Bi4oTKdcM
maVQGzCx6ltRo7Q19uQo+uH+ijdsXb05u+oX3fUIEc+KomaTTb6kBWBqT5IgU6pN
CPi+W1uwjsXBf8Ya31Qkjxx3uF1Fc5Hazel5HZ5KQmZW+/fimU4AkqHV13qZH7Mu
sgvUzNeqcUBdPbpKz9Pkil+zeelZBw==
=AYg7
-----END PGP SIGNATURE-----

--Sig_/eAH1osD41ozPhYlqD8l+4Pv--
