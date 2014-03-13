From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH/RFC 00/16] compat: convert to COMPAT_SYSCALL_DEFINE
Date: Thu, 13 Mar 2014 19:09:44 +0000
Message-ID: <20140313190944.GG366@sirena.org.uk>
References: <1394121083-2507-1-git-send-email-heiko.carstens@de.ibm.com>
 <20140312194526.GA3755@osiris>
 <20140313073230.GA4268@osiris>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="STig1+2QdxPS4TAh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39265 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754593AbaCMTJt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Mar 2014 15:09:49 -0400
Content-Disposition: inline
In-Reply-To: <20140313073230.GA4268@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org


--STig1+2QdxPS4TAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2014 at 08:32:30AM +0100, Heiko Carstens wrote:

> I obviously missed that you are currently handling linux-next, so I sent =
my
> request to Stephen yesterday :)

> Could you add the

>   git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git compat

> to linux-next, please?

OK, I think I did this but it's entirely possible I'm not driving the
scripts correctly so things might explode.  Take a look tomorrow :)  You
should also make sure this is handed over to Stephen when he's back from
vacation next week.

Thanks for adding your subsystem tree as a participant of linux-next.
As you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series
have been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project, Linaro (my employer) and IBM (Stephen's employer) make no
warranties regarding the linux-next project, the testing procedures, the
results, the e-mails, etc.  If you don't agree to these ground rules,
let me know and I'll remove your tree from participation in linux-next.

--STig1+2QdxPS4TAh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTIgJ1AAoJELSic+t+oim9tT4P/RdhVbXZlyGqStXSiHbU1U5G
jBIsa0C2EmvUiDHOnZcawawtjIQ7KP5S905HIgeO/3ICBvvPlhLccQrNvEnlpF1L
RY1wZRg+thbelGJdqcnXupTrPuDb/xf1nSeI1oIQw0HuCPrE0azX0YuzLO1plTrr
PJ2zN21oLy8rKbMTBhupenpa8dN8OJmEkWdswJ3OobgXcW448KaVRFZiByGFgzpj
ZltR0U9GQSWUBPYjjX7i43xUTcn7ZdB3O0jfoefYhNDpH/FUV5kh+oYInFlpB0ci
+EHuV256Y6HvU0HCmQ200ldk/IZP1gkqulogoBpQ/uMsVbGHm13cjHRttCp2yyKU
5tHv8MStFiaEsheKLBXdzD2SujSk7MgoffS55WjCy/vHcRySatYEt7QwgRuYFDvq
Yg5MCispZ1H1n5hoKfvBk26t52AxrbzLtl6qy+k26KNZichxXp4UuRAAOch1y53l
QP2PzDzO7MM7HIs/JqRrUM2GY5kmJiLZdStj2Jpdb+kKeMSyxOAdm9Zf5oOKBzJw
M+Qv/2eZTZGjdZqsx3RmDZHCmHdspUPMkxVlrMfU7PdbfE17iDILYKzzVyiecT41
7VfSF48humtzcOi7sgWEFnM0/07SupKu3I7k/E0vplRhryLu4O441lK1aAAhAsUg
OuG9QTBh24GaIbYmOuWx
=gF+W
-----END PGP SIGNATURE-----

--STig1+2QdxPS4TAh--
