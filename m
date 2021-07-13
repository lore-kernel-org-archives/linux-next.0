Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A85C07E9A
	for <linux-next@archiver.kernel.org>; Tue, 13 Jul 2021 01:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E414F611CB
	for <linux-next@archiver.kernel.org>; Tue, 13 Jul 2021 01:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhGMBN0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 12 Jul 2021 21:13:26 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:33693 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbhGMBN0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2021 21:13:26 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4GP2cl2z4BzyRF;
        Tue, 13 Jul 2021 11:10:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1626138631;
        bh=LHMisR7RVz51Iood+rRmE89Y26yZ62ED2cinvMbX/u0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f04Fgw2oLPIYYV/hjJwbB9Tq10C54zNxrqKDfgw2CFdpPbnnmo0yPajXNbkb+0oaY
         JheL1hmYHjynIuIEEgDmAz3fewuJlORs5EAusnM7ov1H3G2dDsU7adX0vYKhVplVfP
         8AtGOWmn8hwVg9qbVyrdjkoKoAJECtjeNX9X+L6WUFV8+kqwsaNa0RpwSXYjpKcLzl
         rEqT6Z3rMCmEdkPaRHHcFfzp0O3+A6EZzdFbSPPaSRJQrP2cNX6YJ8GdBgMM1neo8z
         HNowa8hqi1N7keK2NakDxE8U/AWeBCIlaklBovPMZXcCMYEPtodiW4BKDBmF7aOvy2
         MXSW8TtyAobYg==
Date:   Tue, 13 Jul 2021 11:10:29 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
Message-ID: <20210713111029.77bfb9bb@elm.ozlabs.ibm.com>
In-Reply-To: <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
References: <20210712120828.5c480cdc@canb.auug.org.au>
        <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9B4ncCiGtZc/xGh.EnnXylZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9B4ncCiGtZc/xGh.EnnXylZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, 12 Jul 2021 08:24:16 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> I am getting no builds completing. I see this:
>=20
> Error: No compiler specified.
> Usage:
> 	../scripts/rust-version.sh <rust-command>
> init/Kconfig:71: syntax error
> init/Kconfig:70: invalid statement
>=20
> and then 'bc' running continuously until I kill it.

OK, this is weird.  init/Kconfig has not changed from Friday and I
don't see these errors at all in my builds.  I also have no rust
compiler installed.  And the kernel ci bot seems happy (well nothing
like this anyway).

--=20
Cheers,
Stephen Rothwell

--Sig_/9B4ncCiGtZc/xGh.EnnXylZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDs6AUACgkQAVBC80lX
0GwjMQf+MQjSt2SvWr2Ev2nDpjeY14tUPle8a43TBL1TaXKgV7Pxfan+Fzq7MEqa
iOcvNRZzpoV7g4VI9ThHqbDNzRst1aVBnUSZoCOqGZKAaKFwzGl8muBIzxxTq6LR
BK7DG1kUD0EaUtexIAagxfCVYGIVGVUL9FRNr8c/T9FeaNRcoGpr6UElg4Vr+HK7
0WOB3sivlQFHpe8rpHQfcEbxjPXUiYMQnJhc1RSS2L0UwJTpdICetUgrhQXTa39x
s8hURgnw6GMLAAxH022bYr2VOcNu/Z+Sg/Ir4tNaOaWTMNz0ZBYtpL2z199rfjRK
pk7UEOwjBty3F5JOjiyX+UihcS0wBg==
=AYfi
-----END PGP SIGNATURE-----

--Sig_/9B4ncCiGtZc/xGh.EnnXylZ--
