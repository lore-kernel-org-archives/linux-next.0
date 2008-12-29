From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the creds tree
Date: Mon, 29 Dec 2008 15:06:45 +1100
Message-ID: <20081229150645.98f2000f.sfr@canb.auug.org.au>
References: <20081030154741.2651e779.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_15_06_45_+1100_l_o+3G=vtz+YJKg8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38471 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752255AbYL2EGw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 23:06:52 -0500
In-Reply-To: <20081030154741.2651e779.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, Lachlan McIlroy <lachlan@sgi.com>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>

--Signature=_Mon__29_Dec_2008_15_06_45_+1100_l_o+3G=vtz+YJKg8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 30 Oct 2008 15:47:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the creds tree got conflicts in
> fs/xfs/linux-2.6/xfs_cred.h, fs/xfs/linux-2.6/xfs_globals.h and
> fs/xfs/xfs_vnodeops.h between commit
> 959f0f5b48d25a478694e04d024cd1ca681ea4bf ("[XFS] kill sys_cred") from the
> xfs tree and commit 3634a8a33b2cd7296e265d01d606b58c22b6a557 ("CRED:
> Separate task security context from task_struct") from the creds tree.
>=20
> The former mostly removed what the latter changed.  I fixed it up (see
> below - I just removed the "extern cred_t *sys_cred;" from xfs_globals.h
> and the cred_t arguments to xfs_setattr and xfs_change_file_space in
> xfs_vnodeops.h) and can carry the fix.

These conflicts are now between the xfs tree and Linus' tree and so could
be sorted out by merging Linus' tree into the xfs tree before asking
Linus to pull the xfs tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_15_06_45_+1100_l_o+3G=vtz+YJKg8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYTNUACgkQjjKRsyhoI8x16wCaA+lnqDJUeIkQt97mfdHoMX3N
KZkAnRWwrhgZlMpUpcYAQCj4o8xUnxax
=Yh0N
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_15_06_45_+1100_l_o+3G=vtz+YJKg8--
