From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the vfs tree
Date: Fri, 21 Dec 2018 08:10:58 +1100
Message-ID: <20181221081058.5ada2c53@canb.auug.org.au>
References: <20181221074522.0b0c986c@canb.auug.org.au>
        <20181220210543.GX2217@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3sCidSRlU2hsOUA+1pQsWWh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220210543.GX2217@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3sCidSRlU2hsOUA+1pQsWWh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Thu, 20 Dec 2018 21:05:44 +0000 Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> > are missing a Signed-off-by from their committers. =20
>=20
> What the...  Oh, I see - that's David adding his reviewed-by and somehow
> losing my S-o-b in process...  *grumble*

Actually, if David has actually added his Reviewed-by, then he has
committed them and so he needs to add a SOB as committer.

> Will be fixed in tomorrow push.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/3sCidSRlU2hsOUA+1pQsWWh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwcBWIACgkQAVBC80lX
0GyjGggAjM75t9jlM/lC8yXOo0KHZAYyjCTs2BaIr2sSv8vxSMSoe5vSfCEmWVvQ
dnIr5Ws5LWr6g8KCXwd5CHkHDLOfMXeV04xs3W/FBsykEFbKpqqtg4X5SxvpPNjE
ZL2zzyW/Ux+Nb69sy4a9y3tD8IHDdAeWumll9KO4psXre2iuUaqw4EjzCYKEgCbF
FHWbOe/sEQhNnOAnmLYIK5IMOAqQUN60CRYOKtCqnkNxBCo79qYSU3ugUNzvZqzE
GMnLdaSinEzSwG6J5xNgNJXwLi/6gmL2jNs9EeHRAujHCrVeAkZDB7aQCd2ObIWE
0BRTekcDe+CsZ+J8JLtmyz2ikGMnPA==
=6gY9
-----END PGP SIGNATURE-----

--Sig_/3sCidSRlU2hsOUA+1pQsWWh--
