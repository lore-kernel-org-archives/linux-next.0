Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA307C4332F
	for <linux-next@archiver.kernel.org>; Sun, 16 Oct 2022 03:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiJPDol (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 15 Oct 2022 23:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJPDok (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 15 Oct 2022 23:44:40 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293EE11C06;
        Sat, 15 Oct 2022 20:44:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MqmG81mwDz4xGR;
        Sun, 16 Oct 2022 14:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1665891872;
        bh=bkjWqWNFsA74y3sOlaBOdyLnpCwLW4r8301jsIia+HI=;
        h=Date:From:To:Cc:Subject:From;
        b=DyqCJR+Am5sr4YmxykERDi/NHTNL/pASIr95v5/Ikj3oscxUDFMB++x7uBuMYx2jr
         QR5wdWFTV8Mf5K9CoCJyBjvA/vtMXPfxSs9a0727VuO/dxy0TZYeuBHwTyigGU7Hn6
         FfQF74EezYgqdF3gJnB+OQXRkPuLOFIDk1c9SRCC/m6Dlo3tedDBaVU+MvfWiC0kcx
         YzJHEqZKZGqhc56HYm4LRp4x3YOE08qIHSbhl495xo1aKsJiiLbgkdYcg3aHShUrTn
         J67DN4TKQIBqE2iB7qAcQUagjMVPAHA6F6HLdNvKQirczhMZVdJ/lBt7k2iEndvAVv
         dQpfUKQQcIXPw==
Date:   Sun, 16 Oct 2022 14:44:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20221016144423.3560fed7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M0bMqL2sht2kSa2FbDlVkW0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M0bMqL2sht2kSa2FbDlVkW0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bfcdf58380b1 ("ACPI: resource: do IRQ override on LENOVO IdeaPad")

Fixes tag

  Fixes: 37c81d9f1d1b (ACPI: resource: skip IRQ override on AMD Zen platfor=
ms)

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 9946e39fe8d0 ("ACPI: resource: skip IRQ override on AMD Zen platform=
s")

--=20
Cheers,
Stephen Rothwell

--Sig_/M0bMqL2sht2kSa2FbDlVkW0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNLfhcACgkQAVBC80lX
0Gwfogf/d/CoLVn8CGcHGgq3EEZEpT9ffuLYwr3Gn6ynt3serEkqZFXG4j26FwUB
kj+SA3ceKr5teU85xDjgAZSK3JxVPQU2uXlg3C+NCiwCLgSg048a+2ypv/Yu2rDo
2OY956zaly1esLkUM4n+MOR1sFCLSAFindqDh/8fppPv/rAGaAhNBkQKRm+vXrFY
R7vqYsI2dz6jhHOJKtNpfMobP2epajDAQ+orK/65J/roDFbnvHDgMiqUZG3N/Ef9
VTCKxlHM+dAx0UNfk/5MeNSas0KvCLJVqRDdnHyNUWw7OqKaOvv9IjiwFxdHMBKw
JcYCiHZVpBe6NL90MVFgV7+2wyOPKg==
=ooPh
-----END PGP SIGNATURE-----

--Sig_/M0bMqL2sht2kSa2FbDlVkW0--
