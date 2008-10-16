From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the creds tree
Date: Thu, 16 Oct 2008 18:33:59 +1100
Message-ID: <20081016183359.0d2e6035.sfr@canb.auug.org.au>
References: <20081015205522.bcd25de3.sfr@canb.auug.org.au>
	<17101.1224072139@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Oct_2008_18_33_59_+1100_j_hTw69rShJXnunZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51033 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755395AbYJPHeM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 03:34:12 -0400
In-Reply-To: <17101.1224072139@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Thu__16_Oct_2008_18_33_59_+1100_j_hTw69rShJXnunZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 15 Oct 2008 13:02:19 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > - 	int ret;
>=20
> Do you need to put 'ret' back as it's now used a little further on:

Yeah, I discovered that when I tried to build it :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Oct_2008_18_33_59_+1100_j_hTw69rShJXnunZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj27mcACgkQjjKRsyhoI8w61wCeJFgd03bFT7wHVcxgn1/7YJVm
8koAn05CXLcts3J5dJgtUDE8B9bdHWfo
=riyR
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Oct_2008_18_33_59_+1100_j_hTw69rShJXnunZ--
