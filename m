From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the sh tree
Date: Mon, 13 Jul 2009 15:52:28 +1000
Message-ID: <20090713155228.89bc9a24.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__13_Jul_2009_15_52_28_+1000_VIkxR_FryPW=_cGs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37264 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751000AbZGMFwf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jul 2009 01:52:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Abbott <tabbott@ksplice.com>

--Signature=_Mon__13_Jul_2009_15_52_28_+1000_VIkxR_FryPW=_cGs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/sh/kernel/vmlinux.lds.S between commit
2802e34590f290173a3f2aa5a4d662ae5373b420 ("sh: Clean up linker script
using new linker script macros") from the sh tree and commit
023bf6f1b8bf58dc4da7f0dc1cf4787b0d5297c1 ("linker script: unify usage of
discard definition") from the percpu tree.

It looks like the latter is a superset of the former, so I used it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__13_Jul_2009_15_52_28_+1000_VIkxR_FryPW=_cGs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpay5wACgkQjjKRsyhoI8xgTQCgvHFxyoMKnTIsJAGKVJghX0Ql
udkAoL3TC0hsGQMOj0GhPkZHcy/xefjt
=fxSw
-----END PGP SIGNATURE-----

--Signature=_Mon__13_Jul_2009_15_52_28_+1000_VIkxR_FryPW=_cGs--
