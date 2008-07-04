From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 4 Jul 2008 13:50:21 +1000
Message-ID: <20080704135021.e771e091.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_13_50_21_+1000_Y3U2dA1_lGRUnb=P"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44516 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752159AbYGDDu2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 23:50:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Andi Kleen <andi@firstfloor.org>

--Signature=_Fri__4_Jul_2008_13_50_21_+1000_Y3U2dA1_lGRUnb=P
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
drivers/base/topology.c between commit
5b01a6a61c48d8e6ab4679d6e6208f5962d07b85 ("sysdev: Pass the attribute to
the low level sysdev show/store function") from the driver-core tree and
commit 29657a44f8660acd8751d7e9f5aac06ec8633481 ("x86: cleanup early per
cpu variables/accesses v4") from the x86 tree.

I took the driver-core versions but uninlined them (as was done in the
x86 tree version).  Someone should probably check the result.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_13_50_21_+1000_Y3U2dA1_lGRUnb=P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhtnf0ACgkQjjKRsyhoI8wJnwCfctFfm/Sie6EZ9uuSvSR18BuW
76kAnRHVWwrKspFvHzbO4bOC4annKqk/
=NK8B
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_13_50_21_+1000_Y3U2dA1_lGRUnb=P--
