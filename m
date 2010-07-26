From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the kvm tree
Date: Mon, 26 Jul 2010 15:14:05 +1000
Message-ID: <20100726151405.2dfd20ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_Jul_2010_15_14_05_+1000_/srzHoNXwSEnXp_0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36683 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752069Ab0GZFOM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jul 2010 01:14:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>

--Signature=_Mon__26_Jul_2010_15_14_05_+1000_/srzHoNXwSEnXp_0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

arch/x86/kvm/mmu.c: In function 'kvm_mmu_pte_write':
arch/x86/kvm/mmu.c:2908: warning: suggest parentheses around operand of '!'=
 or change '&' to '&&' or '!' to '~'

Introduced by commit af8720393c71a8f81ade71c404798d80c68c5d73 ("KVM: MMU:
add missing reserved bits check in speculative path").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jul_2010_15_14_05_+1000_/srzHoNXwSEnXp_0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMTRmdAAoJEDMEi1NhKgbsN/sH/RDO+nH7EpexxD9rkpDHlfj7
V4Ny8HJzuqOYL4e7t1+ly3QHZ5uJbfqAAAyxINXXN2uG1vQjjsdvCr1JesvpouMV
s88v1WJ8NA5OfA1EptL5VZcM4A2d8M0xFWyE1Ib2h+fLmPgoxpmx+kQK+ZYNdJA6
EPcEPByIoWxM62pzEGDKCIXw/GoyvyWHhG2lm6z6M/v1uFU54fRT4hAWUnavJgp8
p9vZ2aNuDRhnvywqxHmBn4cEt7wzZJVagiB1vCr/VnCGCI+XE6c83qQHujsL+Kl+
CUOHNf7knYX73l8JWb9YKEf6O6e4OzSujVirxuIbuY5jeEWkrvGK9CrP3b2WDDw=
=wxmD
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jul_2010_15_14_05_+1000_/srzHoNXwSEnXp_0--
