From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree
Date: Mon, 4 Aug 2008 11:08:20 +1000
Message-ID: <20080804110820.626f27df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__4_Aug_2008_11_08_20_+1000_XxeiE3Llt+GxyZXH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46710 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752992AbYHDBIc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Aug 2008 21:08:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

--Signature=_Mon__4_Aug_2008_11_08_20_+1000_XxeiE3Llt+GxyZXH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
include/asm-generic/vmlinux.lds.h between commit
c6de002617c199f80f9a2a713dffc263bdc69b81 ("Missing symbol prefix on
vmlinux.lds.h") from Linus' tree and commit
d3794979a8a80c222ce9d016a6dfc4bed36965d0 ("Zero based percpu:
infrastructure to rebase the per cpu area to zero") from the tip-core
tree.

Just simple overlapping changes,  I fixed it up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__4_Aug_2008_11_08_20_+1000_XxeiE3Llt+GxyZXH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiWVoQACgkQjjKRsyhoI8w+TQCfVYIhWU7mkMcPP93f8eU732je
fwwAnj57Oc+2DSYC7bluj7/eFdN8N4r6
=2xHA
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Aug_2008_11_08_20_+1000_XxeiE3Llt+GxyZXH--
