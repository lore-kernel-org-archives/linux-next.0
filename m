Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE637C05027
	for <linux-next@archiver.kernel.org>; Sun, 12 Feb 2023 21:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjBLVRs (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 12 Feb 2023 16:17:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjBLVRr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Feb 2023 16:17:47 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3515A259;
        Sun, 12 Feb 2023 13:17:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PFL0S4KRwz4x7j;
        Mon, 13 Feb 2023 08:17:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1676236664;
        bh=HqB7mnhArrPdnTtgPfXnYjUSTWxIz1WRv80QRzk8NUw=;
        h=Date:From:To:Cc:Subject:From;
        b=PFZj/LIPc0qX9H6osAq1atExqo2G1UWrh1cZ0BTMg1thrAHbBkoSEViPhnmLmR9y8
         Sua35PrHFaae1VM7zP9m1rPVLQhHDOsDbZ8phU0PFZ+OKPkUv+uyApUOZpC6Q580d1
         sDiwE+1PdZm8PgxdWEoX2xOG6wvsfYZwYNTCNUT91Zq8er+W2w6zMchDaCYJjzRz/H
         hAu7rF6Ow6PHsYXjwT79rbNVuZstHmGyaai37gdB3bPWRG7q2vwrh4YFheSEoWXQSq
         BsSecYaMRbyUEdYugtC7LQlGXGmrFTkqGwA0yZBFyQDttczWSXCl5zIG1MKN7LfF07
         p9sMOGP6KxJ+Q==
Date:   Mon, 13 Feb 2023 08:17:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ftrace tree
Message-ID: <20230213081743.33c4d0c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TtZcBWgKJi_McMQfAYpRcaW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TtZcBWgKJi_McMQfAYpRcaW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ce9c752ee1e7 ("tracing/probe: add a char type to show the character value=
 of traced arguments")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/TtZcBWgKJi_McMQfAYpRcaW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPpV3cACgkQAVBC80lX
0GzxuAf9HkZZrZJjbdoRcofmQ9icxMstmaV8DP4RAVsjA3s85eIh5PFjwL5w0j1v
hqzVAtRn1/VXLhux1SGV+rGoN/kOy3/ad28OXowJT0TRHVlzxy4LTqvP0d0/QYC/
wwu6QwROlAwvWdWA1FbOm5gbZrb8zcjhdG00SigctZQe5s5eUzJw+O9eK9aaOiUN
frQBqyej29glPisodjtFZZj3CAGB4nnzhvigMjSymyO2kV/3QZgqAiXsu0yHd+1i
/QUofpRwq+RV2VsQXzOqPTZVM+gJDyJaZIyyhFQDdnzFgKKTEmN9HHppSBwcBjRf
Gdm+MOxv9fh7rYMnepwirnSKfxOwRA==
=uLX5
-----END PGP SIGNATURE-----

--Sig_/TtZcBWgKJi_McMQfAYpRcaW--
