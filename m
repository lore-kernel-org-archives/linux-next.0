Return-Path: <SRS0=UXhA=CY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32477C433E2
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 03:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 995FF206E6
	for <linux-next@archiver.kernel.org>; Tue, 15 Sep 2020 03:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b+ErYLMg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgIODn2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 14 Sep 2020 23:43:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42967 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgIODn1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Sep 2020 23:43:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Br8G55fyBz9sVB;
        Tue, 15 Sep 2020 13:43:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600141406;
        bh=hiSPZZ+P59BKNZZSBJf2DtsTdbNBA7MA0d6ekRCGXaQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b+ErYLMghaklDJq+rkq5YnBHeXOkwLQUvhOff8lDDS83gH3JtVRfpqecXuoNWTaXH
         ckupvvZMZ+Pw0lmBTT4t+xZWlVPEArXgc+ZrbljrMmm4j5idi3mOr+XtW/vSmgMam2
         8CrQDWzmFI/6+MUf0XgGGp8bUJ1fWsi49a2p+QDNZ0LC10y17jzUe8/WpEsNT8+fpP
         TKeuw+4Ci7Q9BxuMVHzpoCNpSsyS/sOy3n+LF1WEhp7GL0LukWi54idg8uQJ5R3Wpq
         XIqaXKKUDUBUhF5Uv1DsqjOe9Fvd35yz3pJ7WgfEtNVwbnf8+zchVWWxizb9H1H21P
         /jkzsM4qPJlHg==
Date:   Tue, 15 Sep 2020 13:43:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20200915134323.6b615400@canb.auug.org.au>
In-Reply-To: <20200909123843.390cbf28@canb.auug.org.au>
References: <20200909123843.390cbf28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T2Kp.sALsPYFDLF5IHPKqAZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T2Kp.sALsPYFDLF5IHPKqAZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi All,

On Wed, 9 Sep 2020 12:38:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the pci tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> WARNING: modpost: "dw_pcie_link_set_max_speed" [vmlinux] is a static EXPO=
RT_SYMBOL_GPL
>=20
> Introduced by commit
>=20
>   3af45d34d30c ("PCI: dwc: Centralize link gen setting")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/T2Kp.sALsPYFDLF5IHPKqAZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9gOFsACgkQAVBC80lX
0GxPRgf/XnWhxIIJEZm4JvtDiiCdRWp86NCERApE1GEg/Yn058Ho7Jexa5i+aToI
dUS4raR9KdWX9VeSRS3bHjq1M3q9FcA9zVeyzA+h7/JipVck7xIUn7xaV8JGzVI/
7/hjt84lfibJ3eEyyaMgtWDNmiNijn1AqP07+3/4YzbOcn4KVnL24OvxO+2A+ja2
zG6EL/sy1e9fHqW7hOZiy2hK/965QCgahCEhRd8z2w5dvZU+nB7j1p9RYqo2Gf6R
e0qo12nhn4uW1SdV4MefUxpoxiuU97HaBxOVo1dRu8i0TQWosOD7IyotpGscRJo9
f26N6YxJhRQ0NsU1ZprOToPKJf8G5w==
=Tc2i
-----END PGP SIGNATURE-----

--Sig_/T2Kp.sALsPYFDLF5IHPKqAZ--
