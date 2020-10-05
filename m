Return-Path: <SRS0=fge+=DM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BF6C4363A
	for <linux-next@archiver.kernel.org>; Mon,  5 Oct 2020 12:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 548AF20848
	for <linux-next@archiver.kernel.org>; Mon,  5 Oct 2020 12:02:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WKp/QtVF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgJEMB7 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Oct 2020 08:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgJEMB7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 08:01:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BBDC0613CE;
        Mon,  5 Oct 2020 05:01:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4fMz4Grdz9sTR;
        Mon,  5 Oct 2020 23:01:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601899316;
        bh=0/QqfW/I5HwC8d2l8QEaUmn3isJntKVaSYVlMFnppfY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WKp/QtVFCsNhxsS6rY1YCsrnKZgHc/c6vrp7M7Vzsjv7XTqe7x6W02IpBOH7I2jVX
         fzeqQLdhrdgYT2IRYZVZqX6/U3cd4qrCGbgQNYLpHtz9Cl1YXg2whl8/FGKcjEmt2F
         dFB+ZmF/KgUoukP7iYCvHFn5SOj2PH6qZUIMwHh5b4lGcKSCowVWi5eLShkUyTjWDq
         cE2LtGaah6KTtoqoqJpjOCfApube2ieDuMJGjjEnSAa95CFYZlTGvkUT2qr9Hsz7mP
         F7uzfLCOB5RwPqWpS+fecYN7TdwOTCrZeb2mjy0IrBuca0D1oZOZfVKke0JCgzN9dl
         jtpax30L0p22A==
Date:   Mon, 5 Oct 2020 23:01:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>,
        Dave Airlie <airlied@linux.ie>, od@zcrc.me,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM
 buffers   cached"
Message-ID: <20201005230150.5637fa42@canb.auug.org.au>
In-Reply-To: <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
References: <20200930165212.GA8833@lst.de>
        <20201004141758.1013317-1-paul@crapouillou.net>
        <20201004195921.GA556605@ravnborg.org>
        <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c5crkA+N8hdQw9yru=.DOR2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/c5crkA+N8hdQw9yru=.DOR2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil <paul@crapouillou.net> wro=
te:
>
> Pushed to drm-misc-next with the changelog fix, thanks.
>=20
> Stephen:
> Now it should build fine again. Could you remove the BROKEN flag?

Thanks for letting me know, but the fix has not appeared in any drm
tree included in linux-next yet ...

If it doesn't show up by the time I will merge the drm tree tomorrow, I
will apply this revert patch myself (instead of the patch marking the
driver BROKEN).
--=20
Cheers,
Stephen Rothwell

--Sig_/c5crkA+N8hdQw9yru=.DOR2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97Cy4ACgkQAVBC80lX
0GybcQgAgDBfOlAi4H0LQgp43UG2Jbdt9jpEvffFQlYlJ9MsH+uBFHvo3aQk6X0V
UuhH5HXZaEyeLkkqTBvKbG7malvbM7qXtrgTnHMe5dSbnYDMOn7E9rp3Oq16CspJ
JWI11dxkem9tBxdcXnR+/1r3sR0W0JBgArF2N5ccHRtHCFBs41WbnTgFqGFloi1I
F0ARK/4w8tzk3KCE9tkh7pX1qN8m8OHsFT00VL+CEkW+r3zH7QhxVJ9wcllFGzbG
OKfQKNh+3Oue/ECfKcYYkIafz10T5XZU7zzRplAhun9urihwV7jKf7GW4FRgbCsr
jlfHoHzyXPv164D13Wir3EhLeXQ4Pw==
=Xi7i
-----END PGP SIGNATURE-----

--Sig_/c5crkA+N8hdQw9yru=.DOR2--
