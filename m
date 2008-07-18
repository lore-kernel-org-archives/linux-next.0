From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree
Date: Fri, 18 Jul 2008 19:44:06 +1000
Message-ID: <20080718194406.1484a22c.sfr@canb.auug.org.au>
References: <20080718152758.2b6bc862.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_19_44_06_+1000_9P28g9oPJBpi/MKp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46275 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753984AbYGRJoO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 05:44:14 -0400
In-Reply-To: <20080718152758.2b6bc862.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Miklos Szeredi <mszeredi@suse.cz>

--Signature=_Fri__18_Jul_2008_19_44_06_+1000_9P28g9oPJBpi/MKp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Fri, 18 Jul 2008 15:27:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the vfs tree got a conflict in
> security/dummy.c between commit 5915eb53861c5776cfec33ca4fcc1fd20d66dd27
> ("security: remove dummy module") from the  tree and commit
                                         ^^^^^^^^^
Linus' tree

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_19_44_06_+1000_9P28g9oPJBpi/MKp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAZeYACgkQjjKRsyhoI8woWgCgsa4SLAO28ekPehsl3flArKkG
f9cAoL2Cs48N/t/qDjQwQ4VlLGh5Jvtq
=4aNM
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_19_44_06_+1000_9P28g9oPJBpi/MKp--
