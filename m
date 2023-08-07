Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50E2C001DE
	for <linux-next@archiver.kernel.org>; Mon,  7 Aug 2023 22:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjHGWjr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 7 Aug 2023 18:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjHGWjq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Aug 2023 18:39:46 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332FC114;
        Mon,  7 Aug 2023 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1691447976;
        bh=T9A13VAnIBvuZiTpCZBIRjWpy7cFOtX4dsxcBbLQk2Q=;
        h=Date:From:To:Cc:Subject:From;
        b=hjLLUFkEWdEqID3wI5WTa8+TWLI4h17Fnqxi/1+6sYgnkkEUGOlF8cettCPnVMzR/
         cHMu8HM8A39eiErMR6HUUOICPYqHjKeWBX3+L8ci1AgNXEcH0YTs3GH6bG25ZA4uIi
         AhZlMnNbBOR6/lhiqztluGvknK2lmXimy56E9kYWQlCvW7bbp6tVcNVm2RBRX8qy1+
         U5GqWCOnQrMMHNMqnF3U8uB9c0OqFAslMqnviYrR+CyuEYteUtwiSLysJAtxeLM90r
         mv01cOa2pi9BttSMNpxG4Jzl8mdSH5aMEjbyG41ruz7AV3HyuKrVKDYauwjuvqW/tT
         C3cQ7kxwceJtw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4RKWTh4T47z4wy7;
        Tue,  8 Aug 2023 08:39:36 +1000 (AEST)
Date:   Tue, 8 Aug 2023 08:39:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the iio tree
Message-ID: <20230808083925.7109a675@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v._YOKsXmN=fOooPJxjDlzh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v._YOKsXmN=fOooPJxjDlzh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  a00cf70f16c9 ("iio: light: bd27008: Support BD27010 RGB")
  16a9947646f7 ("iio: light: bu27008: add chip info")
  ae8c47c51e5c ("dt-bindings: iio: ROHM BU27010 RGBC + flickering sensor")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/v._YOKsXmN=fOooPJxjDlzh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTRcp0ACgkQAVBC80lX
0GyZdgf+Kt0tar2RPiVLAUQfvj71bCSbd4uKmZjwkqJWj12ly3TIZ/BeVuBS1WlC
FfIntbUDGXfJDMAVsDesdDFf30mQ+6FmfQaB6uCSoKUFOsg1ZuRdsFMa20ORDR60
PXjVgrcQWFG98IgFMcFsF1fSXj7Q73i/YC45HlxY2i6KxJyGYukzLqSpiyZ4V0IG
JZFoEnwDjHrsKLIL1XlKWO/jr0M3sASr10zMk4wA6DF5hTI3yt7lL420bFK3rweY
RJj96pjiSbYgIf6AzfzX1WZyDkaO30rNM+N7l97h8pXGTvBpchID7nBKQMD+Z4f9
p3V1kvQbUD/L7Kq/e2mSvsPYuLAcLw==
=gfOX
-----END PGP SIGNATURE-----

--Sig_/v._YOKsXmN=fOooPJxjDlzh--
