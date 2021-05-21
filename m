Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D423EC433ED
	for <linux-next@archiver.kernel.org>; Fri, 21 May 2021 05:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4A0161244
	for <linux-next@archiver.kernel.org>; Fri, 21 May 2021 05:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhEUFlX (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 21 May 2021 01:41:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230505AbhEUFlX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 May 2021 01:41:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fmb661mNfz9sRR;
        Fri, 21 May 2021 15:39:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621575598;
        bh=DLz3xkMroWrE2NraJ5fMFx2ZIhl+AH5dKaLOOOyN/3U=;
        h=Date:From:To:Cc:Subject:From;
        b=jMqDXvDdwWx9Nnq4NzR7nolihpufSdVYGFnjGfckAcg676G/PdxBVzgOudpd642L1
         iWGljtBiSWZ5hMfvuNSHH6cT6RfBKmVVg9SoNuk9dqib+870WmRZChNOiCxCaAMSYX
         w81hJnKBeGTqzH7/oaSrjeRh19axMol9zJBJxotsOO9nJTevu+hYFkuBD3tcbZgUsO
         MckfuogKmEieY9OXR4POXlnRwsfXDjMKh5Z0qB4KZqj/H9pVSX+q3KV0liu0g/jhEu
         MwZt8cvLNynqR4pb6kLe6I5wZTukN7l8+HlBalzKVvk8M7KE3M3KWRYt6oUmSdXms4
         NQd3Ou/9tNO3g==
Date:   Fri, 21 May 2021 15:39:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Miaohe Lin <linmiaohe@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20210521153956.7c3e98dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gfwKR.+gqSLXjjsvvEk/bb5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gfwKR.+gqSLXjjsvvEk/bb5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

mm/swapfile.c:1039:22: warning: 'scan_swap_map' defined but not used [-Wunu=
sed-function]
 1039 | static unsigned long scan_swap_map(struct swap_info_struct *si,
      |                      ^~~~~~~~~~~~~

Introduced by commit

  c9ea6b99df3c ("mm/swapfile: move get_swap_page_of_type() under CONFIG_HIB=
ERNATION")

# CONFIG_HIBERNATION is not set

--=20
Cheers,
Stephen Rothwell

--Sig_/gfwKR.+gqSLXjjsvvEk/bb5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnR6wACgkQAVBC80lX
0GwBHAgAo9uDYd723t9X3icpOifC6HZt6zPjCUZnheVQ8cSwQDO8gyIzXJgkP9AU
be6CZcZKhbUWpZGhDjxwIBJB5OIe7+VcE6xq673reQ0pQHtytY6M1sNMdpJRyqcS
yS+3oFsBFFBR6RRlPnm7uD+YojvBMIygrOi8dlEfzoOyrY7H6xTW+bo21WGgHTj4
UBkK8v22/dSwXItLkoOBfVDhFsTAW3InxqkZgPMEDUfxo5qkvSapE3TXB3AOUGsf
r2XQO/Cc4+OEGMnaHX4irFOPtY8y04WpNtYbWBegL+C5/xddc9WqOmqlW5rXuxIn
vqHXmAZWkwqQB1Dm/p/CW4a/0+m4bg==
=O0xP
-----END PGP SIGNATURE-----

--Sig_/gfwKR.+gqSLXjjsvvEk/bb5--
