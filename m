Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F752C001B0
	for <linux-next@archiver.kernel.org>; Sun, 23 Jul 2023 22:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjGWWeO (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 23 Jul 2023 18:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGWWeO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Jul 2023 18:34:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3923A1B0;
        Sun, 23 Jul 2023 15:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1690151645;
        bh=VFvo5PT9FN5rjjsh104hZ6JzOXCBljYqTp187X1XsyA=;
        h=Date:From:To:Cc:Subject:From;
        b=M7ghb+OhbOrncTeoUmOa4AM4hKJpErhRk3IcLki3cJHTTUgSYm4F4dpyAqhu80TLl
         Fx9W0NCkihQABamt4dRhti4bjgBnq1FlJcFbk1eojKMl1fWLSQci22CxuCaW9+QD9H
         D4fMR/vdj4djX+EmVoSYoKfGALS1V4wux1uBTr6HHtrwNLVaKAYGDaeMZVokw+vZXG
         OLE/4aWpnYviTL8bsxImWnZzFwuitYlwMoY+xJuG4lI+Yt/LiZHyuHSnZxGxx5gzOG
         e85OyvbfTw/9vR4C7qyMNfyus3IUDSs7IxypcnBwP54FDcPMEIs4Vkm75BsVK+RRRW
         xxVmansUZW2sQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4R8J4F34ZZz4wyC;
        Mon, 24 Jul 2023 08:34:05 +1000 (AEST)
Date:   Mon, 24 Jul 2023 08:33:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the modules tree
Message-ID: <20230724083348.5f7cd58a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vCia32kZV2NF+x2BZYefv01";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vCia32kZV2NF+x2BZYefv01
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3d917b5d3ba5 ("modpost, kallsyms: Treat add '$'-prefixed symbols as mappi=
ng symbols")

Fixes tag

  Fixes: c05780ef3c1 ("module: Ignore RISC-V mapping symbols too")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/vCia32kZV2NF+x2BZYefv01
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmS9qswACgkQAVBC80lX
0Gx6FAf+PMrd+1iok8H3Pn3SBcXYW7rIYS/3EqQjUnMNnP9fqHiL0gNFgofrpDb+
4OKFWWkoKNDAGB07tpKDCU3s/8vx5ExM+wlxPIuEL49mbNskOvz17OPqegnaW91k
f8O8g/3d4FsExcgVbL3biSdjpJU3s7VZlGqHpzib/0kXdTMZFUn1vvNzblZUXI1d
BN4iZGxMiFqW4ebXgatOuLFqhC3ACeZ8efHJzBMonO+7d/5oOBAXe2I1gw/c/Ndy
w2G7GiOzBMSCfXEsKhF8Zl22NtBPHPQFSzq9jGq/SezOB2RR6OjK5UyeQBrsVwwG
pjl5e78qtRnTI41m5nB9+6nGU4um/g==
=/hEg
-----END PGP SIGNATURE-----

--Sig_/vCia32kZV2NF+x2BZYefv01--
