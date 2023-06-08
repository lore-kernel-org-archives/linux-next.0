Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48533C7EE25
	for <linux-next@archiver.kernel.org>; Thu,  8 Jun 2023 22:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbjFHW1e (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 8 Jun 2023 18:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjFHW1d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jun 2023 18:27:33 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A7E2707;
        Thu,  8 Jun 2023 15:27:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qcf3H5cBfz4x42;
        Fri,  9 Jun 2023 08:27:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1686263245;
        bh=JA/VbvKUd3atLRxzK63ZIaKoRnH+iRPOpxUIr70tQeY=;
        h=Date:From:To:Cc:Subject:From;
        b=hNNtpJHRprTSU6MbhSJLrSkXV/sYEuzURap4x1dB0a83dSO+cnSv4AMffxa/LZIvU
         28uYGetUsvELXd620qRs5Eebq6J/1GdVnxamHUVXjAh+k+pcugXcKBEHhml8G/zgVK
         u6nWNAnvgiV5hZX5H8VYyCpem6zOiRXHuIaxFcVwaX0XDdu/kfAjCQ+kPwZJ0kTg6C
         9QvU1C2suYUIFUGWMrqcb+LDqZ0yDhnVjpDpwnyPapQdnhOqt7INL/4Msd4DqQ9eeI
         niCQaaqSD6vUplHkgYNV0wTeHety/c7R5IiBNCadtrEu6LYLyiOWwPToDZAIsIaUsb
         0NYFk0agbDoyg==
Date:   Fri, 9 Jun 2023 08:27:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Zhangjin Wu <falcon@tinylab.org>, Willy Tarreau <w@1wt.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20230609082722.1a7a4d12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Iw/z+cAaLTj+S2RkeTMyXvb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Iw/z+cAaLTj+S2RkeTMyXvb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  df772c12508a ("selftests/nolibc: syscall_args: use generic __NR_statx")

Fixes tag

  Fixes: 8e3ab529bef9 ("tools/nolibc/unistd: add syscall()")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 6bff2a1e97e3 ("tools/nolibc/unistd: add syscall()")

--=20
Cheers,
Stephen Rothwell

--Sig_/Iw/z+cAaLTj+S2RkeTMyXvb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSCVcoACgkQAVBC80lX
0GxKhgf/dx8vD7DtirXKXqdtiV86HMiIxvoktfg8bzR1E7FnpCH+GC73ddTtIeeC
2gr+kAVFEymdmkbJmhXp+MFscRSSFbcH4icdI+tVAmqgArfScN22XDsGq7VnFX2c
oxSNheKc0+ecovG8wqDtpgjxs1uY+G2BsPyEPGn7wgTBVnjsz02Vn2Z5Jd5o2mJC
bIA6MaE+sKsrOUs56aV++hHIRp2xG0WSBb8ThVMlWm74LPJN6r7lBqrlcNei/SBq
qc1+MsGLwfkwlNpsOtZv5M4ip7XeiPFme8gLaSJ5S+JWjNJ0pFtupE65Lui8Z43Z
MAK18C1O5nnewIPSJJW5dF657VGRJQ==
=MJgM
-----END PGP SIGNATURE-----

--Sig_/Iw/z+cAaLTj+S2RkeTMyXvb--
