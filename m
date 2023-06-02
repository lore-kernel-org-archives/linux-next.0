Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0389AC7EE2A
	for <linux-next@archiver.kernel.org>; Fri,  2 Jun 2023 03:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjFBDEg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Jun 2023 23:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjFBDEf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2023 23:04:35 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CAF1A1;
        Thu,  1 Jun 2023 20:04:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QXSXB5gp1z4x41;
        Fri,  2 Jun 2023 13:04:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1685675068;
        bh=1JqNQPB1skc0KhtqLLunzOOAH0jQqhqPilq+esxsIZA=;
        h=Date:From:To:Cc:Subject:From;
        b=XYB7F1um7xC2FruxeMWEOF1R1ORcWPMmQlznXrFJrbvkVHnumLRDEqt2oRcyxYSEF
         x15nJVSDVIdv+FNbjsJjr+mQYYjAZTt7mG5tqFs9zgF+T+rCummZN4awhePZNA9cqq
         xs/qb0d5RZQtHtq2IFM5ekgRnVxi4WoC+p7wp6v3eVtX2NYe4agPGIQdFJQGKsaQuz
         MnbxGdqABKHR5pPbx11d7cGal8AZ5K4vojYjS6D7dbQhmMXkENBOinBBveyX3qAKoc
         ng4q/nIyuNAAftyoHdVHT26IeEjWxx6bF21j42FT0qqSopYUPcMyJdBv/ysnfuMYsJ
         5AmvXUSEQiIMQ==
Date:   Fri, 2 Jun 2023 13:04:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20230602130423.424e37cd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/geqFl1km2fUgttLcuvUtPpc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/geqFl1km2fUgttLcuvUtPpc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  b7a7ce1bb77b ("vdso/timens: Always provide arch_get_vdso_data() prototype=
 for vdso")

This is commit

  0361c2513d36 ("time_namespace: always provide arch_get_vdso_data() protot=
ype for vdso")

in the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/geqFl1km2fUgttLcuvUtPpc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmR5XDcACgkQAVBC80lX
0Gw5Ugf9FrIU0QQd9ovLOAE7LlQhMKgv/D4wB1RCJXpcjG0U+1XDYasG1E9zIBsh
4f+0e2cUcfZjBL8p3+CJ8J2Dv/kxMtQaCPTLU2Piq9q9qFDNM0loW2Z9TOIisWdu
TZ0vTw0NjFQYD4+SSDeYaxL9VX3868W10Gb9pJGXbt7bc0rlWOTEpQH1804sD+AO
CGoApeE+y7NSOYxUIy7e49fzhRm+ulTicci6uYB5IO7+4bIB7WhWJC2uXZcmTzFP
L6WyW67jp6/L8IdFeutf2vAth8hlSXcfaH69+OgFAw7cet9OUwWc6X6Wxu0YqY8a
n3goDaRERhC6/kfxAjI7+agLOqfycg==
=fFO/
-----END PGP SIGNATURE-----

--Sig_/geqFl1km2fUgttLcuvUtPpc--
