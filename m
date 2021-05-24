Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E20BC47080
	for <linux-next@archiver.kernel.org>; Mon, 24 May 2021 01:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 352B4610A8
	for <linux-next@archiver.kernel.org>; Mon, 24 May 2021 01:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhEXBjN (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 23 May 2021 21:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhEXBjM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 May 2021 21:39:12 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119A4C061574;
        Sun, 23 May 2021 18:37:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FpKb51RJWz9sRf;
        Mon, 24 May 2021 11:37:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621820257;
        bh=XaBJk3495M78Z+y+pUNfJiNVnjSnI0EKgVVZjvTpu4A=;
        h=Date:From:To:Cc:Subject:From;
        b=qRh9L6cGNr7YXXEqlP9oARZEokWJMJZICWwZorESJmB0RFG9LBp2U45uiw04p8DEj
         RC6AdDFIHQ7c+sWEy2rWNW41aVEFXMPCKnrWjsQqclc3TlUCIGbvwHZ+zMjPD4Iwz1
         GDLHMYWLyhaj6rpJpPs0vjbnwGLhvzT1m2M6XtSFWwhX4AzyuMX3JFRh+qZBF0FEjL
         Ir1yUX3PlrVwuVyzVs0B1K6ZE5NakDr0FtPRW/ReQn2IDSLYjiMPox3yTrQGWnOQa+
         wqmWs4JKTKd5O6wxcTIyfo1M47tURCUPVDKIEI8Kxuw37HDudWkJJdtc8xxjTSSh0O
         qLKC0zEFs88+Q==
Date:   Mon, 24 May 2021 11:37:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the extcon tree
Message-ID: <20210524113735.390fd12e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sqG.haoMa6DiMp/.rMuiaVK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sqG.haoMa6DiMp/.rMuiaVK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f5ecea194a66 ("extcon: intel-mrfld: Sync hardware and software state on i=
nit")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/sqG.haoMa6DiMp/.rMuiaVK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCrA18ACgkQAVBC80lX
0GxJOQf8DTHrzFvo11UOd7gHrdqSka5+csmTviFigB7/Rz1PKb7T/bV1i5SZUQQE
jnzsWKbtjRDays/U5QNGhTwJXjAu5QcNhDGufzrzizVBPcNsBQiou6caNwhgp9lp
Bk+VWlG1xh1AFZSC7Q0OmyZMa6FnaMYaZUSZjNSVFxSQTXf80LexDl5dDYRCmirk
7MzdehgvSSjYOX0f2U4JIFRDp1dON1qucuViqc+5wSMjqGGxkJ6GdxsbWIMYUH7h
lPfgsZAdIl9BfXjvUK53CMPfkprIcA2z0inXy1RPS27pvKtAtSHd4HHl9TMuvEzT
SmCAOHy/VJxZojpu7aolpBaTHB2xbA==
=wiOv
-----END PGP SIGNATURE-----

--Sig_/sqG.haoMa6DiMp/.rMuiaVK--
