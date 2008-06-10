From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip-core merge conflict
Date: Tue, 10 Jun 2008 14:51:16 +1000
Message-ID: <20080610145116.6bc5b0ad.sfr@canb.auug.org.au>
References: <20080610120857.042ea0f1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Jun_2008_14_51_16_+1000_xcwGuy528CfoT9Fc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35372 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751234AbYFJEvY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 00:51:24 -0400
In-Reply-To: <20080610120857.042ea0f1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Tue__10_Jun_2008_14_51_16_+1000_xcwGuy528CfoT9Fc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Jun 2008 12:08:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's merge of the tip-core tree got a trivial conflict in
> include/asm-generic/vmlinux.lds.h between commit
> f1cb2ba8ca4a8b4b76bbf0b795375af52442501b ("generic: add
> OUTPUT_DATA_SECTION to vmlinux.lds.h") from the kbuild-current tree and
                                                  ^^^^^^^^^^^^^^
That should say "the kbuild tree".

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jun_2008_14_51_16_+1000_xcwGuy528CfoT9Fc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhOCEQACgkQTgG2atn1QN8FeACeNyPRS2QGh9GzU1NqVTvFOg9Q
ZBkAn1M9oCmuMrPlbr91KcU5kH/c5psF
=ZMDE
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jun_2008_14_51_16_+1000_xcwGuy528CfoT9Fc--
