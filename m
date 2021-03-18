Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D5BC433DB
	for <linux-next@archiver.kernel.org>; Thu, 18 Mar 2021 05:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B188764EFC
	for <linux-next@archiver.kernel.org>; Thu, 18 Mar 2021 05:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhCRFr2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 18 Mar 2021 01:47:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45755 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhCRFrP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Mar 2021 01:47:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1GHw6f43z9sW1;
        Thu, 18 Mar 2021 16:47:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616046429;
        bh=xlbNdL0HbrRfBNPFSa5WM2Mtx4BbA6zDwK+xFIOc7to=;
        h=Date:From:To:Cc:Subject:From;
        b=jzH7eOoqD0WbTrC0nWzrSqyPhgMLcQKbP5XgGxRkLevPvj/PzuTy7JnygAlk2Ijf/
         olPaLAIrQSAvKPq2xdG0mTTLbkTTHhw4qXH3iFy9vLVMwJdHCv4DgMYqkRPv/ig7Ix
         IPK75sLvvxdA/U27JT+I6YUPtbfiAESDQ75VxAEkBM29Gi5w3KMPgC934WGE8UYM2e
         UzR7e8xhyjOGgsuZTjAk2Ei04zesyNkHRVRKuJx6mKvgj8yaVSC7+oZFGsGbhzIc4a
         22Upft1KUDNIXwIN4nr6NV1NCCPy5HbP39lh7Godgo9WVYXP4/l5Bgl8ShKye+xTrU
         IisinqpQsmWyw==
Date:   Thu, 18 Mar 2021 16:47:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Jon Maloy <jmaloy@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the net-next tree
Message-ID: <20210318164707.6e510068@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7_lpUPvimgrlo3Z=CFHzr6l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7_lpUPvimgrlo3Z=CFHzr6l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced this warning:

net/tipc/subscr.h:73: warning: Function parameter or member 's' not describ=
ed in 'tipc_subscription'

Introduced by commit

  429189acac53 ("tipc: add host-endian copy of user subscription to struct =
tipc_subscription")

--=20
Cheers,
Stephen Rothwell

--Sig_/7_lpUPvimgrlo3Z=CFHzr6l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBS6VsACgkQAVBC80lX
0Gxe0wf/cRKYjoYGiMoGifZpFGZmziVFZsge8fM15wVQTNWKiftSvUivqEI3qXWM
730Zfo7qldKRXz0POtn1JlaSZJy511ELbEoRR4lswKUuTZm7fL7oBk8UXm1NfGd3
foEpbsHAZxGjoFyTTgGl8E4fiAmJk1EG06mxqHS/oNJtbZOsDs6SVKKJWdxnkPCU
/8vlNbo5woUBp7t+CYmmHGXyM3wvcjhv7Vj1TFLqD2JppwKSJJ4V38lhV8vXJdZv
F+r+DYBNecBf3KR2sefWXdGZkcgeVcU3lx/565JE+++Dxr4eqSOO73qH8tTnQXGW
qJTK7/KQK6cIGfKCbWAVy4YzPz1I1w==
=3RCt
-----END PGP SIGNATURE-----

--Sig_/7_lpUPvimgrlo3Z=CFHzr6l--
