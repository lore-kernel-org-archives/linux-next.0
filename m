Return-Path: <SRS0=csPv=YP=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A64CA9EA0
	for <linux-next@archiver.kernel.org>; Tue, 22 Oct 2019 20:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95430214B2
	for <linux-next@archiver.kernel.org>; Tue, 22 Oct 2019 20:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bCITiQxG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729874AbfJVUUC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 22 Oct 2019 16:20:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388342AbfJVUUC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Oct 2019 16:20:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46yPxr0wtWz9sP6;
        Wed, 23 Oct 2019 07:19:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571775600;
        bh=zOoI6V1qLBnx94/g34LAzIzfyGt71rGeV9BVSZI7ZAA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bCITiQxGbxoyOv0OaKqe70I3K4rtZKHpcKH47FFPgF0rCmgXo5Zp5h7gAzpS+Bhyt
         fpnxqP8egp39FREuIfsWKqAv+vv4np/Qw1N21ihqMgnVU3rq+mIa5PkGEeybrr6veV
         jz5p4/pVpPggZjzxI+/vGNhl9VRwnjWZbKF2DogJfmHKkCEnO8tVd9heAt6SGQ6AMy
         a6j8KMrHntePOyx+8h1K5Rr7urYSyhQSmJ2H+1g86cHx+ElAq5I+6diag8ZHBByI1o
         YeJnCcumSo8rQMyLSgs7J8+GMxGbdpgqzYiVik3vxwfHfABljd4RtTZS/m7vRf28fz
         VAAKIiHJvBepw==
Date:   Wed, 23 Oct 2019 07:19:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Update url of rpmsg tree
Message-ID: <20191023071959.58f3d81f@canb.auug.org.au>
In-Reply-To: <CAOCOHw7UfbTZ-oLca2j0U0TfUR-4MPvOdw0chtcvnjeeFgREMQ@mail.gmail.com>
References: <CAOCOHw7UfbTZ-oLca2j0U0TfUR-4MPvOdw0chtcvnjeeFgREMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zK5h46Iqcmhx5jC/jg+Qutj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zK5h46Iqcmhx5jC/jg+Qutj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Mon, 21 Oct 2019 21:22:44 -0700 Bjorn Andersson <bjorn.andersson@linaro.=
org> wrote:
>
> I recently moved the "rpmsg" tree to git.kernel.org, can you please
> update the url for the tree to:
> git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git
>=20
> Branch remains "for-next"

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/zK5h46Iqcmhx5jC/jg+Qutj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2vZG8ACgkQAVBC80lX
0Gz/5gf/Z+wEBjIdrVTiZjjqgrFeogU8K5DiR+S7bE6TMyB2DIP0BKRFIs9IBXqG
J0zqrSYbTxB8KffghMCKd181he/G5k9p6JHg61SmjEoBAiDr+XJIz1ZCp+05cwUi
7JNUXuARxElEN7mXRxdvdwZ+0F01XVkrXEsTh/2a6RWqT8B2pCvhGyMQPyh/+FLT
Pde9ZHJy/IolXYBuYKubvTqnTm+fpSs/z2P1lvZzG5KXaw2poqpSevfvnV5mjyNB
vJzYoaRyoOvOfmNp1sXI/z0uSIR5zUm5hVwFxPbaDvBLu7n2KKCdcGMWRIiozTb1
I+JSpuPce6Qti2ymICCAWqUrB2nCdA==
=Sx+E
-----END PGP SIGNATURE-----

--Sig_/zK5h46Iqcmhx5jC/jg+Qutj--
