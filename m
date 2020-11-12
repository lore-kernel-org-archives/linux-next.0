Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1915EC388F7
	for <linux-next@archiver.kernel.org>; Thu, 12 Nov 2020 21:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A56C8216FD
	for <linux-next@archiver.kernel.org>; Thu, 12 Nov 2020 21:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Mt97BnKH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbgKLVCn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 12 Nov 2020 16:02:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58387 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726766AbgKLVCn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Nov 2020 16:02:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXDZS3vVMz9sSn;
        Fri, 13 Nov 2020 08:02:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605214960;
        bh=QmXB6n1y0aFaNnn3Wo6JezUHvOiEAvYxWwuwXHjTSOk=;
        h=Date:From:To:Cc:Subject:From;
        b=Mt97BnKHfJI6/chRiIrcBQ0vwYw1pYrhsa5FsaGFVXVXRzvF2vv5wNBIrD25baawa
         hT1LDgqsW01LQZnHaRZLhbMsKLg5GavzP4j+MDr73UsysuX0rRX/Ipn2bDuo32qNIa
         vxhdfp0UMpWM1d4Zqzg1KJFykmd1v2ujbylNUqPGS1qjALhrTSQ43wbNqEs99oYsAN
         c3XYxNnVNZEWbOZSGuinE3h+mXT9smv2lwke7kXu8s4GGqNHf67pT8iRZWcVLt+BPb
         S3ajDqzRXqVkNav1o6FF6RgRShcx2fMC8VqSFnhmyws4TmtUVvDZs6AxcVm3S+01Y5
         JbhkVJEdgnRDg==
Date:   Fri, 13 Nov 2020 08:02:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20201113080239.2fbbc615@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ihxx/T_WHsgQBBEIgU4CHGk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ihxx/T_WHsgQBBEIgU4CHGk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5f85b351d3d6 ("fix return values of seq_read_iter()")

Fixes tag

  Fixes: d4d50710a8b (seq_file: add seq_read_iter)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Also, just use

  git log -1 --format=3D'Fixes: %h ("%s")' <commit>

to generate Fixes tags.

--=20
Cheers,
Stephen Rothwell

--Sig_/ihxx/T_WHsgQBBEIgU4CHGk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+tou8ACgkQAVBC80lX
0GyHzggAjE9ugBsaKFeiEDpwQuDvuVePMxqzpsczDFSNYEeAOmnSzliJXYQIEncg
Zd7kw23COnW2HyhEvl2HCGrMBHJ2qKXLTeyP5IKYXUSb9ObpIawrZkkF2OY2C1To
gLmqKE5eqgwi1r7bhONo5uTZGeBdW3kr4+D/ax0dB9DKMcu/tpQi8k07xkGAHlZI
557/BzpLlnkU0/Vcz8yBuCuUcw+jwh9I+m1QE7uvxe0gNyHYwj+5qNXXXXicsoqO
/fWQrBpGd9gb1/mFKiX89qSs0tQILiThvHSDNDxHkyoEak/92kp5bRUzK2JTykln
EbPF4euAL9jlnktyHUPcL6zLRdgSMw==
=KAQX
-----END PGP SIGNATURE-----

--Sig_/ihxx/T_WHsgQBBEIgU4CHGk--
