From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ceph in linux-next
Date: Thu, 22 Oct 2009 13:00:11 +1100
Message-ID: <20091022130011.5bb0981c.sfr@canb.auug.org.au>
References: <Pine.LNX.4.64.0910161411130.12397@cobra.newdream.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_Oct_2009_13_00_11_+1100_rGpX5B9Bs39=wSl6"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0910161411130.12397@cobra.newdream.net>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__22_Oct_2009_13_00_11_+1100_rGpX5B9Bs39=wSl6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sage,

On Fri, 16 Oct 2009 14:17:04 -0700 (PDT) Sage Weil <sage@newdream.net> wrot=
e:
>
> Can you please include the ceph tree in linux-next?=20
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/sage/ceph-client.git for-next

[Needed to be git://git.kernel.org/pub/scm/linux/kernel/git/sage/ceph-clien=
t.git]

> Any problems should be send to me at <sage@newdream.net>.

It will be added to the tree when I next build it (probably Monday).

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

--Signature=_Thu__22_Oct_2009_13_00_11_+1100_rGpX5B9Bs39=wSl6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrfvKsACgkQjjKRsyhoI8zCAACglP29dPviltt0J1v0hKFtiNV9
W7MAmgP4WhqcuOYjjETsBFUTs4Lvyx/v
=zUXN
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Oct_2009_13_00_11_+1100_rGpX5B9Bs39=wSl6--
