Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4A6C6FD1F
	for <linux-next@archiver.kernel.org>; Sat, 11 Mar 2023 23:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjCKXve (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 11 Mar 2023 18:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjCKXvd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 11 Mar 2023 18:51:33 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E636E6A2D1;
        Sat, 11 Mar 2023 15:51:32 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PZ07Q3LVDz4x1R;
        Sun, 12 Mar 2023 10:51:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1678578690;
        bh=7e66qwPdKy4giTl7AYrBQKeWPO+uFModfiP+nT9Iwtw=;
        h=Date:From:To:Cc:Subject:From;
        b=o1w/8FORQcb6bfF5xDDj9ZIOXtfMiFQFQSSqy4kGzFimgZoymiA5JVQljTz1x7Xqz
         3wJrdIZlW1sDAjeOF76m2+U4CNiC6ZuwI0HIcBbscyE/XVyZIpljdGm4h2xMSQ7yfQ
         CJxzSuWwov7+ylSCiBBGdypSJGe7/QD/9gv3RSol/vc/K2TQqqIUm27qBUHyJFTL/P
         /G8PxzOlvfTlNeM+PMHNqj+R+Tu2IPSU0FZmSM9OYMvMVLgOR6bSApKJIF2S1WuOh1
         PLkNG6fjL2hanI2m9s16mkLtJd7bLLPtq9DNnTacBHVfEHIQ8L6/KdXBye7JdcpSKG
         /jwtEn3Agvzlw==
Date:   Sun, 12 Mar 2023 10:51:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release tomorrow
Message-ID: <20230312105129.015207bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jgSVScL/gvnL5JkN.vgr+yG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jgSVScL/gvnL5JkN.vgr+yG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release tomorrow (Monday).

--=20
Cheers,
Stephen Rothwell

--Sig_/jgSVScL/gvnL5JkN.vgr+yG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQNFAEACgkQAVBC80lX
0GxINAf/WlpTnrGHlWBbOfY8JSTtSFkxkgF4Qwr4l5usrBtFoWwHYzk+N/wuUsHZ
/LGqDquTd6wKN917uEaujctHWoYtDaR2Zt23S+yAc8xYrOvlNhEHM4ySsquMvNOF
/nsQcVpYdWpSb1IX6ML2maiOsnS/PMs0ceaa8S92qM8MORsoUWle08MPwO7PvBb3
lIq61Cq2LYeM/u8MkqSPWlhypbl9gXLbIFOxkUj2ZHRBwF1x49lthcvgnkaVbFwV
9W3+PEOaUCIdefzSN+WlyLK/6jmgSIS01O/nilXE8gynerueox3spJT2ZFpgaF4t
2jsrBU5jnMRfJ2fSYQ09lLREKivjOw==
=6gUs
-----END PGP SIGNATURE-----

--Sig_/jgSVScL/gvnL5JkN.vgr+yG--
