From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2019-02-04-17-47 uploaded (fs/binfmt_elf.c)
Date: Tue, 5 Feb 2019 18:58:29 +1100
Message-ID: <20190205185829.113a8812@canb.auug.org.au>
References: <20190205014806.rQcAx%akpm@linux-foundation.org>
        <08a894b1-66f6-19bf-67be-c9b7b1b01126@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+HD3eexliaqabC4pbA07JGT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <08a894b1-66f6-19bf-67be-c9b7b1b01126@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Richard Weinberger <richard@nod.at>, Alexey Dobriyan <adobriyan@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+HD3eexliaqabC4pbA07JGT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, 4 Feb 2019 20:26:43 -0800 Randy Dunlap <rdunlap@infradead.org> wrot=
e:
>
> on x86_64 UML: (although should be many places)
>=20
> ../fs/binfmt_elf.c: In function =E2=80=98write_note_info=E2=80=99:
> ../fs/binfmt_elf.c:2122:19: error: =E2=80=98tmp=E2=80=99 undeclared (firs=
t use in this function)
>    for (i =3D 0; i < tmp->num_notes; i++)

This only a problem for !defined(CORE_DUMP_USE_REGSET) architectures,
but a problem none the less.

--=20
Cheers,
Stephen Rothwell

--Sig_/+HD3eexliaqabC4pbA07JGT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxZQiUACgkQAVBC80lX
0GxwRgf+P5QlePLLQEgqvTRa0Shz+SodC89zAUfN8U46W7XmYSmMjbfH4en9aAS5
LRZFLYwLDb0pTF1BKACQtmjcpSB981/iXf4+S3lGDdqL12eY22UCb9TkYArOGXhD
WJSnzABFZULOpnqbVwG7tLDSo0sOpoPEaaYPg1T++tLRDuryfgU0sdBtZ6kmUGjf
ktmuUnHfg+L0YEhPEOOemnb3/GV2m/R7ei2YpCB5J8I+WuBVc0exO14N6A09x3Qc
vDKgDkk9LTUzfzcBo+jlUjI+RoOOzE3dAEX5u1Wx3BIcSREWlUi4AWjaxatefXdY
qMw62ST26RJbtBiewhhTSIbCEpts7A==
=QLXe
-----END PGP SIGNATURE-----

--Sig_/+HD3eexliaqabC4pbA07JGT--
