Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD686C197A0
	for <linux-next@archiver.kernel.org>; Mon, 20 Nov 2023 21:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjKTVkD (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 20 Nov 2023 16:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjKTVkC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Nov 2023 16:40:02 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9D9CB;
        Mon, 20 Nov 2023 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1700516394;
        bh=ZUHtKmWY+81XhelBP73qoHs8AeB/zM3hJJ3dafxVNj8=;
        h=Date:From:To:Cc:Subject:From;
        b=FCYhYiK41ZvwgxO6TaIDf5s3/PJnUI6Wh19jpad0X+fxNpT7nKeldI0r3hvoDZWuX
         7ZaE5HkdSaSoGb35Kj+KvBZQJ0nNuKUlnthasHKL6RqwF9fa4AIYZd1NFqNSLhgtS6
         uT3yAy8242CFYU2/lMo0zaCA6ge0C3L4ZgaR9kKrVHDu9uLtNAmn9saZBF3A4sGQO2
         IHHOGJ10RV7jkFYMROWG9lFC4SKHJkguZUP1Xv+JnLHeKuKgpDNGHOUt8mBrbVIMYD
         g5PdXrgiEBqlu56FaRSneow2f1nXbPE7YSwyVxeeQO7pWE3GzcCVPm1ip9x6q9h3Wt
         e9vje/Oz1kQXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ1BK6ZP2z4wdB;
        Tue, 21 Nov 2023 08:39:53 +1100 (AEDT)
Date:   Tue, 21 Nov 2023 08:39:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Fabio De Francesco <fabio.maria.de.francesco@intel.com>,
        "Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm tree
Message-ID: <20231121083951.5b314a98@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vh=cqXW67=TJWI=_58Lys6z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vh=cqXW67=TJWI=_58Lys6z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b2419063123e ("mm/util: use kmap_local_page() in memcmp_pages()")

is missing a Signed-off-by from its author.

Well, not actually, but it helps if the Author of the commit and the
Signed-off-by use the same email address (or slightly more similar
than this:

Author: Fabio De Francesco <fabio.maria.de.francesco@intel.com>
Signed-off-by: Fabio M. De Francesco <fabio.maria.de.francesco@linux.intel.=
com>

--=20
Cheers,
Stephen Rothwell

--Sig_/Vh=cqXW67=TJWI=_58Lys6z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVb0icACgkQAVBC80lX
0GzlAwf7BZMi0XRFj7e5+2bRYhN4y77JCfGPhEcQlmylA+b002gzy9A0iNcYA4yo
U4vkbNMq6Vw6BZrGJoZSK/e4O6CgCpOwyXmuoLX0juxAIn05OwmuVmp2OIH5QkII
GaYrIq8CWRmZFmrHq6584xZEnvJjGQZuMT8Wy83btCbkvq7KDgTrqYzMuf5rjhux
MF7BofyP5A5isDi04qGjmgY5I+GxW/H5oB+BNWd6Z9phBFmvOuduPuFzH6036f0D
5LSwt6o1MBuQDHRv9o37BlfBHHKBeqdo9N/klB5sc+hdIgb1JxvBYdVjrmsfe5aX
AKQFBClorMjzDM87y4nwM6cgt1iNpQ==
=SNG0
-----END PGP SIGNATURE-----

--Sig_/Vh=cqXW67=TJWI=_58Lys6z--
