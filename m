Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD5DC54EBC
	for <linux-next@archiver.kernel.org>; Tue, 10 Jan 2023 21:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbjAJVlA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 10 Jan 2023 16:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjAJVkz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Jan 2023 16:40:55 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B45BEB;
        Tue, 10 Jan 2023 13:40:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ns44K33Pkz4xGM;
        Wed, 11 Jan 2023 08:40:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1673386849;
        bh=TRwYzKmUSX9HOCD2QC38VqsU44iJMBfkk1Oww7rCQF0=;
        h=Date:From:To:Cc:Subject:From;
        b=CnH4egbIqB4cMpLG2rqx1OSmjXFZPK8znKIXCr+vNf3Fwykp4Kll+psQKSHgPsOan
         2LX54lP/nhFd7SHrcURNWAyR0CVTlONxCrOrc5LrXgdvORVyoWR6Z1sEtsIjNrhPPc
         LK90pjcQEIG1v1+u0VEoBvluPGmZpZND6XnPWgDLfGb/FVQNbae1Vi9+zWFgWvUy4S
         uHwLuqFINfUSqIsWjDaIi+dJ6D6e8JwPKNowm6Ny+J6dGNFgRaXrSJk4CSCouNsJHO
         0OnaPXHHrolhinZmdFqGz6W99Mmzg2YbqO+d4PbbfVpuvZABBmUORiznWBauUlOxLw
         7wEoiWID/nLOg==
Date:   Wed, 11 Jan 2023 08:40:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nvmem tree
Message-ID: <20230111084047.42ffedbb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kq.jjSJWZYRkK=VQCdb3CDk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kq.jjSJWZYRkK=VQCdb3CDk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  af0f8ec24990 ("nvmem: core: fix return value")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/kq.jjSJWZYRkK=VQCdb3CDk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO9218ACgkQAVBC80lX
0GxhzggAkyUYLidTwRfvK3+7wfjWIklQGeAKotXKhsoBQJtJVGNC2Nigzn1G8FZi
abwdtr3pz1d0kw01cCZbxvwgGaannDqgsP6FGblZN37eFxjghDVCEofh0e+xFJGb
nOxbZlI2LODUzoRxNIHaHCoYIeJQmz/9XQLqjub1iTGkbnxUtniwDiCzyt5YPYay
B3cveiEXT9HiSbpWiEtJP55ezgpQ+CUJS9wnLTmwt1+BD1W52sykoAIytKOgeunk
KOhiSWtTBZqCUcCRfL8718YE9cqoLIMIlLWNDG+rtWRV1pcQY379eopIczTmeA9m
49Wb0Y65G/JmmnBbzGkoJpvhAKau5w==
=fPZR
-----END PGP SIGNATURE-----

--Sig_/kq.jjSJWZYRkK=VQCdb3CDk--
