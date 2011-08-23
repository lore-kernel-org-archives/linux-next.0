From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (ptrace
 tree related)
Date: Tue, 23 Aug 2011 16:03:09 +1000
Message-ID: <20110823160309.112ad0f4922be8605b61c8dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Aug_2011_16_03_09_+1000_zoBKHHz81cJWFnZT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39329 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751094Ab1HWGDU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Aug 2011 02:03:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Fleming <matt.fleming@intel.com>, David Miller <davem@davemloft.net>

--Signature=_Tue__23_Aug_2011_16_03_09_+1000_zoBKHHz81cJWFnZT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (sparc64 defconfig)
failed like this:

kernel/signal.c: In function 'block_sigmask':
kernel/signal.c:2333:26: error: 'SA_NODEFER' undeclared (first use in this =
function)

Caused by commit 932e5a25b9cf ("signal: Add block_sigmask() for adding
sigmask to current->blocked").  Sparc seems to use SA_NOMASK in the
equivalent bit of code and has no SA_NODEFER definition.

I discovered this after releasing linux-next today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Aug_2011_16_03_09_+1000_zoBKHHz81cJWFnZT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOU0KdAAoJEDMEi1NhKgbsNfYH/3PWyKK7lE8+VJj+rtnrXvmF
Pgf0GBBRLw+Pov7FI5Bu9NIt940rIUQhe7SIfJeKJcPUYwEvPJWhcrxnthMNkOKc
PsT0hSLoMHTGsRvbqpNCs6xSzpPzAhlgbvmyj1tE4tus0PosSYiaKoWG3Lw1QSbQ
hZqTGO9hvPwa7UYtnvL79MXMTccRM+SDeTVryXrM3CHseosndRAZOKRrgwLMdgJp
1Em5V+qsseY66by+Vex/slJbqNeqg4qTHKyimirPxVQiYo134HkukPBEKBnKog8J
vM5weMZMqiR2VMUogzUhjJxBnlGTYPgoMWGjLefbXIvkbYQvS02kosUQintbMDY=
=FnWJ
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Aug_2011_16_03_09_+1000_zoBKHHz81cJWFnZT--
