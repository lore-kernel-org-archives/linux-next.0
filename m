Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3885AC4361B
	for <linux-next@archiver.kernel.org>; Sun, 20 Dec 2020 22:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01A6422D50
	for <linux-next@archiver.kernel.org>; Sun, 20 Dec 2020 22:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgLTWLA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 20 Dec 2020 17:11:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgLTWK7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 17:10:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CzcGs6V7yz9sVm;
        Mon, 21 Dec 2020 09:10:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608502214;
        bh=2k5vfmdFAKjKBf6mx3OzTwu3YohWl2zu5fwtrUiQb50=;
        h=Date:From:To:Cc:Subject:From;
        b=hZeszk5LZ+xXBP2lWhuVfm9Z4deNaanwc2X8oblxuiu4yXR7MOJT5350rCK9W9svm
         avADfY9vobOxQQkf+XqWgxJB0QgvjiSTR2hJV1j+5aW5P/T1kTh4J15/f8RCPQwrB+
         aC63nlJbCBdujo3mWlCp9otVnIbyC16r4DsJ42DpGLsExS0ofpEJi90ZyPAv2xf3Ou
         j4fEe6DrMyaHUBbzad5f10qEzcMc2g4peOEktM/xH9vx6M1j8dK6bZhLMz88BHCKzD
         vnvC9drDGcn/ZGaKmk+4tqBD55gIni7U403ZCpuzI+4KflETPJK9QJj8J+AoKS0Eg6
         Q/iHvoSaPxcRw==
Date:   Mon, 21 Dec 2020 09:10:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kbuild tree
Message-ID: <20201221091013.526f538f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H_Q0i5T4uTXLi5iYBTvktjX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H_Q0i5T4uTXLi5iYBTvktjX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/kbuild/makefiles.rst:1617: WARNING: Inline emphasis start-str=
ing without end-string.

Maybe introduced by commit

  663e29430e12 ("kbuild: doc: replace arch/$(ARCH)/ with arch/$(SRCARCH)/")

But am not sure about this.

--=20
Cheers,
Stephen Rothwell

--Sig_/H_Q0i5T4uTXLi5iYBTvktjX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/fy8UACgkQAVBC80lX
0GwrqAf+KCZ72cpNDpeyLqnO7FX64+LwiiI7OiBvZaGk9E8BDF6Kn/+ZZ+WUcSad
oDpIiV6U6BeuPvAlevkJl1cCaw+9uz8IWDIHDTEfX/EHrxBpRxqVBtiMcmy4JUsv
fN7Fl07X+E3CuaG8LrxisF3Dwv3UA9Pt/YUdGcaBBgUowUK4Apds//L+362pXpXV
tv8tE/fsmJvQfUs/cHmzhb9X1cw+8Ei1HLHV4LG/6rv1HT+ITNfoss8Z8RCwC+0q
VqQyIGVVBHEM3JgsIfp/eOEp99SMf7j6wX7woe0EK+3d2qMxkxUmLf5+l+68nVdS
znnjkzrJIgHvuWXJrfSoodqk8SAsrQ==
=zt6z
-----END PGP SIGNATURE-----

--Sig_/H_Q0i5T4uTXLi5iYBTvktjX--
