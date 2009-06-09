From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the  tree
Date: Tue, 9 Jun 2009 17:27:29 +1000
Message-ID: <20090609172729.0217dfd2.sfr@canb.auug.org.au>
References: <20090609110815.0abd1de0.sfr@canb.auug.org.au>
	<E1MDvHY-0006N1-06@pomaz-ex.szeredi.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Jun_2009_17_27_29_+1000_G+CRR8zfKwutohg2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49634 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756240AbZFIH1m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 03:27:42 -0400
In-Reply-To: <E1MDvHY-0006N1-06@pomaz-ex.szeredi.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: viro@ZenIV.linux.org.uk, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tj@kernel.org, vapier@gentoo.org

--Signature=_Tue__9_Jun_2009_17_27_29_+1000_G+CRR8zfKwutohg2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI Miklos,

On Tue, 09 Jun 2009 08:58:04 +0200 Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> Hmm, looks like that CUSE_SUPER_MAGIC is an unused remnant from an
> earlier version of the CUSE patchset.  I'll fix that up in the fuse
> tree.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Jun_2009_17_27_29_+1000_G+CRR8zfKwutohg2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkouDuEACgkQjjKRsyhoI8ygygCfb6VF2RL4KAe7SGIf2A9vQ4Jm
GroAoLKKVAkfkpXQFueLBDsrxAEE1xn1
=eP04
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Jun_2009_17_27_29_+1000_G+CRR8zfKwutohg2--
