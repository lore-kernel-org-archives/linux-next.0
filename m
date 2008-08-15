From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Fri, 15 Aug 2008 16:45:12 +1000
Message-ID: <20080815164512.3f36d7a6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_16_45_12_+1000_z4gJjqZ4Rms/m4B5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41530 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751393AbYHOGpX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 02:45:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, "Gustavo F. Padovan" <gustavo@las.ic.unicamp.br>

--Signature=_Fri__15_Aug_2008_16_45_12_+1000_z4gJjqZ4Rms/m4B5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/kernel/process_64.c between commits
8092c654de9a964c14d89da56834f73a80548a58 ("x86: add KERN_INFO to printks
on process_64.c") and 7de08b4e1ed8d80e6086f71b7e99fc4b397aae39 ("x86:
coding styles fixes to arch/x86/kernel/process_64.c") from the x86 tree
and commit afdb7023b849cffda679fcec324ff592d7b24a51 ("x86:
__show_registers() and __show_regs() API unification") from the kmemcheck
tree.

I fixed them up as was pretty obvious.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_16_45_12_+1000_z4gJjqZ4Rms/m4B5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilJfgACgkQjjKRsyhoI8xwxACfUbW8wuSjukrV0z9aUsMybrJd
xlEAnjM6QMK2j7PIEwXB1aKGY7Wr9/IB
=rdn+
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_16_45_12_+1000_z4gJjqZ4Rms/m4B5--
