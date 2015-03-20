From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the spi tree with the jc_docs tree
Date: Fri, 20 Mar 2015 16:23:54 +1100
Message-ID: <20150320162354.3ed4a511@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dFsSnLao+fPU/H1bsjCpCtK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Remonda <adrianremonda@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/dFsSnLao+fPU/H1bsjCpCtK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Today's linux-next merge of the spi tree got a conflict in
Documentation/spi/spidev_test.c between commit 988b22c519c8 ("spi:
spidev_test: Added functionalities") from the jc_docs tree and commits
b78ce7ed5409 ("spi: spidev_test: Cleaned hexadecimal dump"),
31a5c5a72b90 ("") and  ("") from the spi tree.

Clearly the one commit in the jc_docs tree is supposed to do the same
as three commits in the spi tree.  The jc_docs tree version has an
older Author date, but a newer commit date ...

I fixed it up (by using the spi tree version of the file) and can carry
the fix as necessary (no action is required).

BTW, there is a function in there called "unespcape" whose comment
calls it "Unescape" which would make more sense.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/dFsSnLao+fPU/H1bsjCpCtK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVC67vAAoJEMDTa8Ir7ZwVtBwQAJdjiPpj3YMndOnp/DgdB/ID
ip1/umB+bAB3pJsqdp9kvrrcYB3l7cMzuA6EFl+9Uug1xBiuL8uWNulZWOoIKYEV
1Hwwh7ZpF5SS51zotL1bXxELv976THp1wo8Wmg1Cp+ZmD5YVM8V9ZzMj0+w4EhpY
kNYQqocD42+7eigen2Dco4K3x3x5BGdMrO8n5BeN9MtHy7nXuk7EtEtmag6+YN9i
IJumToNFxF3kPIsZY+TkpSE0DB97HpJdeOjywKvjttPjgR60DmjC4duytjyyKEXr
LEQMmlYd2oE9u72Vx6VqgUmwN+kgQDGBVKLlR80jVpqQSou41TlttdB39jfTbSOX
mtB4kxulE6JkXHo50HfivpbAJxPnqC59azXC5r/8W+cRPq+6jRB26qwq/9brHELr
PFzZljX4v87PCn7UEkFi6Fvt0+e6GnxNi9cldr0y8JpootmjMQqs7dMxO0JbrDhN
UR+auP94jcOMARFk2pnlU/pYW+R882LL9bfWwfRMCKDRGcfkbNYVnZssFwAuUtez
y9ix1lFz5I9xdMt4e50Sekj42u8iRoY5z2xhef1rEp+nKa0AqbE3ssae130dqMX4
kVHQ8nFgR79eFhxKxiqPKSPdL8Yo/3HeZnW/NmVDrVh80eBVPee4vFMlfNEe6y8q
1yoPtza8gPEXia1UUs+n
=wU9N
-----END PGP SIGNATURE-----

--Sig_/dFsSnLao+fPU/H1bsjCpCtK--
