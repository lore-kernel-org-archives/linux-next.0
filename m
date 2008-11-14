From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build failure
Date: Fri, 14 Nov 2008 14:56:30 +1100
Message-ID: <20081114145630.31f312ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_14_56_30_+1100_K2XH1Xu.Gc_K1n.U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33894 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751345AbYKND4m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 22:56:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__14_Nov_2008_14_56_30_+1100_K2XH1Xu.Gc_K1n.U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

sound/drivers/pcsp/pcsp.c: In function 'snd_card_pcsp_probe':
sound/drivers/pcsp/pcsp.c:99: error: 'HRTIMER_CB_IRQSAFE' undeclared (first=
 use in this function)

That identifier does not exist anywhere else in my tree.  It was removed
by commit 621a0d5207c18012cb39932f2d9830a11a6cb03d ("hrtimer: clean up
unused callback modes") which is now in Linus' tree (as of yesterday).

I'll drop the sound tree for today and hope it will be fixed for Monday.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_14_56_30_+1100_K2XH1Xu.Gc_K1n.U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkc9u8ACgkQjjKRsyhoI8xJ0wCguCcRFqg0yI1FLbwX4b2GUrOl
9NMAnijMalKxCCKmZDdHYjYaOBVTlZ9k
=wwft
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_14_56_30_+1100_K2XH1Xu.Gc_K1n.U--
