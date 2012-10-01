From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL] Btrfs for linux-next
Date: Mon, 1 Oct 2012 18:15:49 +1000
Message-ID: <20121001181549.817cc2d7d0d660eb593922fd@canb.auug.org.au>
References: <20120930115258.GA13506@shiny>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__1_Oct_2012_18_15_49_+1000_UXYKxovWNWec8nos"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:36123 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217Ab2JAIP6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Oct 2012 04:15:58 -0400
In-Reply-To: <20120930115258.GA13506@shiny>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Mason <chris.mason@fusionio.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__1_Oct_2012_18_15_49_+1000_UXYKxovWNWec8nos
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Sun, 30 Sep 2012 07:52:58 -0400 Chris Mason <chris.mason@fusionio.com> w=
rote:
>
> This is our large queue of changes for linux-next.  They vary from bug
> fixes to huge optimizations.  It also includes a new disk format feature
> from suse to remove a restriction on the number of hardlinks to a single
> file in a single dir.
>=20
> I tested against linux-next on Friday, it was a clean merge and passes
> xfstests.
>=20
> Just let me know if there are any problems, thanks!  The changes are in
> my next branch
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.git next

I added your tree today, but as you have seen it broke :-(

Normally I would just go back to the previous days tree, but this is your
first day, so I just dropped it.  I will try again tomorrow (hopefully it
will be fixed by then).

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

--Signature=_Mon__1_Oct_2012_18_15_49_+1000_UXYKxovWNWec8nos
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQaVE1AAoJEECxmPOUX5FEeoQP/2FEoEamg/QFhdqHuW3kz6Ez
kWXP8eLSMwdnJosb+pZf2qVJjm+cQ5YV5U4rUFk2OFOnYA5dTIJgsuaOWGn49v3P
qVhMXgH5zSpykGEYWIfaJvZvv4Mbu5pN1V4Huw0UMpIt4aOyJ8EV7foV/XIZ1zI7
i/mKuPIMlPz/Fe1E2SemhG3U3sT6RcOIJzdMsPQ0/1OjOHhLgLtdzP0Rz1I1PRj4
bLz62bRUljHXF8sXhURQjHI6Bl3xMEGFhxkwQqEkNirYetLdJ1J4UEhjPJHfZr7a
D5FXTNrtOFynQwTdQH+TPea2MoylZbUJ96otjv51nLMGeIrnMb4XA6f2q/4mAaQH
VPZXTRoX4gdeczzYcme9zIbYFmgpJ02lpZqgqMSNpshWG85EZYgz1k9IkSzVkvTB
XrheD6wCE5Ai2egvobCoO9sPeheLKdhS+ISlDqXExM2QxME/c/wO153jXlpRiE/o
Mohtk0II4I+qQAMJScOV/z0jyImav1n0abl2iTCv/5vastmhcc3TycR2CF8H05wM
AVIlRmemxccBIwCnZvM24n9vhBfyIDPc5Rb57qsCYb3/XFCWG+BXK98kd9RvrA6f
dF5uEXhpVWRQPuPc2zoztZwzLgqgza2sVPtQEA5DPPisuecEbedX9OSe+un81Con
+435ccPRsFOmLDBnGuO3
=ZQcR
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Oct_2012_18_15_49_+1000_UXYKxovWNWec8nos--
