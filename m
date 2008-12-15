From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree
Date: Mon, 15 Dec 2008 15:25:09 +1100
Message-ID: <20081215152509.f19ebaeb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Dec_2008_15_25_09_+1100_Ek6ex4hJsbQkBXJu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58757 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751960AbYLOEZV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Dec 2008 23:25:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@elte.hu>

--Signature=_Mon__15_Dec_2008_15_25_09_+1100_Ek6ex4hJsbQkBXJu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in
sound/drivers/pcsp/pcsp.c between commit
ca109491f612aab5c8152207631c0444f63da97f ("hrtimer: removing all ur
callback modes") from the timers tree and commit
8a75f4fb28766878893b4335f4b5743ce9b931fe ("ALSA: pcsp - Use
HRTIMER_CB_IRQSAFE_UNLOCKED") from the sound tree.

The former removed the line that the latter modified.  I just removed the
line and can carry this fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Dec_2008_15_25_09_+1100_Ek6ex4hJsbQkBXJu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklF3CUACgkQjjKRsyhoI8x2CwCdGONUMD4EMyFf8IlEs6vI3QFG
MFIAnikhunK5TXMq3BvMxWIQxh5H85Es
=XSCy
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Dec_2008_15_25_09_+1100_Ek6ex4hJsbQkBXJu--
