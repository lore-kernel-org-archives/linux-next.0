From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next inclusion request: OpenRISC architecture
Date: Sat, 16 Jul 2011 13:55:37 +1000
Message-ID: <20110716135537.a95c726478813f4b45d97a5a@canb.auug.org.au>
References: <1309641352-18714-1-git-send-email-jonas@southpole.se>
	<201107051756.33424.arnd@arndb.de>
	<1309967491.3393.41.camel@jerome>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__16_Jul_2011_13_55_37_+1000_N9Zk8Ddur0Is3hCl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55316 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752240Ab1GPDzu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jul 2011 23:55:50 -0400
In-Reply-To: <1309967491.3393.41.camel@jerome>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonas Bonn <jonas@southpole.se>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org

--Signature=_Sat__16_Jul_2011_13_55_37_+1000_N9Zk8Ddur0Is3hCl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Wed, 06 Jul 2011 17:51:31 +0200 Jonas Bonn <jonas@southpole.se> wrote:
>
> On Tue, 2011-07-05 at 17:56 +0200, Arnd Bergmann wrote:
> > IMO it would be best if Stephen added that branch to linux-next right
> > away, so we get some test exposure on your common code changes before
> > the merge window.
> >=20
>=20
> I'd like to request the inclusion of the OpenRISC architecture kernel
> tree into the linux-next repository.  The relevant branch is the
> 'for-upstream' branch of the repository at:
>=20
> git://openrisc.net/jonas/linux

I will include that tree in the next linux-next release.

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

--Signature=_Sat__16_Jul_2011_13_55_37_+1000_N9Zk8Ddur0Is3hCl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOIQu5AAoJEDMEi1NhKgbsFagH/1b0oVVs0fc0E0GoKvXf7QUW
XTuXvIjScQkIuDt803pVKaGTzwH7ZhXA4BZG4J6nZT+bpR/gBjlJzAGYrwFZR2Af
XpNcRAuFbBI40E+iT+FJ/lfyaFapGKoBRyIPuRtttqL4tVA46nqsrzU16q7ehqPl
1egGoThgJHFW2OymEqpUq0Jd+YtQHMqrpXrMaWNGoyiLD1A3DQ7HJGeGznMO+MxB
ePmRkxXcw7HUFWvjMS94iJ/oib9gg3S2qpWXFEei8VnUqz3IA95OvkFPFEym6j/a
jTNeC0wWWaJLMaKjx4GVeFuTtTa0/fwDvaOwW7lSBPUFAUfK9FgM66JyV+okw2k=
=mlMI
-----END PGP SIGNATURE-----

--Signature=_Sat__16_Jul_2011_13_55_37_+1000_N9Zk8Ddur0Is3hCl--
