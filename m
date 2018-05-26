From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc
 tree
Date: Sat, 26 May 2018 14:34:16 +1000
Message-ID: <20180526143416.5eeea2d8@canb.auug.org.au>
References: <20180515072217.0a2ffe25@canb.auug.org.au>
        <80df07c8-b89c-503e-ad25-9f235cb08038@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WQyqSeLa0C9MvHIQlquDk5Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <80df07c8-b89c-503e-ad25-9f235cb08038@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/WQyqSeLa0C9MvHIQlquDk5Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Tue, 15 May 2018 09:15:23 +0200 Alexandre Torgue <alexandre.torgue@st.co=
m> wrote:
>
> On 05/14/2018 11:22 PM, Stephen Rothwell wrote:
> >=20
> > Commit
> >=20
> >    949a0c0dec85 ("ARM: dts: stm32: add USB Host (USBH) support to stm32=
mp157c")
> >=20
> > is missing a Signed-off-by from its committer.
>=20
> My fault, I forgot it when I applied patch on my branch. Do we need an=20
> update or it is just a reminder?

Some people rebase their tree to fix these up, some just take it as a
learning experience :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/WQyqSeLa0C9MvHIQlquDk5Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsI48gACgkQAVBC80lX
0Gz6PQf+PfTQbubqyUAglH4nBgrX5viZJ8RNA+hdAHKfF2N1h1UOjupYrZOOtQ+d
RAszyWuxW5Yd1iK9zy7tar3OF2870A89KA4CQIJ7QSE882mdUxdhTb/q7Z24ooCr
kKNZPX70vpG1Kpn3o1eSJEtdHQSpXcTCDF4mF4Sg/ONYIB8xbJ5D04/VhCVXC12U
kfYA5S0SFyIaxzT+tVE8btp2G4geMBcH7Ktz1Ra4kXEHMjry32Ad6nubWssL+NI1
3xkRdJSL91jQ/LSqZowcnIUtgVn3ieotJkJ0Qpdga9ISwyKE40jVHDWqaM20jtQj
TKv3INxsPPgcKvma0iDTuZtTDNZyQA==
=bkua
-----END PGP SIGNATURE-----

--Sig_/WQyqSeLa0C9MvHIQlquDk5Q--
