Return-Path: <SRS0=7pCn=WU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E5EC3A59E
	for <linux-next@archiver.kernel.org>; Sat, 24 Aug 2019 06:54:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3587E2146E
	for <linux-next@archiver.kernel.org>; Sat, 24 Aug 2019 06:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N49sduS9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfHXGyp (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 24 Aug 2019 02:54:45 -0400
Received: from ozlabs.org ([203.11.71.1]:58169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfHXGyp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Aug 2019 02:54:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Fpsr5DDwz9sBF;
        Sat, 24 Aug 2019 16:54:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566629682;
        bh=B0nkR7jt73tiwBbqhrmmJgZaJn/+3zHEzu7uMFO+fpI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N49sduS9tEsLXd9FX5mQlI092fd9kl/XTv0gFxzylyDZV+kFaoBW/4bIzp06/sIib
         OuHKB9jU1PIkEIZIwaGQeI7k6PDYmAbc3ogTImsmMFGwQGL0yb24C5fkUV1EBLXovg
         B2WjFoOWmGkNj18LFUzO22KEPIyl/rweEeZrlNEk/S2AeGjK/hqg5m6RgMF60e7vNf
         4LGYbRckTD5oEerhc5At37Q90Cv5RV5x4sCq4ukwP25avxAOYM72rCM3AboCw84ZpP
         ZF4cUq9EcfForVAuGx4XGFQDVFWM9VramPShUG2sSqqgEVl3so7lv/KaLbm0wGakIo
         TFLIxNyA0FUEA==
Date:   Sat, 24 Aug 2019 16:54:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@gmail.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Dave Airlie <airlied@linux.ie>,
        linux-next <linux-next@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: next/master build: 218 builds: 4 failed, 214 passed, 10 errors,
 786 warnings (next-20190823)
Message-ID: <20190824165436.554381be@canb.auug.org.au>
In-Reply-To: <CAPM=9tzQ=3BNveNZ_misvZXAUZo+b6uxrQUbHePuaeYnizhHcw@mail.gmail.com>
References: <5d607e27.1c69fb81.eb9af.1e5c@mx.google.com>
        <20190824135300.23a5fcb4@canb.auug.org.au>
        <CAPM=9tzQ=3BNveNZ_misvZXAUZo+b6uxrQUbHePuaeYnizhHcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zr=8s6spYG95L+dKakOX=sL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zr=8s6spYG95L+dKakOX=sL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sat, 24 Aug 2019 15:06:07 +1000 Dave Airlie <airlied@gmail.com> wrote:
>
> I'll add the include anyways and send to Linus,

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/zr=8s6spYG95L+dKakOX=sL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1g3ywACgkQAVBC80lX
0GzzzQf9HKU8hqwhQiI78sSXtrotBHrLx+ltFLoCQ064IZ1mNdA9dvzm631A9Xsu
JpKoIGnYzkKCbmpGT3R3K2FOZ0zkTtaZQ5St/GPjwJzJ0MUP9RNWIY3odFxZhD2G
96/BI2tY5CqX9vL35bi8pm/a8aF/1VRGYj3Yu6c5SCqCIOq6+HsqxlG4z9S1sBmE
66qz+Cstfk9uzuLqjoXosJsp+cO3Bwxt4hoKgPWggxX4vsFsy+viNvfQeNDMZhrT
LplyeZ4rJHAvEc3OvEELpMDJEHXNcI9+pcGlP6qe7eauyaqKtrMMOqhOD6EN6mFR
gjKZhDtSKmtzAdc1Xk+ttXy6C6gO2g==
=yJEH
-----END PGP SIGNATURE-----

--Sig_/zr=8s6spYG95L+dKakOX=sL--
