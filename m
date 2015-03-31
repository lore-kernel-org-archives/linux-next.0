From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Tue, 31 Mar 2015 18:10:55 +1100
Message-ID: <20150331181055.1fab7efd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_RoYY281IN=Qhlbhv7/jUlT"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45751 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbbCaHLE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 03:11:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

--Sig_/_RoYY281IN=Qhlbhv7/jUlT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/arm/common/bL_switcher.c between commit bf03f36d239f ("arm:
bl_switcher: Kill tick suspend hackery") from the pm tree and commit
77e32c89a711 ("clockevents: Manage device's state separately for the
core") from the tip tree.

I fixed it up (the former removed all the code changed by the latter)
and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/_RoYY281IN=Qhlbhv7/jUlT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGkiEAAoJEMDTa8Ir7ZwVEZQP/2T9Hdz0cdOJEV+bWXg9C1Tf
h1Q75M8j1JK9ocItWY//5aoj3J+aCKjW4DYqXbmp2MYe7apK0BiXkoZ8cN1bwYIk
kK9567NMRV2j0O2Wg+FxvWGaZy6F6b0WmpxYl0fs4WNU6Mq8xYZnDpU+bEk1tu6H
Zj7KDGPqok2gTWXvd2DOy2htkk1vXFq15GZ424eEPX3rMxSTQ7UsIYcEkxU8wONI
sesCCmEB00oy9bOJlr6uNxPvdMRgHKBhRqiqCae+9vVoXpnbhwujTaFvLobMUgYH
nehkrKBqWpu/5io61ca56kJiV3WY4lAhYnTBGNwXcROhl/O9AxoCI0vOk7+2dob9
LgFbmkP0OU3xbhuBlIBfnevGHk6GR1fzZTl5zQ+yeqsx5B+mG28ZVb9CDMePCOSf
sjCEZ69SYctvXwurj93P81hnQrelz+mNb3aVAkyJBqTwiQDnzq0f1LNd/omy1aXE
ShjJP2wL/t9z9s0LtFq3sfOfxn/aluM02g7fa680K97a506uaG4MQuyIFN/gvhcy
dCSXc9HfZQ+BiyHzfQeuy4wNRKPTj6nzlLuuMH6oqcKfmOpzrOoguX1N4Ya5GVUU
8aDcWWnwnCoVi8wbX+tZp+STYki3nSPvcA8TnZC1WC6GaQddo/PNxVKk+NFt0Se3
1okcaxYsATpcUFjbtK1I
=FoY8
-----END PGP SIGNATURE-----

--Sig_/_RoYY281IN=Qhlbhv7/jUlT--
