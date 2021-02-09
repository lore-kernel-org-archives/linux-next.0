Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C0AC433DB
	for <linux-next@archiver.kernel.org>; Tue,  9 Feb 2021 12:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5089864E70
	for <linux-next@archiver.kernel.org>; Tue,  9 Feb 2021 12:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhBIMH2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 9 Feb 2021 07:07:28 -0500
Received: from ozlabs.org ([203.11.71.1]:52375 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230047AbhBIMGC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 07:06:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZhRM2yKhz9sVw;
        Tue,  9 Feb 2021 23:05:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612872319;
        bh=7Dm65XLDTc0HjMEgLtgdWqz4Zap69IwRvoyHjrsvPT4=;
        h=Date:From:To:Cc:Subject:From;
        b=MvGdKrazJZt4pMy2hHkMrefg+jC8lcDWeFZ1TE9aD9FE/Rm9uXDZoiG4BAcdvYKog
         jvDS/OqJ10wVZanmHbZy+nxi65cP3ONOatx0YnOz7yDgHmFTX5+73WOQYX2F8awnMV
         9tcMOwNLUtjIAs0wdXhaCdhFpzonu/au/UAoGHCb0I/ZFjDvubCmqOWaqKsAHKzLB6
         SIwub5+2BtusVmIDo/LRhlS8d6+GJ72by80/A1fk8EptRG8x0oJAbZM3ozy+BT0vh+
         fxALRPnLQz25jaFwH41ssjTbnk+nnPIPHlALj5Dc2HnuW6PNYbuNQUJO0r+X/Tbxw/
         wzkF5OTxALPMA==
Date:   Tue, 9 Feb 2021 23:05:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the extcon tree
Message-ID: <20210209230517.7d698e81@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dYQ491Hw0/pdPLn=Ll7Fgr/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dYQ491Hw0/pdPLn=Ll7Fgr/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d8cc19be483a ("extcon: sm5502: Detect OTG when USB_ID is connected to gro=
und")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/dYQ491Hw0/pdPLn=Ll7Fgr/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAien0ACgkQAVBC80lX
0Gzaywf+IEvgBh6JKrQ0rvvk76qOy8Y5eJO1WoW2mD0h4LwGX4nr0Ufo9HUr4WOu
usVScr3ee+sABgwHUewdAbWgzcGA6C/D89PMtBX4uCdaWgYoLw1TPsJOp5iWZ34y
CNu2hNx+PSbMaupWRJDhvNdMggH2sk/3d423/gE20JaiJ/WALWL1ak3rHi+70zfS
DN4jW/RKW7bg7DUuIskUkuaqz7fKL8PFNqQGko0b9hXe2D7bzGBH2G7KAIwxkVME
OWw4kfqH1P1yg2nc5DZV0D+nj7xCEkVlDeQaRjWVsMG9RcphrkjrQX6zgXGbu8+Y
uTBq8wInhj5KgS8mVhIQsJilqF/jog==
=d3My
-----END PGP SIGNATURE-----

--Sig_/dYQ491Hw0/pdPLn=Ll7Fgr/--
