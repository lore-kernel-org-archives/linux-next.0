Return-Path: <SRS0=31GW=CX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BECC433E2
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 06:57:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54453208DB
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 06:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G5yjSd6M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgING5h (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 14 Sep 2020 02:57:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43653 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbgING5h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Sep 2020 02:57:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bqccb2fSSz9sT6;
        Mon, 14 Sep 2020 16:57:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600066655;
        bh=rDnCRXiY1rl+EAVPPMlFEXpH38K3TViG+peSFJd1iGc=;
        h=Date:From:To:Cc:Subject:From;
        b=G5yjSd6MPqjrv0AqKvsT3PAXgkEiMG3MsgTUuZv+F40qDN2LXYQTKiAfqDFmxTUQk
         1JiR+Y2RV/4ejRYrJ6mbX4lhRdpEKArNXe1ORT+L+G+NdWSgfVNpGvM9FoEI0ct3Tk
         CHiQ3mWqnSuYkJDWV0K6Vdlx935x/51cyHeaNYL9s4VKuCxRk0xV5zAUgiUAEMGhnk
         NUx0Fm9IvAITpk7fPRJBr0/IvURa7y/lMjPi9z2swVPHTMatFRgaIFeKRUSBvgZgGv
         fOStnYATx1i+tVhynp34l1Jf5UQMbZ3rKzcEdBMVp7M4+O5DuJ7m+L+ptu+MDWpBg+
         U41mpmXGAon1Q==
Date:   Mon, 14 Sep 2020 16:57:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Oscar Salvador <osalvador@suse.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200914165734.6a14ea6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sjP88y0SobRewhOES/A7V53";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sjP88y0SobRewhOES/A7V53
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

mm/madvise.c: In function 'madvise_inject_error':
mm/madvise.c:875:15: warning: unused variable 'zone' [-Wunused-variable]
  875 |  struct zone *zone;
      |               ^~~~

Introduced by commit

  51fe27319785 ("mm,hwpoison: drop unneeded pcplist draining")

--=20
Cheers,
Stephen Rothwell

--Sig_/sjP88y0SobRewhOES/A7V53
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9fFF4ACgkQAVBC80lX
0GwxBQf/fDDd2LKTSBNYj44NccliTobjg29x0VtjoKKraKrFhAWu10soUypytvKz
mtfrQuZw1oA/8gaGf3F8MF0KOnHIBdeZKQTZhYZ+ZNuHd6s9JSGQXLSnlJwTusJH
Bm3lvHk2EFBI2UOmUEaE/nPxEqRkdm9uWoCFFO7C8tSXJrtd+aZD5mtOl/rLs2g2
yJx2Dg1W6KXQ/ICdGpgMZufqthqBJ3nuEKs28ruIVUur0o2WD6/RsxKDA8khDS9+
7cE2E5j/tvfEo7BRpeFMbQz8tMK+2s6E4JpdF7OsUA25KFsd/GSV1c3biE19LIyI
ud2vZTjbB8cH/FbS5TJHcgNT8/df4Q==
=1Oj8
-----END PGP SIGNATURE-----

--Sig_/sjP88y0SobRewhOES/A7V53--
