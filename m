Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494A2C388F9
	for <linux-next@archiver.kernel.org>; Fri, 13 Nov 2020 05:36:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4172D2137B
	for <linux-next@archiver.kernel.org>; Fri, 13 Nov 2020 05:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qVhE5hgV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgKMFgm (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 13 Nov 2020 00:36:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35343 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726071AbgKMFgm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Nov 2020 00:36:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXRzX0Wtsz9sSn;
        Fri, 13 Nov 2020 16:36:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605245800;
        bh=ZJp0mepSksJonAHJKOYv8IGUdVHhRsv55hfbHUdaL7c=;
        h=Date:From:To:Cc:Subject:From;
        b=qVhE5hgVxE/VAwcabBXFi7Aa2oCo/PIQqMUWvKGveXMmC5ZvahdOZkqewOK11tlkM
         UlPcI/hkKo3SOhW3nELaUKiHQC+dNLrzQkOXfYwKvZ1Rqfk8ebzMH0gaxdtoBLMbiF
         lNElmV8oO6TFpLkSIJVLD4R/TW6F6S3ZZ3JoOc3LG5CniyVTuAQYHYiuAX0emrf/hz
         JPj/2A4ioi8JAQfvDpgBFlAzMUciNFQsgIgisxEAhYttqslnmSY3pXZdGyEtewyrUo
         jWENDmQi7WMiuowZfXZlztyR/gvhwdJr2/OdN69MdgLV/N3XC+jME5kzwKqsBt/hYG
         tZVsIUoH8J6sg==
Date:   Fri, 13 Nov 2020 16:36:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the usb-chipidea-next tree
Message-ID: <20201113163636.6a034653@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kjdskz153+qvLos_aIPJXcr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kjdskz153+qvLos_aIPJXcr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb-chipidea-next tree, today's linux-next build
(powerpc allyesconfig) failed like this:

In file included from drivers/usb/chipidea/trace.h:18,
                 from drivers/usb/chipidea/trace.c:11:
drivers/usb/chipidea/ci.h: In function 'ci_otg_is_fsm_mode':
drivers/usb/chipidea/ci.h:440:47: error: invalid use of undefined type 'str=
uct ci_hdrc_platform_data'
  440 |  struct usb_otg_caps *otg_caps =3D &ci->platdata->ci_otg_caps;
      |                                               ^~

Caused by commit

  87a6b8617a72 ("usb: chipidea: add tracepoint support for udc")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kjdskz153+qvLos_aIPJXcr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+uG2QACgkQAVBC80lX
0GwqhQf/Vw4zygGPqxVNJbX4LCY5kOqlHnE0qdJUVc3BVlSUMGHn92YGPxg0z8QX
uJ5VxPVdemfC5uebJil8ROpZSe3LbycrmKDYYZhABNu4hHg6IyvPcY8uzTRkAO/E
EFbI9i9wVKesk4cIrSXaQQWzUJ1U6cBgRvPJlv2BaqOcCreCt9+HcyrULkgTkKr2
QaREmp9tVExodeYJl+FyTBPQopbaIVFkst/0tZiIE+/hVxHNcqEe/qwQb1tImEPP
qwk/ot+pXyB4p4du/+9dt3FXG4H7Usut5S8rwXGBAhFMI0IFsDAUGvzN0oVJ2YRM
j9vPzL75rz5WJBSbJw8v7Dppz1j+/w==
=uDTc
-----END PGP SIGNATURE-----

--Sig_/Kjdskz153+qvLos_aIPJXcr--
