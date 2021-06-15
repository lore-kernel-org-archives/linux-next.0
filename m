Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516E8C48BE5
	for <linux-next@archiver.kernel.org>; Tue, 15 Jun 2021 11:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3213461455
	for <linux-next@archiver.kernel.org>; Tue, 15 Jun 2021 11:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhFOL0I (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 15 Jun 2021 07:26:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42969 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229689AbhFOL0H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 07:26:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G45YY5vFSz9sSn;
        Tue, 15 Jun 2021 21:24:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623756242;
        bh=1+9cA8R9uIOwUv3pbbF+xQE5AFU1V8U2So9SbYncYMQ=;
        h=Date:From:To:Cc:Subject:From;
        b=K5IP0+DBQhGS56TLLZGRtD6pvpGEkkOWFGNnXjuuzQfkDAepWeNSv9VUP+TFmT65z
         vengwEr9PcgYHTuLP8zUTTcQlRITYFd3wEVgo8hZQ3XIqf89Pj6GwHkRaWtuRZ7SuK
         B4CPp8Ncj6rbZX0bYWVm0Xso++lrounerL0952pMqm3l7+EffzaU7njwzXB8uazaO8
         eKvXvaS4UE6uf1U6s02x09fn6NvSKBsV+BRP2HIlwN5iVqI1h5sLOEo7QXF0YCqJ2v
         YzwHqCvElQd1usqv8tywcmGDLIpCZE2fIX3S84PEdzU/8L2mKxSkhmq1SH65G+kMXy
         TSihlK4RpzSlw==
Date:   Tue, 15 Jun 2021 21:23:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     M Chetan Kumar <m.chetan.kumar@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the net-next tree
Message-ID: <20210615212359.727e0fbb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l2TAUQjyyfVcx.B1xOZBbyF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l2TAUQjyyfVcx.B1xOZBbyF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/networking/device_drivers/wwan/iosm.rst:43: WARNING: Title un=
derline too short.

/dev/wwan0mbim0 character device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Documentation/networking/device_drivers/wwan/iosm.rst:55: WARNING: Title un=
derline too short.

/dev/wwan0mbim0 write()
~~~~~~~~~~~~~~~~~~~~~
Documentation/networking/device_drivers/wwan/iosm.rst:55: WARNING: Title un=
derline too short.

/dev/wwan0mbim0 write()
~~~~~~~~~~~~~~~~~~~~~
Documentation/networking/device_drivers/wwan/iosm.rst:60: WARNING: Title un=
derline too short.

/dev/wwan0mbim0 read()
~~~~~~~~~~~~~~~~~~~~
Documentation/networking/device_drivers/wwan/iosm.rst:60: WARNING: Title un=
derline too short.

/dev/wwan0mbim0 read()
~~~~~~~~~~~~~~~~~~~~
Documentation/networking/device_drivers/wwan/iosm.rst:68: WARNING: Title un=
derline too short.

wwan0-X network device
~~~~~~~~~~~~~~~~~~~~

Caused by commit

  f7af616c632e ("net: iosm: infrastructure")

--=20
Cheers,
Stephen Rothwell

--Sig_/l2TAUQjyyfVcx.B1xOZBbyF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIjc8ACgkQAVBC80lX
0GzXRggAnb0q+Ir1r5U7KxNnm05DbQVlf9G34WCRAy5bpjT8AtJ2H2XhLfasu2Q/
4Xl4AmVMtjGof0z32uNPZk/eoulo+Ue5cp4JLlRFJQP22o/zqxx9KDaJVbmkKcT4
yMhLoDxIkUfOXXFPFhL70cwg2+AVVMyHqxOi3SLk8Poc9xnf09OT0oNd7oMgil3A
ZGGdaxwkzXlWTjuaegKj85Oa2SUr11A5JEfZZfP0xOTkos/LhiZuJTapTEA8p1fN
biFp5n1Ym0BMlmnpD13g9zCg7eGV1CyUf30ciW4M9SRAXfKz5gWFwjsuk6l6Cn0r
9O1UhJdrUxHQLMd8L3LMl9coVqT4Ug==
=8Asp
-----END PGP SIGNATURE-----

--Sig_/l2TAUQjyyfVcx.B1xOZBbyF--
