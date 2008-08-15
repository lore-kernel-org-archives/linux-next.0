From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the fastboot tree
Date: Fri, 15 Aug 2008 17:44:15 +1000
Message-ID: <20080815174415.985eb69c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_17_44_15_+1000_CmgYHpu/paGAS64J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38648 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751753AbYHOHoZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 03:44:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Dave Hansen <haveblue@us.ibm.com>, Greg KH <greg@kroah.com>

--Signature=_Fri__15_Aug_2008_17_44_15_+1000_CmgYHpu/paGAS64J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next merge of the fastboot tree got a trivial conflict in inc=
lude/linux/init.h between commit 95fc5687f58152d62904e7dea36dca3a52514160 (=
"Dave Hansen <haveblue@us.ibm.com>") from the driver-core tree and commit a=
06e1c2b448b317bc141934879cbbbed8319b4d4 ("modules: extend initcall_debug fu=
nctionality to the module loader") from the fastboot tree.

Just overlapping additions.  I fixed it up and will carry the fix.

[I have been asked to try adding the merge result diff, so just as a test
I have included it below.]

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/init.h
index de1d690,b6201c0..0000000
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@@ -143,7 -143,8 +143,9 @@@ extern int do_one_initcall(initcall_t f
  extern char __initdata boot_command_line[];
  extern char *saved_command_line;
  extern unsigned int reset_devices;
 +extern int initmem_now_dynamic;
+ extern int do_one_initcall(initcall_t fn);
+=20
 =20
  /* used by init/main.c */
  void setup_arch(char **);

--Signature=_Fri__15_Aug_2008_17_44_15_+1000_CmgYHpu/paGAS64J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilM88ACgkQjjKRsyhoI8ynCgCdH4QkgNv8oG7abCYvQF8yDZXd
N+sAn0bE8zEDNJbNasDGabGMg0viD0Me
=lM8G
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_17_44_15_+1000_CmgYHpu/paGAS64J--
