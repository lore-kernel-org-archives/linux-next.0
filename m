From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request to add linux-leds git tree to linux-next
Date: Mon, 4 Jun 2012 11:42:23 +1000
Message-ID: <20120604114223.c4eba75b98b8661eb6347665@canb.auug.org.au>
References: <CAK5ve-JqwHcmPGkG-_=3y9PiMo_QrFe-2tt-8aNMarzF7JxVMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__4_Jun_2012_11_42_23_+1000_oVWI0VZchkOe1yAz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:40442 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755463Ab2FDBmd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Jun 2012 21:42:33 -0400
In-Reply-To: <CAK5ve-JqwHcmPGkG-_=3y9PiMo_QrFe-2tt-8aNMarzF7JxVMg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bryan Wu <bryan.wu@canonical.com>
Cc: linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>, linux-leds@vger.kernel.org

--Signature=_Mon__4_Jun_2012_11_42_23_+1000_oVWI0VZchkOe1yAz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

On Fri, 1 Jun 2012 22:08:12 +0800 Bryan Wu <bryan.wu@canonical.com> wrote:
>
> Please help to add for-next branch of my linux-leds git tree into linux-n=
ext:
> git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git for=
-next

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Mon__4_Jun_2012_11_42_23_+1000_oVWI0VZchkOe1yAz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPzBJ/AAoJEECxmPOUX5FEv7IP/1DPy59cICrv1cJLYUDQQx21
gIuR0AamqktORGWhH0jwtrUjAp/I3K8RVkLLEkTix3mY0k8a3rS8B21EV8rChfZQ
XeV/KoZcSxZEqFLDSvIRtgGLUhooSDqsl0UUqjYFSsaTCJ+XGc9uIv6qpxjlc2IQ
RmEU37Tin3WEZysbM6tgakFXs31w/4+E02DbTr2vi9DfR4a8a6XDxdU9vptexlBC
V5ZGXkpwvK3TjUFGhFRR7F4dpZzVyRUJWhJcEV84WcRMl4DyEwrZNsor7V3BPOmY
PzPdFCu9BHXbK98oNRp1j3fBqlgBXtBoWiCBNASqT38noQ7sppmAiYnGK7ubFrRY
IfUjAF0DkiOZvpZjJ5p439eM1BLmDqzjmWMQi5N527xslhGFKoEyTE7fFASPmCjs
o9P7FBzENmfCzUld6dwHxoNpkJWA4Mk9wp45DzWN3ESh+kpNacVLWGHpRG/GUbxp
TEP0QE7Zjc5E6VSdzpbXXFmWf1SDjX0VUmKLwHfqz+sc4AQNQwDu6PsFX0Mfc0x4
bvsNybrqDv5FZpBIER/DnAT7MAhdW2IzvLu9B/tY5AsXPPD4M2ARhH01fOhvtQKX
11F2B2295cPpmctrgGn8cBbjs0gTkhyJBBHAR7/ZitwY1JlZrKoamk9hqIM6x8pQ
6Cn8iFncwpQa44K538U+
=k+4/
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Jun_2012_11_42_23_+1000_oVWI0VZchkOe1yAz--
