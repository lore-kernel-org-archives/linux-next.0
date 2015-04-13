From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Mon, 13 Apr 2015 20:39:17 +1000
Message-ID: <20150413203917.1e7ea535@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+Y4vA6w/BwMbmwmg_.s/Exl"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36844 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753961AbbDMKjY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 06:39:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>

--Sig_/+Y4vA6w/BwMbmwmg_.s/Exl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

After merging the rcu tree, today's linux-next build (powerpc allnoconfig)
failed like this:

init/main.c: In function 'rest_init':
init/main.c:387:2: error: implicit declaration of function 'smpboot_thread_=
init' [-Werror=3Dimplicit-function-declaration]
  smpboot_thread_init();
  ^

Caused by commit c55f6e1f6f69 ("cpu: Defer smpboot kthread unparking
until CPU known to scheduler").  The declaration in include/linux/cpu.h
is protected by CONFIG_SMP, its use is not.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/+Y4vA6w/BwMbmwmg_.s/Exl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK5zZAAoJEMDTa8Ir7ZwVH2gQAICeQiX8ujlHigE+NRPpDkov
1t/O1NEfF6vzWezDdKhZ9khaOT8mIHUOCwPrS1fZi1EU3sYdAIbVl5LwCYJhvVhX
rYHVhouj8uQ5NcojBZhPN09GkzfxGHRY8DLXWPA9EOocjCIZTDerU7+Fp0nQbnYD
f2QC078Zzn1/kX2JLmzMXUu+9suFIqF+A4hhOosXJIC207yRlKGwRPgi07/Ccghi
QVVXVBmOdlw06J3/HYlzP+AMWHMnlTJ00VV+XUQQFE2IX1MsXT1LtQBfcZErJuBZ
Zlp3yK7wuvTrDTSjXE+yxhL0FG0vpLwLmm4dVgpShlSOwE7s6xJgEte9S6qaQNqi
XTGlHflrbuJ/1dzxweBJlqNLhg/7LM6IQoePRvzWbCL/j5tX49DFET22gJqiLx2g
ZpeBxkchRZVsXOcsdjWZ6PKwhOr8HhMfSBmtgQTYTKJvC/4i/8xmZRzm59Pz6Z31
xzbqDRe3qJAElg0n8+LMhFnG+lE55298/0zQv013SqiHMvaMdBHB6oNHMXbD8l8p
/xMp4ACoUZ0ky7BtLAXT8GZfq5Cqq9sMuxK7LdVp5hctTVcV0KifJMnZVm14Pt5v
9lfIcWwXburPkNU3FHXfdDU+xGhCaXcEgArhpHFV+NiQbOlS1NpIpd5SVybGSRMz
lhThFPCI8ox7RfAx32BJ
=l+Ya
-----END PGP SIGNATURE-----

--Sig_/+Y4vA6w/BwMbmwmg_.s/Exl--
