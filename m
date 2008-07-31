From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Thu, 31 Jul 2008 12:59:56 +1000
Message-ID: <20080731125956.ae7066f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Jul_2008_12_59_56_+1000_64LXpyaABnxjri3q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45507 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760439AbYGaDAF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 23:00:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Jack Steiner <steiner@sgi.com>

--Signature=_Thu__31_Jul_2008_12_59_56_+1000_64LXpyaABnxjri3q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
arch/x86/kernel/genapic_64.c between commit
0d39741a27d86d305cc75ba626392be410dcbab9 ("GRU Driver: export is_uv_system
(), zap_page_range() & follow_page()") from Linus' tree and commit
1b9b89e7f163336ad84200b66a17284dbf26aced ("x86: add apic probe for
genapic 64bit, v2") from the x86 tree.

The former exported a function (is_uv_system) that the latter moved.  I
did the export in the new file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Jul_2008_12_59_56_+1000_64LXpyaABnxjri3q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiRKqwACgkQjjKRsyhoI8x7mgCfemXOQFFzJ5zhbQcYl7G5I9li
2doAn244rOoEvft1GOv9hmFXTrXF/EDv
=GGgH
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Jul_2008_12_59_56_+1000_64LXpyaABnxjri3q--
