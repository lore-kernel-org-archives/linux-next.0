From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next tree request
Date: Sat, 22 Aug 2009 10:48:11 +1000
Message-ID: <20090822104811.a7023a4d.sfr@canb.auug.org.au>
References: <alpine.DEB.2.00.0908212030140.604@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__22_Aug_2009_10_48_11_+1000_xvDfXn.1=Nimmhn0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33325 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933016AbZHVBRn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Aug 2009 21:17:43 -0400
In-Reply-To: <alpine.DEB.2.00.0908212030140.604@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>

--Signature=_Sat__22_Aug_2009_10_48_11_+1000_xvDfXn.1=Nimmhn0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Fri, 21 Aug 2009 20:33:19 -0400 (EDT) Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> Here's my request for getting a tree into next.
>=20
> Git repo:=20
>=20
>  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.=
git
>=20
> Branch: for-next
>=20
> Name: Kconfig
>=20
> Contact: rostedt@goodmis.org

That looks fine.  I'll ad it Monday unless you tell me otherwise.  Here
is the boilerplate:

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

--Signature=_Sat__22_Aug_2009_10_48_11_+1000_xvDfXn.1=Nimmhn0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqPQEsACgkQjjKRsyhoI8xdFQCfTKhZYlnRMNFYGp6tpzQVgITG
5SQAn1yT7sDhi2bbWxU1YudOhZKeivDU
=3x2p
-----END PGP SIGNATURE-----

--Signature=_Sat__22_Aug_2009_10_48_11_+1000_xvDfXn.1=Nimmhn0--
