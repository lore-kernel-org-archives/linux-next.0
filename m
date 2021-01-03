Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F4FC433DB
	for <linux-next@archiver.kernel.org>; Sun,  3 Jan 2021 22:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6179A207D1
	for <linux-next@archiver.kernel.org>; Sun,  3 Jan 2021 22:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbhACWHs (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 3 Jan 2021 17:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbhACWHs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2021 17:07:48 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17088C061573;
        Sun,  3 Jan 2021 14:07:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8CXn60Svz9sVr;
        Mon,  4 Jan 2021 09:07:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609711626;
        bh=8XWTuTPPy/pY+/KbO9pp3kdEaIP3ZBqqAIW0O/fjsEE=;
        h=Date:From:To:Cc:Subject:From;
        b=IkNEuxx1acpMx6Q4gbPWw8XCj8QRKfnpbdSQYPAqzqzED1/BM3+AwrQveY4uNzpTv
         H75L5KD71Ic03NBhuiql+ON3kxXzDsDNtl4RT3dv8cjGheVfVjYvNDqipJYmilgNIn
         P275q+bGgDJuglPiCXXLSC527spV7VVJjiCSw6cZw3kuH0G/kOmynAzo2VyWflF+sY
         PCQN9RsoYlp+Ki5H5N6kLrOPKO9/PCpkhRlDS9X+7getRnWb5Cy++z7MkI9WcUed5D
         d2uFRz9Iy/C9ETKzrXChnngW7U0OZildKbzQX4g9yKRu3vtR7CI1z3Q7uD/SKmJ9Xb
         8rttXqBHfEX5w==
Date:   Mon, 4 Jan 2021 09:07:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20210104090704.3601e1ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nFrKHp_yQHVWovhAa5DMG.x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nFrKHp_yQHVWovhAa5DMG.x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

While building Linus' tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/pinctrl/nomadik/pinctrl-nomadik.c: In function 'nmk_gpio_dbg_show_o=
ne':
drivers/pinctrl/nomadik/pinctrl-nomadik.c:952:8: warning: unused variable '=
wake' [-Wunused-variable]
  952 |   bool wake;
      |        ^~~~

Introduced by commit

  f3925032d7fd ("pinctrl: nomadik: Use irq_has_action()")

--=20
Cheers,
Stephen Rothwell

--Sig_/nFrKHp_yQHVWovhAa5DMG.x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/yQAgACgkQAVBC80lX
0Gwy4Af+LdA7Enl+BpS4EOiSHQBwbgCactbeYoEejrcjKe5QKSnqIaZeQL2ZFMky
lNXClBO9+h+ocxOKEoxqMUle2DWIxLwsmZqfz4U03+N5o/3EBfZjiVRhNdwhelq5
XJnBfH6pcLhAc/+c3G2uZlQOaOFsYQ89holsRZc4rCP5N0VxL8NKY9ggPkSwbmtU
QKX8Vswzur/sEQS2qE8TWDUdsyKSNu51N+Bb4ZK5w8lmNmDefwsRJGzBG5NpO2un
TT/lbW7VLE/nYtsKFfN/Fib0J2+BFnaBIlQPsqxELUksKARyHQMRe3Fm8GYd5hb5
OEWxAt6nPgNlrhuCXSutSe5kk9vacg==
=GDjp
-----END PGP SIGNATURE-----

--Sig_/nFrKHp_yQHVWovhAa5DMG.x--
