Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366F5EE49A4
	for <linux-next@archiver.kernel.org>; Sun, 20 Aug 2023 22:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjHTWXG (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 20 Aug 2023 18:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjHTWXF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Aug 2023 18:23:05 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A7DA7;
        Sun, 20 Aug 2023 15:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1692570181;
        bh=dk7Buz7G+v0jfK1OmllJ171LeoXf2NdIQojna/soeeE=;
        h=Date:From:To:Cc:Subject:From;
        b=m9B3iYUnclQG4PBMkWiWSFmj4+WUkuFQossHk9XW15yYTTjgssKHO8StvlMG2yaay
         DFKka6yGfM5wGfxZRUnpCebeMVOtrmT/XsUe6SBMTWWI+9yiwxpGkUMZ8z3Oug2ML9
         jmxgb3XHUXvtOf34neukpQvlk1ee+n39vo/+GeU7j+V6Wknxx8Isl9vPin4g0pWpnV
         SqD3dn8tSQgLUMN/AuGmchBVIe52J1Cyw1d4bKCNUPLI5St54hWGmGkFjKOCSTO1Jg
         t4eWvkPNizV6zcqkV7afOGWgVQfhRnM3mmb/sq3JablVBgFIBbStbSjvZbFGxe+NC/
         wxAs/BKmm44ng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4RTVVY03prz4wxy;
        Mon, 21 Aug 2023 08:23:00 +1000 (AEST)
Date:   Mon, 21 Aug 2023 08:22:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the block tree
Message-ID: <20230821082259.58d2784c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kc36gaFyG9JjqE3A_6I_f5E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kc36gaFyG9JjqE3A_6I_f5E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  f4283bc7e38a ("drivers/rnbd: restore sysfs interface to rnbd-client")

This is commit

  6548fce05803 ("drivers/rnbd: restore sysfs interface to rnbd-client")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kc36gaFyG9JjqE3A_6I_f5E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTikkMACgkQAVBC80lX
0Gzq0wf/e3GZ+kVbCI7D69e8Fgopu7NA2+4srziRZR5QFAwKAuuB7WlkLPNS03/a
yPZMB+1AWjM5C47PKiA/nB0m+jGTM1Wz9fqxnaKJ+gTBM+qtrGyDu7QBC/naiuGE
itJAiDhi+iMUUNWzOTODXWNqbwvxsesiHpM1VSX5rwqjZ/b9cvTOol1CP67KftVt
2XGhunfG64rdrIdNY9hBEicfCeoY635EgXaMi/IjDolpoWd9PRO7AgGaXUwBVHZX
leMy7FBdSAI0bv7tL3QzIiosA1JjdJ6e7Xc2iLzPyB5iXCDsGvcc0/BuXqN6CqGo
GU6ysJ8qDPbC19PkRGHAaMRjTxrePA==
=JGWf
-----END PGP SIGNATURE-----

--Sig_/Kc36gaFyG9JjqE3A_6I_f5E--
