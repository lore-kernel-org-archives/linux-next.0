Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1FCC5519F
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 04:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 464152463F
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 04:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fNdymPo7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgKREvb (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 17 Nov 2020 23:51:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56205 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgKREvb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 23:51:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbVl471VQz9sRR;
        Wed, 18 Nov 2020 15:51:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605675089;
        bh=mUPI/M8rkIjYIFi86iXE83+0v2QPc0QsKepPo2lPYeQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fNdymPo73YD/Q6Mo6nR2oQLixa7cA09QnVks9x5RjrjrLk1ErJhIYAOURVXsVw/YS
         CLsoy63DKmciPFr6of2M0aIha7vcEBh5D5m7gwQ+p3DG5BZ7pJv2yEympM8KCMLik9
         7uT60JfvgveOhHmvsZ1OFyXBHYdCQmZzLOABusqELrFVGB1CA08SNKCO0zFl34KfSE
         6te+ZBZlagfHrQXVmmVNhoEswlduJLH5z9vVBrheoFZCNlW/h5EVvmFAHqiRw8fWJk
         fbzomSKvmj3ivm/wMJhpVR+nW/xQzTPnbQ+hhWRxc3DLN6bS1ZUGoHypAZQFF025Zh
         VNcBQrrwwHm4A==
Date:   Wed, 18 Nov 2020 15:51:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20201118155128.64c97667@canb.auug.org.au>
In-Reply-To: <20201118154500.127aaba6@canb.auug.org.au>
References: <20201117151225.6a50abf8@canb.auug.org.au>
        <20201117042359.GB7787@work>
        <20201118153912.1decf6cf@canb.auug.org.au>
        <20201118154500.127aaba6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e5IA0Kg/wog34+XVPUqTMe+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e5IA0Kg/wog34+XVPUqTMe+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Nov 2020 15:45:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 18 Nov 2020 15:39:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Why isn't that "fix patch" in the mhi tree (with necessary Acked-bys)? =
=20
>=20
> Ignore that, I missed its appearance :-)

Ignore that, my question stands (git confused me a lot :-().

I have applied the fix patch to the mhi tree merge today.
--=20
Cheers,
Stephen Rothwell

--Sig_/e5IA0Kg/wog34+XVPUqTMe+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0qFAACgkQAVBC80lX
0GxpJwf6A0vEI+uLG1ai5qu842AFGrUPPZ1UvrLoJKM/zWpuulsaTevjTDW9Tztn
Nkz4yKkATVVU7zFLm/dxHd2/102R+5+666mKtayL20+A1IrwwxWz1ydLo4J6vr1b
4ziNIeTtHdZ9xgPS/bbd+gZGaLdPjqCZiKxIWZV7JHJIEokZW4SVl34oqgg4oeSt
xpSnN3b3gAEBRyJGAJd+FdkleBv8Xb8a1OHgaL40XDs63rp6oOOHSRVwhlsNMKKG
6yZqRvfNvPWGAqiEKl9mAMM6LejmRQw1URibZJ5IrJBHfjYyCfK6BwiV04ZI8eIb
eArdrFVHglkc5Gdz4zg5gdqMJQhlbg==
=Q79v
-----END PGP SIGNATURE-----

--Sig_/e5IA0Kg/wog34+XVPUqTMe+--
