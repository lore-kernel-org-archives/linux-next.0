Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70BBC433FE
	for <linux-next@archiver.kernel.org>; Tue,  8 Nov 2022 05:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbiKHFve (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 8 Nov 2022 00:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiKHFvc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2022 00:51:32 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0562CDE3;
        Mon,  7 Nov 2022 21:51:29 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4N5y001VZPz4xGj;
        Tue,  8 Nov 2022 16:51:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1667886688;
        bh=Q15WKHNU871697DRgpNRD0yvpWDv5RNlY8hxDm5DjIw=;
        h=Date:From:To:Cc:Subject:From;
        b=HGu5u/vgv1gxE2pKCZ7RYUPGmGFFX2fief3fGYhvk4iAfq/Vbjti1vSEh1lDoRtEK
         Z7vGlSNNBEJzrnIxUDr+kTM6QEvIYFiDbIFl/V2WhYlIhhALVXWn4kBW4uLv0MidFB
         wCdFUC6A8z1hTeqK3dvw1mM5GEbzQE4VemtH7itqveifJgIVbcpJO4AXAKLaVwVE1N
         h4iUDIgsvyBpOotDwfd1Oae4SDt4OvGhT2InODzj9MgjQu3EGB3fc7NVUbIfQ3OFwn
         35Xes/iPDGz6t3kQdpMrrSw9iUT9qae0skgNLuH278Rzz0MgmTJu769OI8MogUkDj5
         B0zJORD876/Fw==
Date:   Tue, 8 Nov 2022 16:51:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommufd tree
Message-ID: <20221108165125.3bf96028@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oI6T=2XI64qrAU_VvNrS6iz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oI6T=2XI64qrAU_VvNrS6iz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (htmldocs)
produced this warning:

include/uapi/linux/iommufd.h:277: warning: Cannot understand  * @size: size=
of(struct iommu_option)

Introduced by commit

  5a013b3b3b2f ("iommufd: IOCTLs for the io_pagetable")

--=20
Cheers,
Stephen Rothwell

--Sig_/oI6T=2XI64qrAU_VvNrS6iz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNp7l0ACgkQAVBC80lX
0GwmJAf/Sn2IO4+hPclLkZlqwEY7PCXvtHbaZlkA335LcQsGAsJbLVgS6sCdgzFK
tPsBaU/8W7+xdqSvFuFXmMUjtxtT9776P3+z2bxj7FVGAPHDCe6qFby6j3yPxZEg
QlWIqQ/h+nAgrX2z4d5g/VnFRzOPGxE6E5+k5O56nnzGjhrdGy5igrjDhen5Egmi
Bg4uIoCdGRPQsVQylpFgQLZTVzaNN+jqMFBXJcTl7a5TckwprY379zTSRAHhOiRt
1FOBQgpzRATPb04RCG55ZUbZ5BXrqbWJqx4cEHLX0KWrqRJ4CViJhkkmDK72ddVT
7BoW2b4Pl1HAa1mztLQczb0PNpIaFQ==
=vDhu
-----END PGP SIGNATURE-----

--Sig_/oI6T=2XI64qrAU_VvNrS6iz--
