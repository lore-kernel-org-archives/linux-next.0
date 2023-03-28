Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B15C76195
	for <linux-next@archiver.kernel.org>; Tue, 28 Mar 2023 02:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjC1CLQ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 27 Mar 2023 22:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjC1CLP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Mar 2023 22:11:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45F71716;
        Mon, 27 Mar 2023 19:11:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PltTC3zZkz4x7x;
        Tue, 28 Mar 2023 13:11:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1679969471;
        bh=mA6YMnpAHiOabx7cMXzV7Nlhe3CuEhB4KIDoabP6erQ=;
        h=Date:From:To:Cc:Subject:From;
        b=YDR9D76tXue4dovsIGuP3h280iBHPM7yy0SSmiCJ83a3OMmTozOxtstYsOrOEWUZS
         sMPPGcRJVroNBOrfJcHQBFf9TJoVy1gBbr22sqSMc7RRz5Qe92RaZl4yH63P5RdiJM
         qGUlItl5yp/Bb9FX5wI/DJkq4gk5mcxfwflBNv38xn+xJiYxZkhZaFxiNASkR2gn6U
         S5ok4/6dozQQ7Y3G7UyfAue+GgZtPD0L/vk7sYQY6z9TJ5I4fy3t3Nwi/BEzjPQ3PS
         Vaj24p5ZxT7Ara3nKeFy9yVYJ/ucfLzUuSVSVWAqGbmXvK3aAjbJp+/JNPVXljfgph
         JiX2Qnb2J6A8Q==
Date:   Tue, 28 Mar 2023 13:11:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peng Fan <peng.fan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the usb tree
Message-ID: <20230328131110.6049c4ce@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wo3CcDG4nCBx8OCOYpBinlR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wo3CcDG4nCBx8OCOYpBinlR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the imx-mxs tree as a different commit
(but the same patch):

  fcd3f50845be ("arm64: dts: imx8mq: drop usb3-resume-missing-cas from usb")

This is commit

  989e2ee399cd ("arm64: dts: imx8mq: drop usb3-resume-missing-cas from usb")

in the imx-mxs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/wo3CcDG4nCBx8OCOYpBinlR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQiTL4ACgkQAVBC80lX
0GxBKQf8CLjo/feFsAzB8FqattjQgiLyL1K8yN0wJjC4pEmxisKrmW0566SlTXeF
Whu5uxjfkGD0paKDMaIltEg86kvO7JjzQ24nAaGCgucdwU0GZ74a3ij6y8etqXEm
8R18OCU39579yE1DczQ8qlKy6zhBfJMyiFNwsGcO85mNUHhkUE9JsDjGR+IqQ1cr
6LkWB2HjUeidnW7DS2jexC2I4pskAL+MVJvlaWZ+TmmsuhY6YvR0H2WTLiwJwirS
/vsgzZ20guuprOLDvVyQ8BrKaBL7RxQxTyM69/25oJ+tsrDNhy6q/OiAn0QXppjE
fgdvN6Wqx3dsYuN1UCgt44djEA4INg==
=bl+c
-----END PGP SIGNATURE-----

--Sig_/wo3CcDG4nCBx8OCOYpBinlR--
