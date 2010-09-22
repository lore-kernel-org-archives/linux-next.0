From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: New tree to be added on linux-next
Date: Thu, 23 Sep 2010 08:34:06 +1000
Message-ID: <20100923083406.3c970103.sfr@canb.auug.org.au>
References: <4C99FBF9.3060606@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Sep_2010_08_34_06_+1000_aooyQ=kQ.lmS/jOM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51890 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751029Ab0IVWeP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Sep 2010 18:34:15 -0400
In-Reply-To: <4C99FBF9.3060606@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, Linux Edac Mailing List <linux-edac@vger.kernel.org>

--Signature=_Thu__23_Sep_2010_08_34_06_+1000_aooyQ=kQ.lmS/jOM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Wed, 22 Sep 2010 09:52:09 -0300 Mauro Carvalho Chehab <mchehab@redhat.co=
m> wrote:
>
> Please add the edac.git tree to linux-next:
>=20
> ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/edac.git linux_n=
ext
>=20
> It currently contains a new driver for i7300_edac.

Added from today.  I called it i7300_edac (I now have 3 edac trees, this
one, i7core_edac and edac-amd).

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

--Signature=_Thu__23_Sep_2010_08_34_06_+1000_aooyQ=kQ.lmS/jOM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMmoReAAoJEDMEi1NhKgbsWskH/3wKSmwymGws5F3Iu7Unmn7N
BTvEr8jpukXhQjjuZz6hSC07/L0n4B9bFQlGFkCH0owvJn+KEClp8sriTrDesIJE
0mBBLE5Q9YTynU6eMB0oIJ6fvI3G7K1+h/j76GEdQL0noDlIQF5Lxn8bS5e2jiou
48jhYKw+UAJ3d5KlmA9dswBBhxG/C0Khm+ZUTOUEpESl0cVsFf11Bat4QVITa8mz
muijKZtpExkXV2btShPTVqMwOD1po9LeM84H1BxhMgvijzkFsRt6iZhjKdJIgCvF
dlvzzZICAFNa13cELEoFVsKurZ1yYu2TdZHx4wSA6TRDtxnzpj/4a58omB3lWLg=
=tMB0
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Sep_2010_08_34_06_+1000_aooyQ=kQ.lmS/jOM--
