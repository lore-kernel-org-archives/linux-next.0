Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD1BC4338F
	for <linux-next@archiver.kernel.org>; Wed, 18 Aug 2021 06:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5548B60FDA
	for <linux-next@archiver.kernel.org>; Wed, 18 Aug 2021 06:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238168AbhHRGal (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 18 Aug 2021 02:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237998AbhHRGak (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Aug 2021 02:30:40 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B86C061764;
        Tue, 17 Aug 2021 23:30:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GqJ0q2f9Cz9sX2;
        Wed, 18 Aug 2021 16:30:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629268203;
        bh=E/jTZzjWgD0faaRPfnasUBsSLIBu+9Q5ZaEPXZl5aHI=;
        h=Date:From:To:Cc:Subject:From;
        b=CdAebvgxMiLGKcOaPjscTYvoPja/K9zYJKVHYiJVMslEwPUPk6Q0OEn3mR0MaGgYd
         BEEsENBDHnC2C4tjIqkH4wv1G5H24HPoYYOvUWrYYSOInwRilO2n383Ar+i7FAMY1v
         SExxJaOQFowgGiyTEeYfjJ7JnV1R0n0P18jJ+L17q/SvIXnOHFCoEDTQLtu7xeHU1C
         8ENpT8V95M9w5Xe0y1C06XQrFLY/5Op53djUzkky/mX7j1yurfyj328d78Jk5svEbd
         d+4zsGYYy4lhJJPdrKKwPXQskTFau6UPFP/94K2DMMRK2BbaNR3AWceyXuLjItXpeQ
         mWfLs3CrScCUA==
Date:   Wed, 18 Aug 2021 16:29:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Conghui Chen <conghui.chen@intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the i2c tree
Message-ID: <20210818162959.4dfe60a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EQiQ_NjtruOvdg/Auv7rga1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EQiQ_NjtruOvdg/Auv7rga1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

drivers/i2c/busses/i2c-virtio.c: In function 'virtio_i2c_probe':
drivers/i2c/busses/i2c-virtio.c:208:17: warning: unused variable 'pdev' [-W=
unused-variable]
  208 |  struct device *pdev =3D vdev->dev.parent;
      |                 ^~~~

Introduced by commit

  8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/EQiQ_NjtruOvdg/Auv7rga1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEcqOcACgkQAVBC80lX
0GzMMwf7BdNzUEIMONIZ2rynAEeHOSu557jXhfy20ztBFG/+BbPSnnpxwFmlH3wu
n1HQ1wcTlyrDTqu0v4gqcCxC9LH/g13GlaubEFhUrlj2yBlG+CKrS2RqvT+T4W0H
J7tXSqxprUBdwA04KtpRKXkh/V9Zco1Lg0DLH9khfCNrRLCS+Fmn7/yqlXvgctCH
Qj7T7C1ioQlnIEh4LtRathMRw6cZ3YH0LNsUWqnNp86gOSEhq5kmrtMjm4TONed1
xH6VHLdEzK/i98rSsC9igR7EPVM+8G9rUOdjRYdnFpyVYQuPUrM23oBj62K5oH9v
Hp79YfWxotzZANOjuk9cQBDXIAMEDg==
=Iv6s
-----END PGP SIGNATURE-----

--Sig_/EQiQ_NjtruOvdg/Auv7rga1--
