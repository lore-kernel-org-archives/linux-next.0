Return-Path: <SRS0=PU4T=EL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2666CC00A89
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 05:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 333EF21556
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 05:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gc79O+/R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgKEFFC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 5 Nov 2020 00:05:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59221 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgKEFFC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 00:05:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRWfc6w5tz9sSs;
        Thu,  5 Nov 2020 16:04:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604552697;
        bh=aWjAfrWPkG3i+AEKwfdJI8GNgcEXmCMKx67l27nb/oA=;
        h=Date:From:To:Cc:Subject:From;
        b=Gc79O+/RywaKRQ2GfLOeq/yqZ6/E6cXnfR1sXFNRuFEyxpF+oIoWdtQWEbvo7bmld
         zCYddUjHWWjH8pJTYSeMu1Nu8Z8M1QYavklGCtxEeuPrHvLMZ4b5zyv0kVC6VSVtrU
         6DYeM23rO4PQSuutyyX6aPMlucYv1l0bXQJw8cgSGLWvy0ApMGKgRJMtk3gmm+8Tfn
         0gsVsc2T7Aln82hi8tW2rAr8WHRDa+wLiZ5VwIcN1sZ2FwrKQ+W3vl7FsOukvklhoJ
         783fLsy4HlXjRnndcJDS/ffSjj86qCTeYI4h+y6CjlRAI8lruh7ED0Z9ZVckcJUvOB
         etNFifEqXrd8w==
Date:   Thu, 5 Nov 2020 16:04:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20201105160453.0c2283b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BlJxXBQw+gIIO4Epfz0pJEJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BlJxXBQw+gIIO4Epfz0pJEJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/numa.h:25,
                 from include/linux/nodemask.h:96,
                 from include/linux/mount.h:15,
                 from fs/pnode.c:9:
arch/powerpc/include/asm/sparsemem.h:17:16: error: unknown type name 'pgpro=
t_t'
   17 |       int nid, pgprot_t prot);
      |                ^~~~~~~~

Caused by commit

  45339c019cbc ("mm: fix phys_to_target_node() and memory_add_physaddr_to_n=
id() exports")

I have reverted that commit for today (maybe I should not have added
it :-().

--=20
Cheers,
Stephen Rothwell

--Sig_/BlJxXBQw+gIIO4Epfz0pJEJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jh/UACgkQAVBC80lX
0GwtbwgAlFRrwBZlMJpew2EAgK+OAFB5HgIBa/ipnijlhDqcavRT+DsKsyVyKyl2
zivBnP2iSFdGeHlWxe4I5deL0CnDnMyaNfO91GCOUgeHt4nSZCbGrgP/jfpZwroo
FyPzH7Dlb4kbvFMWbc22yhovO1e66g5bFXfaMzP3fO6FN/phx8eq68l8ZJjaMr3x
cArGaEJvgImaaOhxeooFpIvloY2iHyzGVZKJA+auO7svQPwPdbJoGLI+R8tuCqT6
FP+rpzxeOv5U69x3tkj/kWMdjs7lJKXACVrE8aWk/S47wHQt+YLFWdkmWbplieo7
7TV6xhvlIi5IMGju1tEBztAdY6fL+Q==
=DVAU
-----END PGP SIGNATURE-----

--Sig_/BlJxXBQw+gIIO4Epfz0pJEJ--
