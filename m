Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ED6C6FD1D
	for <linux-next@archiver.kernel.org>; Wed, 15 Mar 2023 02:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjCOCNG (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 14 Mar 2023 22:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjCOCNF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Mar 2023 22:13:05 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97221CC29;
        Tue, 14 Mar 2023 19:13:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pbv7K339kz4xDq;
        Wed, 15 Mar 2023 13:13:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1678846381;
        bh=WQQg7X4YBFQFZIPkw+RXCtY8FwqACXRBodhmDceWuS4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KMMKvvkC32k+PRqu5LnQaifW5tGa3lhqNO9+GbqY1wPjauAuqu+Rb5szlX2DSAcUw
         AvMO/jzpfxFL61Cn6zCXRdtI08AlvQbUM2Qrs7zVsuUeC5hAYq0RhIwy3HU1gxTmRO
         34OPaFjqWgCkpPA+hSvAr0ycZ9PD6n4MdzjwRaWSU69tBYMoj76xrSCmlEamEBJo4c
         BUzTx7uh5vr++h8rpHb9dJdTgJvDQ3d76ob98QJ92HqndLfpmfwDBOGIVpAODuqnyG
         5EaFfQq4NccZiVieHmAqf37I1g9RV+EESLVTjW0fLb6C9TYPrsXa56ngpvRaLLBa1I
         NoJ8GvlKdCElg==
Date:   Wed, 15 Mar 2023 13:13:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnaldo Carvalho de Melo <acme@redhat.com>,
        Joey Gouly <joey.gouly@arm.com>, Peter Xu <peterx@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20230315131300.7776ce0e@canb.auug.org.au>
In-Reply-To: <20230314082447.46640d77@canb.auug.org.au>
References: <20230314082447.46640d77@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DLKFTa4/r=SVi=3YNShFacl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DLKFTa4/r=SVi=3YNShFacl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Mar 2023 08:24:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>=20
>   a1713ab0740f ("tools headers UAPI: Sync linux/prctl.h with the kernel s=
ources")

The above is now commit

  36714de4fa54 ("tools headers UAPI: sync linux/prctl.h with the kernel sou=
rces")

> This is commit
>=20
>   df4b933e0e51 ("tools headers UAPI: Sync linux/prctl.h with the kernel s=
ources")
>=20
> in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/DLKFTa4/r=SVi=3YNShFacl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQRKawACgkQAVBC80lX
0GwEvggAjY2ihCUqj8eq7SlXCg4ZFeuRBfOmHK/cYbTPboyn5tlpdYeZ4b6Mbzlt
mFRLvslOlJS/mgFPjJ8+zRwiF87H+6pVBDFdDoOboYN9bEZ2f0wGnvrmNMKtkGZV
pn1IWXsmPM8PlPtZz4sLFMe5l3Ki8PGKbigHbo2bloLDTky6DGBDJ54IgR3yV70C
47f7c9iQhtsU14LwOPXwDfb/6W/6jhL30IzOtH0VFcmP3JJg6gfPIt+tpyRjYXZj
uKb6pmCG0BO9tlN7CdMi8UhYpQyZGxgzoygSgi3IceCAsM2pjjpKJEmBkspvIA7E
muisR6QkWwxOBt58gTNB7bFcjek4Zw==
=l2Ox
-----END PGP SIGNATURE-----

--Sig_/DLKFTa4/r=SVi=3YNShFacl--
