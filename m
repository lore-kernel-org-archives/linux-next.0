Return-Path: <SRS0=MvKh=DQ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B0BC433E7
	for <linux-next@archiver.kernel.org>; Fri,  9 Oct 2020 06:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13A2122254
	for <linux-next@archiver.kernel.org>; Fri,  9 Oct 2020 06:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CG4zuaD0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgJIGlm (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 9 Oct 2020 02:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgJIGlm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 02:41:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE06C0613D2;
        Thu,  8 Oct 2020 23:41:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6z4f4PDLz9sTR;
        Fri,  9 Oct 2020 17:41:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602225699;
        bh=GmQDRiHmBtfH2obHhXVXOT2vsRv0TTOLM7Z8MTkQsb8=;
        h=Date:From:To:Cc:Subject:From;
        b=CG4zuaD0tZqktiTieKP9EVTZsvFzYnyK7XixuUSrnlEKsoMEYhzkaHt9NDhSh746t
         jZoiEG/CNDTPkneOVjoKGRiaFHddUKUrC0g9onPJMNsD4wjvpvdxIQvRw/6/kiFxJY
         SmFcWDPXJ6AhEqm7+xvJXFVnEPlyCgbb+LTUy6UWfaanEXnFDe26OxOpu0idGr/N1F
         Km7kCh4fh5zKr3doivslEQh7lJWaWqxKi5ztbIfjc7/4uc2DThYyIeS+GPEzXz/btF
         Pmd0pg16BUsE9dArXoFdTsPcLvuBuDU7Sdzn4dW8bjY0Vs7fkCSOVVyWFcKV78/dvS
         onXv9hMXhGYhA==
Date:   Fri, 9 Oct 2020 17:41:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thibaut Sautereau <thibaut.sautereau@ssi.gouv.fr>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Message-ID: <20201009174136.5ef09d00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M_/iWu9=PdF/t9xMgh7oEy5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M_/iWu9=PdF/t9xMgh7oEy5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  lib/random32.c

between commit:

  09a6b0bc3be7 ("random32: Restore __latent_entropy attribute on net_rand_s=
tate")

from Linus' tree and commit:

  2ce6b0d4293b ("random32: Restore __latent_entropy attribute on net_rand_s=
tate")

from the kspp tree.

I fixed it up (I used Linus' version - just a white space difference)
and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/M_/iWu9=PdF/t9xMgh7oEy5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+ABiAACgkQAVBC80lX
0GzrBQf+J4LGzIV2Z1dNyPLeTfTqCMhtrA9BsJi+RbQEa/wihRE8Hwic7Pqre9bX
wmzkoifK38+Ke6BJzC8yoUsSRLHC4OtYGLBsnuWSsCXVZVGeIAedkzl429iSpcBM
QcWlYNr8FdDIx4SIh1XdKsBTyMhQDNfNkDrMpDiep48py3KOOeijY7K+E3pJkcPV
npQEosOpiqHEyMZ/PH1MB9E4+qVWey3fbY/OPD0Q6tIwM3bhyHa38RL1KDaEkhoE
e6RPJaujCVtD1BlRhhywSPS0gHwIMI6cfr3eT3tjvxURkatsZ+srd62sa2IP/G0H
Ty/g2AhY8y+PqsBwaFU7cFU2OEboEA==
=CkEs
-----END PGP SIGNATURE-----

--Sig_/M_/iWu9=PdF/t9xMgh7oEy5--
