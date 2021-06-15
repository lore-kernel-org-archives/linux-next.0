Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B38EC48BE5
	for <linux-next@archiver.kernel.org>; Tue, 15 Jun 2021 11:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7683261420
	for <linux-next@archiver.kernel.org>; Tue, 15 Jun 2021 11:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhFOLOh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 15 Jun 2021 07:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhFOLOg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 07:14:36 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6579CC061574;
        Tue, 15 Jun 2021 04:12:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G45JF0vBQz9sRK;
        Tue, 15 Jun 2021 21:12:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623755549;
        bh=YFJ3U4Cngjq499MyEt86iJ9OObreMpZMft2dQ2wS75E=;
        h=Date:From:To:Cc:Subject:From;
        b=rBPK4kv+lyprU2Or5W3g2hzVA5TggSJ2760v2dwAZjxqNXpa8XBKr86xcxTRIyGxn
         /cdGgfnj9iROEYELPr5lk90Gd61LOi6BtaCA5Ts/k0kLswdkaUCb0rzGf7DbX53sQm
         KNGgYuVmyA31YTJIw4qHyH+ZnYn0/o15eJjxdac1V/wzHjF9A0wefqxWltD6AruOZh
         wA1cEcSD5KQXXvGxNnJoq2gLCJUt4LxjSkHXUh9YJnqw7TvEnB7bgLc0U8J39qcB6j
         U/GqXGFLzd6UyF8V+DiArVIcp1fp13sCaQNaPIjMnvwhrYCpauWgxBhqmPWGXcSY5R
         2voFv5FcY5Gkw==
Date:   Tue, 15 Jun 2021 21:12:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Calvin Johnson <calvin.johnson@oss.nxp.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the net-next tree
Message-ID: <20210615211227.4c2ef3e3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OMoN/uDR87LL4dZBNP30X8s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OMoN/uDR87LL4dZBNP30X8s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/firmware-guide/acpi/dsd/phy.rst:33: WARNING: Unexpected inden=
tation.
Documentation/firmware-guide/acpi/dsd/phy.rst:35: WARNING: Definition list =
ends without a blank line; unexpected unindent.
Documentation/firmware-guide/acpi/dsd/phy.rst:39: WARNING: Definition list =
ends without a blank line; unexpected unindent.
Documentation/firmware-guide/acpi/dsd/phy.rst:40: WARNING: Block quote ends=
 without a blank line; unexpected unindent.
Documentation/firmware-guide/acpi/dsd/phy.rst:64: WARNING: Unexpected inden=
tation.
Documentation/firmware-guide/acpi/dsd/phy.rst:84: WARNING: Unexpected inden=
tation.
Documentation/firmware-guide/acpi/dsd/phy.rst:102: WARNING: Unexpected inde=
ntation.
Documentation/firmware-guide/acpi/dsd/phy.rst: WARNING: document isn't incl=
uded in any toctree

Introduced by commit

  e71305acd81c ("Documentation: ACPI: DSD: Document MDIO PHY")

--=20
Cheers,
Stephen Rothwell

--Sig_/OMoN/uDR87LL4dZBNP30X8s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIixsACgkQAVBC80lX
0GzGgQf/SfzKqZP5EcCNVK2dmoJYGQWbTGwgdDebydhapE7Qg32vQ1VuAw6vkbsP
N1WF8/MPuMKESbw0y8bRop19IRPypDPzyWUzcQvM3tzIUVqq8p0UXMTrGWgldmOJ
fcLVh3CNz43G2srCOtHJCo17hdDZ61sX04TfT/NLlMwFvRXSsPX75pkvD+7el4HF
CTlkH5BFJ+K/5d/NwWiWPGEzQw7OffrxTT8jdUrC9sXFXGUFlZp4VnKaSFGct3Eg
2MDTRZOql1rZeuuwqjRkrL8mCaCspT/BuO7ETV1GWo0GpJwwpJ4M+gsfrV/xt2lB
HNdnNPX3+Ep0lSTsXUnpCiD/wg6mig==
=S65Z
-----END PGP SIGNATURE-----

--Sig_/OMoN/uDR87LL4dZBNP30X8s--
