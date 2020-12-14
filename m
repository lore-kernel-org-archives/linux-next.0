Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1667C4361B
	for <linux-next@archiver.kernel.org>; Mon, 14 Dec 2020 19:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B57E22396F
	for <linux-next@archiver.kernel.org>; Mon, 14 Dec 2020 19:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502763AbgLNTwa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 14 Dec 2020 14:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502806AbgLNTw1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 14:52:27 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F52C0613D6;
        Mon, 14 Dec 2020 11:51:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvsTr4bdQz9sTL;
        Tue, 15 Dec 2020 06:51:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607975505;
        bh=beRE6ua3GvI4AGH2tufwVFJZPuSOwi1NEYpeRSPXGtA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hQkeHgePTWrfYSdqDV9sMTL1MiLDgUqn9abO4Bc+akwwZ1bP4l8Vjr6I7KmVkOH1G
         1XyAFkjeOgOCRAfy7iwHrbgzwpcP0ynmo7ALOP99caLTQhisT8xnNt/snNK7mbMfVq
         MZtjcov8fCgOGn9bzR/t9w6VD7xWfJIK3AWAnPfjHTBfQMijkMJ8Mi2sOwQdc4YHAv
         CnvaPShwb0WX/WMmMtLe9q7NEN1yvHj0tSHWuqEHOrhwOTPTzqXrvpaxvc6d1yXI/q
         7cvlqOL1SGfsE9gzV3MkKhoHwznTU1x12PJDOXyEJU+r0xSV6Kn+Q75C7QpkAoW8nT
         Pew94QJH4ur3Q==
Date:   Tue, 15 Dec 2020 06:51:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wang Qing <wangqing@vivo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20201215065143.65ccf365@canb.auug.org.au>
In-Reply-To: <20201116170303.0d457d04@canb.auug.org.au>
References: <20201116170303.0d457d04@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FgMgHYKs5rmdHFkB9OzfEu6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FgMgHYKs5rmdHFkB9OzfEu6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Nov 2020 17:03:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/translations/zh_CN/filesystems/tmpfs.rst:5: WARNING: undefi=
ned label: tmpfs_index (if the link has no caption the label must precede a=
 section header)
>=20
> Introduced by commit
>=20
>   09028e60fcea ("doc: zh_CN: add translatation for tmpfs")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/FgMgHYKs5rmdHFkB9OzfEu6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Xwk8ACgkQAVBC80lX
0Gy9IggAitZw/Hm4GmysC0UPJRJHnARN4RYMxhZjp/3NVDjcOnnd/fdWoXT5wB81
or1b/ZoNJfL8kGXuYOCwZb4Ul/O6tSOhsfAX+80y6btUVu7e2MOTR+3f8tfwZhU0
CU+mMPse8AbazOXQnNDYlO/5vvH5WGH3XvhCXWQ/tKNO2N7YCORt2fb/8KvFT9pK
cwsQWqCIXI/Fk1VYxq8FBlK+1IRK5TUjE3cNYPBvY8rqWCgcFjWFoja74PuPF18V
QoLqLRkpiIc0jkmtTx2siIEWswgW+SxirkI7e4gmM22ftU2xytiAFb7N+cwQC2Wh
FO5mODOMiNQyj6L23zgeYGDn3V+TDQ==
=CYxD
-----END PGP SIGNATURE-----

--Sig_/FgMgHYKs5rmdHFkB9OzfEu6--
