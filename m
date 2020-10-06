Return-Path: <SRS0=PxEu=DN=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A58C41604
	for <linux-next@archiver.kernel.org>; Tue,  6 Oct 2020 04:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAF5020757
	for <linux-next@archiver.kernel.org>; Tue,  6 Oct 2020 04:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eTJXuTfV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgJFEbE (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Oct 2020 00:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgJFEbE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 00:31:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC690C0613A7;
        Mon,  5 Oct 2020 21:31:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C54KH0vNDz9sS8;
        Tue,  6 Oct 2020 15:30:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601958661;
        bh=n5g/8VmjM6MX7tsHQua98aEInXP4LOcxwGMFE4CgV6c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eTJXuTfVcg6haKx7VjmfiW0OlAB5OlXPvB6lmst090D8iGoV+2TUCntxMVW7Rb2Kz
         s4NsQHQwHbYO0K7cs0YNk5A27WoZa7BKKzq42FX93XtgW7crDLe8JbptXv+mV83kvr
         uiwpZbvqDFxOfPPWEgletecAj8jIanhPVYbQQXBtiCGTJ3wci1hXm8YnPn2kz7lr3Q
         526nzB4/NnecA7IFu7SHKK/b0DFdFMFohI7aAr8F/ip52sp5IiG1vJS0E0XJQGxufL
         3ajD58RlkWlv5AaDDugh1lal47YFGfUGRlz96OjOR/yr716j1/c9LLcFsAEViiIMP+
         o7z2bvx+AuBLw==
Date:   Tue, 6 Oct 2020 15:30:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>,
        Dave Airlie <airlied@linux.ie>, od@zcrc.me,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM
 buffers   cached"
Message-ID: <20201006153057.39baeedb@canb.auug.org.au>
In-Reply-To: <20201005230150.5637fa42@canb.auug.org.au>
References: <20200930165212.GA8833@lst.de>
        <20201004141758.1013317-1-paul@crapouillou.net>
        <20201004195921.GA556605@ravnborg.org>
        <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
        <20201005230150.5637fa42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o0ob=B9XXO9RERmdPqVSMfF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o0ob=B9XXO9RERmdPqVSMfF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 5 Oct 2020 23:01:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil <paul@crapouillou.net> w=
rote:
> >
> > Pushed to drm-misc-next with the changelog fix, thanks.
> >=20
> > Stephen:
> > Now it should build fine again. Could you remove the BROKEN flag? =20
>=20
> Thanks for letting me know, but the fix has not appeared in any drm
> tree included in linux-next yet ...
>=20
> If it doesn't show up by the time I will merge the drm tree tomorrow, I
> will apply this revert patch myself (instead of the patch marking the
> driver BROKEN).

Unfortunately, the revert patch does not apply to the drm tree merge,
so I have just marked the driver BROKEN again today.
--=20
Cheers,
Stephen Rothwell

--Sig_/o0ob=B9XXO9RERmdPqVSMfF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl978wEACgkQAVBC80lX
0Gy3kgf8CLWGQCMOPLy2gQCli86MZWSpicvk4sSiGQTGkHYZcfUK6fQGhZkkhIqA
1B1V33q0Pp7/u9tp7XD2Wt62UeiWNA/GTk8crZMHbAp8Bf2qEcRo+2g7/liHq1WU
goX7M3iois0cb3+fir54o89QSwEIqi7tVZ1HwQUbR2HeJ9csbHaymx3TXdLy7zxU
hsriysf5Zk6YfjBzap1xMZSUjioBq1jUXhN/r/grXi/NpmgfT/0ysQAwu+7jUuG3
+AzzhTGciRHxavQur/+14dPgI09KjvHL4t2wxldnGC3TLyH2SZLfhPJNsWxVrclx
raN7plyI723XwVZXhAmWIyOEg/he6A==
=JUJe
-----END PGP SIGNATURE-----

--Sig_/o0ob=B9XXO9RERmdPqVSMfF--
