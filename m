From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: quota tree build failure
Date: Thu, 22 Jan 2009 15:58:38 +1100
Message-ID: <20090122155838.2d305c1b.sfr@canb.auug.org.au>
References: <20090119130147.b2d85e49.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_Jan_2009_15_58_38_+1100_Bso8fiVqhtQbVrB5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45673 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756613AbZAVE6p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2009 23:58:45 -0500
In-Reply-To: <20090119130147.b2d85e49.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__22_Jan_2009_15_58_38_+1100_Bso8fiVqhtQbVrB5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, 19 Jan 2009 13:01:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> fs/ocfs2/quota_global.c: In function 'ocfs2_dquot_initialize':
> fs/ocfs2/quota_global.c:858: error: implicit declaration of function 'dqu=
ot_is_cached'
> fs/ocfs2/quota_global.c: In function 'ocfs2_dquot_drop':
> fs/ocfs2/quota_global.c:962: error: implicit declaration of function 'dqu=
ot_drop_locked'
>=20
> Immediate cause is commit cc33412fb1f11613e20f9dfc2919a77ecd63fbc4
> ("quota: Improve locking").  If you are going to remove an API, you need
> to fix up the callers.
>=20
> I have dropped the quota tree for today.

Still broken, still dropped.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_Jan_2009_15_58_38_+1100_Bso8fiVqhtQbVrB5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl3/P4ACgkQjjKRsyhoI8xwQQCdHTaP3dRhodRDvhw81jVqUje+
Wy4AoLi7QtYW4fHJwC7SFO7i5oQmxYFb
=KFJJ
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Jan_2009_15_58_38_+1100_Bso8fiVqhtQbVrB5--
