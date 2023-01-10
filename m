Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B14C46467
	for <linux-next@archiver.kernel.org>; Tue, 10 Jan 2023 09:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbjAJJWu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 10 Jan 2023 04:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbjAJJWj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Jan 2023 04:22:39 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C23FBC9C;
        Tue, 10 Jan 2023 01:22:37 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NrlhW0Cv5z4wgq;
        Tue, 10 Jan 2023 20:22:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1673342555;
        bh=ByGC44wNDbW0FrMo+duR9QqQcEiEUoyTOPedXRiY9j0=;
        h=Date:From:To:Cc:Subject:From;
        b=BM+xZKbFwQ2lPdBHce8cBywY3QBrYTt+DF7p1IhurINgqkWyuADxg+pFZrAcycPSA
         qL9mb00giKVLNVPDOZMFIeQaZqdNdH9X4KxHI6FmLTKv6MMUn1zOdHh/cIthuXAYGR
         vUOfYOsBol/IhxWBt25dfJ5UPlHYgJFuU5USH5ySrLIj4DUTKVaxlbZyDTAtoKRAnB
         3YafvtmvVhIqLsGNekI4k63B2Su2yCjulK4tSYwywe6+2uBbudiyhSSA4fQLaR0gIn
         LwOgAzFM1oWPoGEC67lNU90arve4aMU4kmnAXvsfaFDYYN+tSnMmd0P9nsEHxp+3iN
         zpp3Qao3yGQsQ==
Date:   Tue, 10 Jan 2023 20:22:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Sven Schnelle <svens@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the s390 tree
Message-ID: <20230110202221.2e284ba0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GZanbzii4BKgH=VZYp53UCd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GZanbzii4BKgH=VZYp53UCd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the s390 tree, today's linux-next build (s390 allmodconfig)
failed like this:

drivers/s390/char/con3270.c:43:24: error: 'condev' defined but not used [-W=
error=3Dunused-variable]
 static struct tty3270 *condev;
                        ^~~~~~

Caused by commit

  c17fe081ac1f ("s390/3270: unify con3270 + tty3270")

--=20
Cheers,
Stephen Rothwell

--Sig_/GZanbzii4BKgH=VZYp53UCd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO9Lk0ACgkQAVBC80lX
0GwK5wf+IOJg4KzJqJRk07P/Pv/MRkeWDvDl115V+HgPIN6jy1jZoyeFQmWxakQV
sDXmAEYLM5/o4RS+epoRCbLdF4OL6IF6dKOqYrJXP3J6tlK6b1pUUQKNx0TtWbtu
xXM16seeBRR+NmaMIylkpkbY+S4DynsI/F5w5sXEYxzdOpRQx1WunYlRndr5lj8O
NeCLvp1rqT5qYFxGC1GSIxRp1OvfCKjrt/ctMiiPoma9lU0I+vCwXQ3huYOFpz19
0wWW0yxn15Eib8YANp15UqqxTPfcgXZuoISBLwBoKzwx9ikeRQgUoJ6mqLvX3Myo
TgSwQWHPltYWhZ0xZ+QJU9m7yB7t8Q==
=+2ig
-----END PGP SIGNATURE-----

--Sig_/GZanbzii4BKgH=VZYp53UCd--
