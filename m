From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: FS-Cache fixes for IA64 export and AFS linkage
Date: Mon, 19 Jan 2009 10:45:39 +1100
Message-ID: <20090119104539.06511073.sfr@canb.auug.org.au>
References: <16871.1232172044@redhat.com>
	<4973BB3F.8090702@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_Jan_2009_10_45_39_+1100_EweFNL.4s5Fs_cLD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50351 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752652AbZARXpv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 Jan 2009 18:45:51 -0500
In-Reply-To: <4973BB3F.8090702@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Howells <dhowells@redhat.com>, Trond Myklebust <Trond.Myklebust@netapp.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, linux-ia64 <linux-ia64@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Kyle McMartin <kyle@mcmartin.ca>, Tony Luck <tony.luck@intel.com>

--Signature=_Mon__19_Jan_2009_10_45_39_+1100_EweFNL.4s5Fs_cLD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Jan 2009 15:29:03 -0800 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> David Howells wrote:
> > I've dropped the patch to export copy_page() for IA64 from my patchset =
and
> > updated the AFS patch so that it no longer produces link errors if
> > CONFIG_AFS_FS=3Dy and CONFIG_FSCACHE=3Dm but CONFIG_AFS_FSCACHE=3Dn.
> >=20
> > These patches are now available as:
> >=20
> > 	http://people.redhat.com/~dhowells/fscache/patches/nfs+fscache-44.tar.=
bz2
> >=20
> > and I've updated my GIT tree for Trond to pull:
> >=20
> > 	http://git.kernel.org/?p=3Dlinux/kernel/git/dhowells/linux-2.6-nfs-fsc=
ache.git;a=3Dshortlog
>=20
> Ack.  Builds for me.  Thanks.

And it will be in today's linux-next, since Trond has merged it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_Jan_2009_10_45_39_+1100_EweFNL.4s5Fs_cLD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklzvyMACgkQjjKRsyhoI8y26QCgkuxCvkhMKtQA1OqDO2qrhVWF
PakAoLerLyMvqVAFewwreTcIdg+fuu85
=Emze
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Jan_2009_10_45_39_+1100_EweFNL.4s5Fs_cLD--
