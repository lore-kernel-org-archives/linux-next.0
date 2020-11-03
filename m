Return-Path: <SRS0=ni0W=EJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBCCC00A89
	for <linux-next@archiver.kernel.org>; Tue,  3 Nov 2020 01:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E3B222258
	for <linux-next@archiver.kernel.org>; Tue,  3 Nov 2020 01:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n+QHXLBa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgKCBAM (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 2 Nov 2020 20:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgKCBAM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 20:00:12 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252AAC0617A6;
        Mon,  2 Nov 2020 17:00:12 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQBK51XxDz9sTD;
        Tue,  3 Nov 2020 12:00:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604365209;
        bh=sLPUaPMrmfPiHd8e9ODWFB4xK8xegdU7Jb7Gt0tgVoM=;
        h=Date:From:To:Cc:Subject:From;
        b=n+QHXLBaQ4e8XpQDeG5sI2AxO7uPOUfkqZ/E3K2G3KaUPl2QxoUNcACQVMdTSHGpo
         uCVItCLmk2oh3uVQaPhwPTHsynYbk0X2yxRl7V/mMsCiNl7wAXkv52CuRpZr3dE3aa
         fzow0hxm06nGC8lg6znkH1CezOlDq6aZ8uyHDILnusztmbcWfvdUG/1j+yLtKlDLj9
         ZLZ2Z7OlqxA9GjUkE+sRFw4250exCkVnq8M8ts58EtPU4x0ki2wZOWHf6OnyyvIRr9
         pAgFxbQaO/ZsJITLgU39kd2MH0HDDcKKVqg8Fh4aNbfUTjvJeTIg1ofPWhqm3y8/tV
         VfpWpH4B7dvBA==
Date:   Tue, 3 Nov 2020 12:00:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the imx-mxs tree
Message-ID: <20201103120008.3f869d74@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tXD6X/1ChbIAO1HZNmTi6it";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tXD6X/1ChbIAO1HZNmTi6it
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the imx-mxs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-imx/mmdc.c: In function 'imx_mmdc_remove':
arch/arm/mach-imx/mmdc.c:465:24: error: 'mmdc_ipg_clk' undeclared (first us=
e in this function)
  465 |  clk_disable_unprepare(mmdc_ipg_clk);
      |                        ^~~~~~~~~~~~

Caused by commit

  52172fdbc3a3 ("ARM: imx: add missing clk_disable_unprepare() when remove =
imx_mmdc")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/tXD6X/1ChbIAO1HZNmTi6it
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+gq5gACgkQAVBC80lX
0GzZ/wf/dIK3hoSFQ5EeNSM7GBlDMLkxwjwf1PmvC2eTQQaOes7YBNRQFhZcsE6o
SElGEcBQALlGPHHrcXTet1d5mAnNp91s+K7RFgZHzBo8wFhimBieNReaZ7JQAp/j
j99SxgrAJTydg58Ritv6YwqAfQEyt4uNYf3/hinpn7+o0o0JA2dZUP9OKAqsIvBn
NUJclAbddiBzuf2UgmH48YWVUCFgdBDzBVgbq8lXyQjAbRkjeoaukVX2kXiXuPqm
O4m64q+2isJvAjZWgupM5iHLk6Ee6sTtHTGEANM0MMrM7GBqiPkxVytXyGka+EtU
KNMsVxenY3X/5hUjoTKoXlxNoiBQJg==
=JB8j
-----END PGP SIGNATURE-----

--Sig_/tXD6X/1ChbIAO1HZNmTi6it--
