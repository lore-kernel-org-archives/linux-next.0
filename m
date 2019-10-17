Return-Path: <SRS0=Tusb=YK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645E5ECE58D
	for <linux-next@archiver.kernel.org>; Thu, 17 Oct 2019 20:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C1002089C
	for <linux-next@archiver.kernel.org>; Thu, 17 Oct 2019 20:40:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bnWJBnsk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbfJQUk5 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 17 Oct 2019 16:40:57 -0400
Received: from ozlabs.org ([203.11.71.1]:38719 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727269AbfJQUk5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Oct 2019 16:40:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vLfG0PxKz9sPF;
        Fri, 18 Oct 2019 07:40:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571344854;
        bh=4+AbmEN1UloqaNfZIMJIHNWR7p3UyHqDI1dSFNz7uLM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bnWJBnskU7rMpLrijvGzGao3LWoHt/cSvkxC2Fske4/+Zr2Rh04X3IaOZuTLs/cTk
         rX/ouQJtklekTQh4anIxsRG3RGYaw2K8gCX9um4q/e2oIVOFxCFSwqRPkOh6kC91ZU
         GEsvPiPYHgcEFR2Zf+EeSpOjOqa8XbZanvc9XFCd0j4CXkpMXmjacoAbshrxTS+a8u
         y6SAW6ktiFbVRi2/xxsIuqKgYmc3pM/UI5mDweYw4GEB29+UHNMlZl9+HgaoRpyRNK
         pOVrvZBv8Uh+mmaalrT3xBdP2rXzS+GVbj+4Y9N1se+X2Ufken3h3YOxkffFL1FT9h
         Cz8t5MmRKcfYQ==
Date:   Fri, 18 Oct 2019 07:40:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>
Subject: Re: Adding thermal group git tree
Message-ID: <20191018074040.6e9a8ba5@canb.auug.org.au>
In-Reply-To: <17dd6a545ebb23497647a14e8574effe1a0f674b.camel@intel.com>
References: <540b4561-8920-f4fc-1b90-b013f20c8e25@linaro.org>
        <20191015075154.4858a256@canb.auug.org.au>
        <53defc08-9f67-ecdd-eb77-c0f34fecf05a@linaro.org>
        <17dd6a545ebb23497647a14e8574effe1a0f674b.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1EQb0nw/b+0aQHirfW8BYaz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1EQb0nw/b+0aQHirfW8BYaz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Zhang,

On Thu, 17 Oct 2019 09:40:06 +0800 Zhang Rui <rui.zhang@intel.com> wrote:
>
> Thanks for adding the branch, and yes, please CC Eduardo and me. Thanks
> a lot!

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/1EQb0nw/b+0aQHirfW8BYaz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2o0cgACgkQAVBC80lX
0GyHngf/crAf5MmBwzLEVd0kikIldrY3iCY+QU5bgUviiJ8fhL1KW0xINSaVoxRP
rvmzGrw9ltO7LhBZmP2shKxFDKgnp0W3cP1pxs+W9D5mz8N0DiD9KTV729uPuPYI
HpMC5tzknBwBRwIflKqQuAxX/legN0EOKtA8slyTSoigozAVQrmeHdvmenLi87H1
dlP3mokPQf0bOOGqKe/qZoNJhKrs9kKfowcuZ4VJLRKpjy+BKqC0KCR7o8uHZIJY
jaZSqLDOYD8+k8rWr6crVScxNWjZwMVozNUhv/95kC4vQgfTEcknQbE7YU5i1oxV
U8C/kgw/uXYdVBLmHvm8+dllio/s3g==
=yQQ4
-----END PGP SIGNATURE-----

--Sig_/1EQb0nw/b+0aQHirfW8BYaz--
