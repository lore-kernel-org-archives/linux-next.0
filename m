Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15C6EB64D7
	for <linux-next@archiver.kernel.org>; Fri, 30 Jun 2023 12:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjF3MgK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 30 Jun 2023 08:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjF3MgJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Jun 2023 08:36:09 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D547EED;
        Fri, 30 Jun 2023 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1688128563;
        bh=AZ/jjViC49L0mrVD3YdVVLGXg2/upzJ4x1HTgi26lE4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tw+Fm+l+UOAkVMXVnfX8edZpCCrflFqJ1tBaIwsmbkNrnabSYBA7PQ/C32idEKLNn
         YXkVUo79LUdZAC8WWWf5r8tdcQDgqC2qGXQokJnZG2YFKJ7e4mAlt4ABaLsmil8wDx
         1c27oxQY02rGf3vD9onqYu/BWuoWutK/GUBv7CCEwXCGnN1JYxowdBxiqNevD7K6sy
         udTOsIDnM2a9qm4d5XJ631uY0prGZsg+0RfnntfhRIIJrSVyUx15RPKJGHSZ7bLmlC
         MuXSw+URY1YsTcyn+Omt0pxZSvoReMkfqKR+OqLpv/pPb2R1SHfy619+/3ki7EGCAQ
         ufHF0Ke6fr8KA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qsvtq0WYyz4wZp;
        Fri, 30 Jun 2023 22:36:03 +1000 (AEST)
Date:   Fri, 30 Jun 2023 22:36:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <treding@nvidia.com>
Cc:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tegra tree
Message-ID: <20230630223601.370a228d@canb.auug.org.au>
In-Reply-To: <ZJ65XCYh3cr2OMLM@orome>
References: <20230630084726.3d3e47a4@canb.auug.org.au>
        <ZJ65XCYh3cr2OMLM@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BelwfNv7u8pLvQQZ4ZBz2XF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BelwfNv7u8pLvQQZ4ZBz2XF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Fri, 30 Jun 2023 13:15:40 +0200 Thierry Reding <treding@nvidia.com> wrot=
e:
> Stephen, do you want me to force-push an old version of the dt-bindings
> stuff to my for-next branch, or is it okay if I just push out an update
> after v6.5-rc1?

Up to you, I just send these in case you accidentally rebased after
having your branch merged by your upstream.

--=20
Cheers,
Stephen Rothwell

--Sig_/BelwfNv7u8pLvQQZ4ZBz2XF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSezDEACgkQAVBC80lX
0GxsgQgAkJtI88CZBsWVy86nlHT6tMwz0HMOCiBytKDVBI0jEPmRGp3uNrFZKU5V
dCofMUnlCrCq8UdECewX5zaQjem83WJ+CexZKLAPSPZ0q09piZgyX1Iviixhn7C4
YApCAASB90KT/dDzSwF3fSxhVk5hVwJd6KLKF/mafzR0BUcRkYiEF2SJ7tUih2o3
Q+rj4ui7CGpU75NYzn5aHj7UzUsf8yTjPpPsSuX8yPFft71GTt3mNpORFuLrPkHL
MDW32vWd4P6CVrnppXq2TgfFEnbQmLo1wY11yVY9bUR0USin2RDU0mcyGg77Jt2Z
iJETjdvcxRwsfYo+7SSccER5d2UTHA==
=6VV+
-----END PGP SIGNATURE-----

--Sig_/BelwfNv7u8pLvQQZ4ZBz2XF--
