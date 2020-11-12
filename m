Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E764C2D0E4
	for <linux-next@archiver.kernel.org>; Thu, 12 Nov 2020 20:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06E78216FD
	for <linux-next@archiver.kernel.org>; Thu, 12 Nov 2020 20:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="u9HZ5Ont"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgKLU70 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 12 Nov 2020 15:59:26 -0500
Received: from ozlabs.org ([203.11.71.1]:51161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbgKLU70 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Nov 2020 15:59:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXDV46cXXz9sPB;
        Fri, 13 Nov 2020 07:58:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605214733;
        bh=xH61AHWhLRh7kwaXESzl4unIRM81PM/ruW1UC3RhhzU=;
        h=Date:From:To:Cc:Subject:From;
        b=u9HZ5Ontv849J4pwPgMAchgtwANfe6Mj0vKbnaDLe4cMvfKLQz2XkQ4KeW/qC7FHZ
         GKbmCBAc87rk/DAz4QgX3GS/LUXScYRVXU7vmEiBMM8eIYFi0nmQD4V6zOuT4c8OKe
         cgkLhdt1QskK3J7g7dCF8uRr7WN3hivLrtOlA4FXy8TchQKvfLBKjBKgkK8u3ikcqO
         NsiAvCFqLhlQaFxnt6PxC0We5JmVCkrEz1rijAWo+AFb0VdzH/V08xdi+vcvPz7Brf
         7X9mwsGJvDptFLnaw7+0YShZh16NIIN2XflzmRoIUJt0k/SgkVJpP8DnnW6tBN5JxP
         GX77d18sgukgA==
Date:   Fri, 13 Nov 2020 07:58:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the usb-chipidea-fixes
 tree
Message-ID: <20201113075838.53122e1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AHEdcqSLwpBEeIpKKOzxKzT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AHEdcqSLwpBEeIpKKOzxKzT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3d4ee0b42f65 ("usb: cdns3: gadget: initialize link_trb as NULL")

Fixes tag

  Fixes: 4e218882eb5a ("usb: cdns3: gadget: improve the dump TRB operation

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/AHEdcqSLwpBEeIpKKOzxKzT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+tof4ACgkQAVBC80lX
0GzOigf/fiZuwv68s/8sXmm4UBc+0DxBrb0homa3w6iQksxLF2vIAwCxwSurobbL
L5y+7/RX7nqThIwFD0Yi+gx+qWnZiYqyR8pNglNy+Q1PMHat/reGNPgLoQJ92P25
F7F4ygb0QbYdcHP9ME3O1xBJyrpYoIOOlhnjFinvaoFMSWiAdXDbHKMK1jqRSH2G
P4zv6N1ZY2coULR4PlojTsPwsSz1ff4BuQtuOklvq9WTydhngzrij+/1QRAix5ZD
fVGTGqHIh1s1xvIpdYNV5z/qbhY+gd4Ghq5qcUWkv0F2BsGz+EbM6pQ+3Vt/2nbg
n3Z0E7/MaEClXd4Le1UY2LNgQx31aQ==
=eJOj
-----END PGP SIGNATURE-----

--Sig_/AHEdcqSLwpBEeIpKKOzxKzT--
