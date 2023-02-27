Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E21FC64ED6
	for <linux-next@archiver.kernel.org>; Mon, 27 Feb 2023 01:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjB0B2k (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 26 Feb 2023 20:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjB0B2j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Feb 2023 20:28:39 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C053BB8D;
        Sun, 26 Feb 2023 17:28:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PQ2vN2KqNz4x8w;
        Mon, 27 Feb 2023 12:28:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1677461312;
        bh=aKBE3v8DdM/b2hR438y9Y9iwFTGP3tfU36lUzejHafs=;
        h=Date:From:To:Cc:Subject:From;
        b=ikT7JGI/7HsVkM4rQPciBSAW/EOwCZ61P7rTnuOvr3Q2EV7MOOPwO2Qikh0CMttXF
         OMb91ZdMHJhW6FikSp1hxOlhqhjHIawgwDkzlwGfx2Q86UXu1xnRrNEgr0WSZ43YwP
         LnSx/+Vvv/BtYI27Epp+t+GgyI+J50ug5QkyU2bh7wGruaIC6i/LLXEGnr0zTRnCBu
         FBFLZp8s3YWj1qfp0DSmfLC0+erivmhWHuLAPtAA6c/JTUbvKBL3Ix79fCxwNtwNTv
         Y/Dii0VlNXlzJ4qkqi8ByZqiZvFJczptIZ7jKGILf8DPSSBcpX9/raVY7T6nWB8Slh
         65bza67bUxYsQ==
Date:   Mon, 27 Feb 2023 12:28:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20230227122831.7f4157f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AHBs55H/KT998gYzIQ=w4yp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AHBs55H/KT998gYzIQ=w4yp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  df533767b904 ("mm/mprotect: Fix successful vma_merge() of next in do_mpro=
tect_pkey()")

this is commit

  2fcd07b7ccd5 ("mm/mprotect: Fix successful vma_merge() of next in do_mpro=
tect_pkey()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AHBs55H/KT998gYzIQ=w4yp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmP8Bz8ACgkQAVBC80lX
0GypLwgAkszgZX7YIWjzsLFOhS8SulWJc++ATGpFw2jF3jxoUOs03CgZ9usYOgaI
+pALX+qWOo5kyMj+SJd0Lf8bNkkduqe0rE0EZ3OcBApU7EhKyA2oHZD33zCidcY4
4qkERLIxZsD3Vg+rR5tHD3J9pQ52nPZAfhJu8IbwQMOm7rRs4fzbWICqGk2oVNG+
C4GlhqqJ5YIJzq2jAw9XxZSOSunNminaKBWDqPyoZOuA/d+ZFQnNGm8jEKfNE+hY
7qyiL8eKdVwUku6zVEUp0GFFXFvgUEktY0F18WGiWM9phueeUgLBkYSgT/mgTAVg
0VYOi+uHuOH6juN71A1udZ7G0bfg2w==
=q0Oz
-----END PGP SIGNATURE-----

--Sig_/AHBs55H/KT998gYzIQ=w4yp--
