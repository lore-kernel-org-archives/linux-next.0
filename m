Return-Path: <SRS0=aXXK=DF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82417C4741F
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 02:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ED7F22207
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 02:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qyXWuHTH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1CqS (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 27 Sep 2020 22:46:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgI1CqR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Sep 2020 22:46:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C06N32nlwz9sSJ;
        Mon, 28 Sep 2020 12:46:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601261175;
        bh=c9z++Ebel8LrCHVKYjdGXubnlUqxLIqDpCtFsmMcirs=;
        h=Date:From:To:Cc:Subject:From;
        b=qyXWuHTHpcbdkw+NhrZIPyOsEk4rpE8vFPkMgunPzmj+KAPKmVUr1ERrUauY/booL
         S1RXTFaKguGRFCU9F4qGmndXU/jKgyPw9hR79p9W6xPQ+FM+lGhwwaAJmktYeVJd8X
         yu/S/+SjBeDG7I9Airkrf7m5W1VGeR8Tf8/TVlzXwZA3RETLv9/WSqLLJRBxyK6oPh
         czuizWZGhnJmIKXUsEEwano+hgbydYdEKlCggir9XNRiSjPweNzsA0aREYFcv9uX8Z
         zMSiYbNAikEEBz+y7Wu3fS+lksFtxrzRSA9HQ18eJZBAcdfwp0wGN5GgpLpYKXhdhq
         cUyY1lpEiK7aA==
Date:   Mon, 28 Sep 2020 12:46:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>, Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20200928124608.2f527504@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BwJo7GLaY/HnDA72V8UM65R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BwJo7GLaY/HnDA72V8UM65R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/phy/Kconfig

between commit:

  7dbbcf496f2a ("mdio: fix mdio-thunder.c dependency & build error")

from the net tree and commit:

  a9770eac511a ("net: mdio: Move MDIO drivers into a new subdirectory")

from the net-next tree.

I fixed it up (I used the latter and applied the following patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Sep 2020 12:42:10 +1000
Subject: [PATCH] merge fix for "mdio: fix mdio-thunder.c dependency & build=
 error"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/mdio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 840727cc9499..27a2a4a3d943 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -164,6 +164,7 @@ config MDIO_THUNDER
 	depends on 64BIT
 	depends on PCI
 	select MDIO_CAVIUM
+	select MDIO_DEVRES
 	help
 	  This driver supports the MDIO interfaces found on Cavium
 	  ThunderX SoCs when the MDIO bus device appears as a PCI
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/BwJo7GLaY/HnDA72V8UM65R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9xTnEACgkQAVBC80lX
0GzDKAf/TJWVMZ/tnaorjelOXkQydruUiZ2aNS102GlbsnZCXfSOmJqxb7Zcy/MM
zJdgOMGuunu7eRT1AaM5da0eV7Q3KX4K2wDNdZP/rHnomYHjvtQotBnBwPynGZUd
abIggJkH7z2p2ypFWTo7X8wELxuWY6iy5NbabaJxcwdV/pIoUHQJmpa9nxCX3Wtp
j41YQtfBQ4852bCiyM7+jSSO9PJlH0ZCeWKaO2ZX4gmHDtbzaRFEh+0E1EFeGSKQ
vuxAup2M9/63pmjtQIYrvtekSZqy5CrAlaEsW4nWtsoL143sh3dXDs9zJ5KtVRJP
FuQ32OKo9NHVqPMKVmfDMp4yAeDx/w==
=hQM/
-----END PGP SIGNATURE-----

--Sig_/BwJo7GLaY/HnDA72V8UM65R--
