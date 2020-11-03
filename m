Return-Path: <SRS0=ni0W=EJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28403C388F2
	for <linux-next@archiver.kernel.org>; Tue,  3 Nov 2020 01:31:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB5242224E
	for <linux-next@archiver.kernel.org>; Tue,  3 Nov 2020 01:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hog1lVnQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgKCBbR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 2 Nov 2020 20:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgKCBbQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 20:31:16 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5CBC0617A6;
        Mon,  2 Nov 2020 17:31:16 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQC0x4nwYz9sTD;
        Tue,  3 Nov 2020 12:31:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604367074;
        bh=R0ME40IsqhLSkekzaNqUym7PgE49FAr2bbcQeXFTnO0=;
        h=Date:From:To:Cc:Subject:From;
        b=Hog1lVnQgzerAay2w2ATkgxq6wZoVuZoKKldFRYXl/k54qpKcSgeeqc/Sx3IFu6by
         f+ljpHpZY4xh2JyX6sPiwrURGPqFlHCyKRak9F4cKTtZ8THAGiMB+M2vu0Wz1AzSLI
         bd/ml4CAYb/V8Y4shRwhniDEdw0wsxKNCRqeNPpiE1vOMB0TLhwNgftW8WNGBHZdbc
         veEHNeSWPWjMD0wTHKWOFQ9qRr7wC+G/TWI455D7obT2mF4TGyQg2EzN/lpcjarXJW
         v4wV5sNUGxZto3DnwOfy6PpSAiAkiJV61uA49K2fwfTcW8NhMeJQ3QkZWSCVv1adXN
         uCCzXXKzrQNiA==
Date:   Tue, 3 Nov 2020 12:31:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Daeho Jeong <daehojeong@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the f2fs tree
Message-ID: <20201103123112.68f54d17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L3Q6IPV3LhaSr0aKYPUzoHU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L3Q6IPV3LhaSr0aKYPUzoHU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the f2fs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from <command-line>:32:
./usr/include/linux/f2fs.h:92:2: error: unknown type name 'u8'
   92 |  u8 algorithm;
      |  ^~
./usr/include/linux/f2fs.h:93:2: error: unknown type name 'u8'
   93 |  u8 log_cluster_size;
      |  ^~

Caused by commit

  63d18d4913e5 ("f2fs: add F2FS_IOC_GET_COMPRESS_OPTION ioctl")

You should only use the "__" versions of types in uapi headers.

I have used the version of the f2fs tree from next-20201102 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/L3Q6IPV3LhaSr0aKYPUzoHU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+gsuAACgkQAVBC80lX
0Gx4wgf/dsl0/Qavq1fvVOPQ3PPPoqIx9BQGwGMyJAcsECfsX+XBqKYFZdoBhnTI
KjAiqDQMH5p1b9BeZotgDOOdvmh7zaAsJSzX21OoQw0LPtCXuqRm/FFz37jVcpTD
2UI2kgCgfXo5ZmUviTa6jUKsPZcbLFyt/8qwFQJhNtOgCJLXdrdSfgW6ae3FqEtR
LYGynGJ/fjJzQRWiyERCEUby+bTkEHi5GRGqb/oJXO9LhwJ28Y8fmdqODnQqISVS
nwJIMO/eHiZMyl2XL8jiKz0lTMGrxhgm42ECqsKkOTxhWENCn9DcjNPzEzDEGQm4
PdOQ3YCIeYZgEY/1QFCZldE5gbn2Mg==
=TiJZ
-----END PGP SIGNATURE-----

--Sig_/L3Q6IPV3LhaSr0aKYPUzoHU--
