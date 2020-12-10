Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E4CC433FE
	for <linux-next@archiver.kernel.org>; Thu, 10 Dec 2020 10:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E925C23D69
	for <linux-next@archiver.kernel.org>; Thu, 10 Dec 2020 10:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729816AbgLJKiA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 10 Dec 2020 05:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgLJKh7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 05:37:59 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA42BC061793;
        Thu, 10 Dec 2020 02:37:18 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cs9Mv6YYYz9sW8;
        Thu, 10 Dec 2020 21:37:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607596636;
        bh=6pe7CPiYFHpmonWfOX3A+y01aY83tz2WgBLlJ6GkT3g=;
        h=Date:From:To:Cc:Subject:From;
        b=cftmQ7V43eVN1/SKOwvKB2rWu8xZzuC9lJgqGFbCHToRRfOxLxQSln5AE1uFU6oeI
         tH8PhtzzIrnxTdB2T1w8H79deHaI18MAeHvVeS7M9OUAyqe3k9647cR0e9rXfSrm7+
         He8DhXx9FvZqhSeUi6Dtcu6CbZQDWT2W6Qpu/9Q1wKN+/TGVoLRJYe2fgMaiYug5Mj
         LDscuIde8YeB9Ol4XCDBUDhl31qGUkPh01588s2nBDcJ945BkEeUD9AVTenIQ5Eu8y
         0GkXiOAP+tYcK3IBoaye3VyyibYT9WY7Zythu9xZSL0IojQWImhR+EZ3XT4rHg1r8H
         hIlZkXYdZ7Dcg==
Date:   Thu, 10 Dec 2020 21:37:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the net-next tree
Message-ID: <20201210213713.05fec230@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RlI903T+aEUY=NJxhi/H+0l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RlI903T+aEUY=NJxhi/H+0l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5137d303659d ("net: flow_offload: Fix memory leak for indirect flow block=
")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/RlI903T+aEUY=NJxhi/H+0l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/R+lkACgkQAVBC80lX
0GyMlwf+O4mBQ3OsAnLP2zryB5jsJsChMbVaMzVpdb+gDVnxbblLknqsb4AjsqyE
xMVxepfl6lRhxEGneeH1/7f3xndO+qlFF0o+yuGKCEQtCc4ZmHUaLrJgroNoAZVi
Ft9YSXUkRqTpcn8jH/Jhx9WdYivpDJZe/FjHiBxJOqaNQrpqv5XfKiCwIuNqV5Tq
o+uwC2FcrOvIhXr5QU0wuh4jIhrMRFkYZdE/tGudUOMHh3OvW3mA5UUgV06qi2ce
AVSKFRbxqUtAPgLnZQPZ/qXw3xkd0DQroyCFFvEjp2ursJ/2P5AcYM4PXe4kiE3U
cDjGGZXtspUumsDPw4CE0yKhrnOn4Q==
=F6ta
-----END PGP SIGNATURE-----

--Sig_/RlI903T+aEUY=NJxhi/H+0l--
