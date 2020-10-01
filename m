Return-Path: <SRS0=GrK0=DI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92BCC4741F
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 11:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CEA62184D
	for <linux-next@archiver.kernel.org>; Thu,  1 Oct 2020 11:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mhmqbBsY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731816AbgJALx6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Oct 2020 07:53:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731767AbgJALxy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 07:53:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2BNb6b1tz9ryj;
        Thu,  1 Oct 2020 21:53:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601553232;
        bh=2FCOxOqfb2Y262LQlgVNx12u1XcKtQKgg6fpdlA7EFY=;
        h=Date:From:To:Cc:Subject:From;
        b=mhmqbBsY3FSOnVeZ29S89/ajw4gtGKMa0wOqbDP/TVLjlM5T4OpZwFHj/vqJTMjL5
         Haby58kNckhdWxpE1KWpCi2+HTB/d1jEQcsw4boWPv+lei0VhaLrucrFC+2qOWtSKb
         2oMi6wl5CgLTkGxF7WEx7Td+z4KxwhyuSBqUccREWXpojZPKWJb5IVqefmwG2mOTD7
         7reQ3wfFXb45hEQ0xKHRgKJ6t569G7yt/VWazl5J2LStBNxpclSX9HPRaita2zqL77
         aX3m8jr3WJFrYWFwWQrCXFWQ0jmVnvT/jWJXdDqJwrdjcHy7wB9X1cwiwrYvXn1mSB
         tLlVLdNYoT0kw==
Date:   Thu, 1 Oct 2020 21:53:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anant Thazhemadam <anant.thazhemadam@gmail.com>
Subject: linux-next: Fixes tag needs some work in the bluetooth tree
Message-ID: <20201001215350.02b20b8b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8K+U/Vv3ghIVitBEaXFX=vo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8K+U/Vv3ghIVitBEaXFX=vo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  44d59235ace5 ("Bluetooth: hci_h5: close serdev device and free hu in h5_c=
lose")

Fixes tag

  Fixes: https://syzkaller.appspot.com/bug?extid=3D6ce141c55b2f7aafd1c4

has these problem(s):

  - No SHA1 recognised

Fixes tags normally refer to the commit that is fixed.

--=20
Cheers,
Stephen Rothwell

--Sig_/8K+U/Vv3ghIVitBEaXFX=vo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91w04ACgkQAVBC80lX
0GzO4Qf+MHMEifPGlis7vx2jTvm08/Pt7LRC/22eb+g+tutz7Zz4CcYs30+YaGfF
wOSGFsngh14w/luw92HtfGxTxAAahUp4hEUVG7GgLr+Qsa1CCNmhJK0avgqvrjA3
GCg5u7GqCWrNP4gUIOl2uR+mZTAU+qdyEn1hiu10e7HH+frbvu+n3o6qaPCafMKg
TXDnYt6OG8/kPtgM8+TI6qhw6Kun739JF2vueTNJ+GJAr5cqoNPPGkQ88chBJC09
eAgnRutKYKpFXqiPDKsNV78TVzyBoun3ATgOJtcoCGujmFYqeNKKaHrZp9A84aUr
bp8IXvk9rgTBeLC6mwp49r2abGEL1A==
=vvDi
-----END PGP SIGNATURE-----

--Sig_/8K+U/Vv3ghIVitBEaXFX=vo--
