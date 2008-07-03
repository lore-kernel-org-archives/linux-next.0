From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: generic-ipi tree build failure
Date: Thu, 3 Jul 2008 17:38:06 +1000
Message-ID: <20080703173806.c596ff13.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_17_38_06_+1000_BJ//F4xW+OW8MdKy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53600 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S937017AbYGCHiN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 03:38:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Eduardo Habkost <ehabkost@redhat.com>

--Signature=_Thu__3_Jul_2008_17_38_06_+1000_BJ//F4xW+OW8MdKy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo, Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/mm/init_64.c: In function 'set_pte_vaddr':
arch/x86/mm/init_64.c:153: error: 'pud_page' undeclared (first use in this =
function)
arch/x86/mm/init_64.c: At top level:
arch/x86/mm/init_64.c:188: error: redefinition of 'set_pte_vaddr'
arch/x86/mm/init_64.c:148: error: previous definition of 'set_pte_vaddr' wa=
s here

Caused by commit f2ff8984179fe447fc991c34718652e3079e6236 ("x86, 64-bit:
split set_pte_vaddr()") in combination with commit
c7f5cf4f8d53cbf0cf787c95221b34cd91794e4d ("manual merge of
generic-ipi-mergefixups").

I reverted the former commit which makes it build, but is probably not
correct.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_17_38_06_+1000_BJ//F4xW+OW8MdKy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsgd4ACgkQjjKRsyhoI8yYggCgo4LzCi3aGIrxWo6o4dQbyYlM
pHwAn0rkODYherpGgobSmJG7a9gnKfvq
=FJCB
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_17_38_06_+1000_BJ//F4xW+OW8MdKy--
