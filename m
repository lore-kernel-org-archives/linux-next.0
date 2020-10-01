Return-Path: <SRS0=GrK0=DI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821DBC4727E
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 22:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 655F120739
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 22:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mXLdlicl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgJAWcF (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Oct 2020 18:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgJAWcE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 18:32:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68232C0613D0;
        Thu,  1 Oct 2020 15:32:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2SXx0cT4z9sPB;
        Fri,  2 Oct 2020 08:32:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601591521;
        bh=fUY8+FnzG5Q2bV0WByp0ECn/teOoW1FrlqCSKsTxGEQ=;
        h=Date:From:To:Cc:Subject:From;
        b=mXLdliclLjqScHhS0gYBIlLqMgf3nC8UeEnIfrZo7l09gltSETVnHWA3PNQ4a3Hot
         V/5ZwmEs9Z34DvzWHJHMIoSp4DrkpcuAlXhxXAsmksUduoSTBqPUWd67H5Wj7VNFVy
         fUxuxmRwEdjAlc41OLKyhbgR/MvknV2CyCfMBfxMILUEWU9t46whxsJrOAESDdg/OV
         85GiuXPTgX1Iu0Tb3O7Ocs+GNeoL+MzeTCjSLJxEbEewq91iEmuXPWr5hZSQRekQfv
         DdK8lxeCvdjKUGtd5tfJ/57SwYHxlVve3IP03aJ724TUkCgzwXGF72TXNb2UIC7Rag
         X+Ay82CTyQueQ==
Date:   Fri, 2 Oct 2020 08:32:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Si-Wei Liu <si-wei.liu@oracle.com>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20201002083200.685639e9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dOyryZZtE/hUhAiRtgy=LTM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dOyryZZtE/hUhAiRtgy=LTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c9795f8fbb41 ("vhost-vdpa: fix page pinning leakage in error path")

Fixes tag

  Fixes: 20453a45fb06 ("vhost: introduce vDPA-based backend")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 4c8cf31885f6 ("vhost: introduce vDPA-based backend")

--=20
Cheers,
Stephen Rothwell

--Sig_/dOyryZZtE/hUhAiRtgy=LTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl92WOAACgkQAVBC80lX
0GyaZAf/Y5fX2v/DrBcNgRdYakP6nIRQJ5QmrZpFxwQ55pDeAQqXkazzG0pOmEhn
QBVtiy0DU0p0hfenIfDco4fwi+uD1lip+m3rtsHhVO09LqESXH/L2veovm92fv5n
SvCqE2zn7aMibYef6IFSylXXaFmwgeMW4WEY1gMT0bKT8v0YbT3dHzCiblbtMh6R
ITFybYh3awtHJUH6mz3VaGepT6t2DaBA0e4qhwGKEt1jf9AAG1/mgr3YmDixJFn/
TC5LPvyFisVe7xUYtaLEpxaeUU+bZZYPivtR/FG5L39hkLc4A57mttpDfFj/uWDW
8URPwnDaVqgo4AKgfaTWEoPszkmnKA==
=4v+2
-----END PGP SIGNATURE-----

--Sig_/dOyryZZtE/hUhAiRtgy=LTM--
