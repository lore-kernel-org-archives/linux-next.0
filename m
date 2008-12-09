From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the lblnet tree
Date: Tue, 9 Dec 2008 11:23:01 +1100
Message-ID: <20081209112301.cd9d5396.sfr@canb.auug.org.au>
References: <20081208184957.ae6f1726.sfr@canb.auug.org.au>
	<200812081438.04489.paul.moore@hp.com>
	<20081208211941.6d2c2261@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_11_23_01_+1100_UtXJcpI5DrpH8O8x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58991 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753662AbYLIAXR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 19:23:17 -0500
In-Reply-To: <20081208211941.6d2c2261@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Paul Moore <paul.moore@hp.com>, linux-next@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

--Signature=_Tue__9_Dec_2008_11_23_01_+1100_UtXJcpI5DrpH8O8x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Mon, 8 Dec 2008 21:19:41 +0100 Jean Delvare <khali@linux-fr.org> wrote:
>
> All in all I don't think it really matters.
> Documentation/feature-removal-schedule.txt will always have conflicts
> by design, but it's only a text file and if it isn't totally up-to-date
> in linux-next, I doubt anybody cares. So I would vote for permanently
> ignoring conflicts to this file.

I still have to do something with the conflicts and fixing them (like
this one) is trivial and "git rerere" remembers them, so carrying them is
also trivial.  And, as you imply, it really doesn't matter if I get one
wrong. :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_11_23_01_+1100_UtXJcpI5DrpH8O8x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk9umUACgkQjjKRsyhoI8yW1ACguQAc4fwhX0nA0hfF2HbY37oB
kLMAnjQ4R8bHP2ZT4IEQQwMqHXtEHl6K
=7kqn
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_11_23_01_+1100_UtXJcpI5DrpH8O8x--
