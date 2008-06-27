From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 16:09:36 +1000
Message-ID: <20080627160936.3a090c33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Jun_2008_16_09_36_+1000_UH.iBe2/9DhfA+Et"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52603 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757179AbYF0GJt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 02:09:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Glauber Costa <gcosta@redhat.com>

--Signature=_Fri__27_Jun_2008_16_09_36_+1000_UH.iBe2/9DhfA+Et
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
arch/x86/kernel/smpboot.c between commit
b9bcb3696f0c121bb0bdbb5cbdde059ee6f95d51 ("x86: change __setup_vector_irq
with setup_vector_irq") from the x86 tree and commit
3b16cf874861436725c43ba0b68bdd799297be7c ("x86: convert to generic
helpers for IPI function calls") from the block tree.

It is merely contextual, and I can carry the fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Jun_2008_16_09_36_+1000_UH.iBe2/9DhfA+Et
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhkhCAACgkQTgG2atn1QN9l6gCfbjVUyT4jqso5uxiZZCFkp4ti
dYoAn1YM1Mgidq05bjeRjHyJOp2O9bNr
=3gXw
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Jun_2008_16_09_36_+1000_UH.iBe2/9DhfA+Et--
