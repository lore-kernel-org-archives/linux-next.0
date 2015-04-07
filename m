From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 7 Apr 2015 17:36:39 +1000
Message-ID: <20150407173639.674be865@canb.auug.org.au>
References: <20150407140035.60d2053d@canb.auug.org.au>
	<20150407070214.GA7074@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OLWYf9Ju8UDhCN5FJvBrUH."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55896 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750929AbbDGHgp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 03:36:45 -0400
In-Reply-To: <20150407070214.GA7074@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@huawei.com>

--Sig_/OLWYf9Ju8UDhCN5FJvBrUH.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Tue, 7 Apr 2015 09:02:14 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Apr 07, 2015 at 02:00:35PM +1000, Stephen Rothwell wrote:
> > Hi Al,
> >=20
> > Today's linux-next merge of the vfs tree got a conflict in fs/ext4/inod=
e.c between commit 72b8e0f9fa8a ("ext4: remove unused header files") from t=
he ext4 tree and commit e2e40f2c1ed4 ("fs: move struct kiocb to fs.h") from=
 the vfs tree.
>=20
> FYI, the ext4 tree seems to have the crypto support, which I don't think =
is
> ready for 4.1 with all the implications of it..

Actually I was going to ping Ted about that ...

Ted,

A few of the files added by the ext4 crypto support do not have
copyright notices or license acknowledgements ... and there was one
place I noticed that has just a template for function documentation
that is not very useful.  I didn't look further, but was wondering if
it had leaked out ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/OLWYf9Ju8UDhCN5FJvBrUH.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI4kLAAoJEMDTa8Ir7ZwVHRoP/3nJ7zWOnsCwq2pzpC+2rxl9
Oa8OLGLt9Ftiev1CjZGAwtVrqFoGircjnmDWtr+d1onZiPYGDZX+tMiFWJzI7vv0
HA+9zW3DbA7jxdKbUXYg1Hb9rIZxXgkqhjMTlGRbgMxtR5AdbYZYsv3RgFY2aoBK
natNmoIL36uCciRHKCF7JlzIFp/VcXvrz2PvFHCO7mjLbJ/9uK/B0QTm3vUFtXhh
3A33qPBlHA7iTcH2Xi6R6TqCqjf+d/K/x3TgYvM0Yqcs3qOCXg3W4WvKpSd261Pd
EI0wwztnYL5jFyRtD1AA3d8PQE3hfgQTZyx5BUAKOmYd5uHccO4tD0T+8AgTJTAo
OWfTG8ql4NeHY6Ch8cHikQxChZ+3D7k22qQFHQQaLbt59UAUKr+9Z3DP8KTMUWOh
5Tt8pZZ5d3RkhugOO8zHiIosjw1BEBMW11OB71Ob/ep10pKtwITegwCTmA0cbMiw
b7lCdyg4SahjW7z+zL96juLPYVB5gW8cMSqxLMNKcadoviUa8UnmN0kvOyercQas
UGAOraflaW4WX9ckj8WKnIo0ajKB+NwtwMKvQ6ZQ6s0RrFqo8JNA+kYJ6aVBuK0r
mVKj57b2CE1mZ/SYgtrRlsXb/G8to53KNYY7DRwgcx5fFDJgMSZGQcaFugVZtxFk
YCGcwG7jOSGjVgMt63jv
=zQae
-----END PGP SIGNATURE-----

--Sig_/OLWYf9Ju8UDhCN5FJvBrUH.--
