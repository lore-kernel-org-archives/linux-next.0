From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Fri, 20 Jul 2018 11:06:22 +1000
Message-ID: <20180720110622.639fd50a@canb.auug.org.au>
References: <20180719120447.6e7ba23d@canb.auug.org.au>
        <cbc20089-6847-c0eb-5b5a-735245986be1@roeck-us.net>
        <20180719152940.0720e9c1@canb.auug.org.au>
        <6dabf12b-e3db-dfe8-101c-02772039e21a@roeck-us.net>
        <20180720080906.7a30c573@canb.auug.org.au>
        <20180719223521.GA30287@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zoHN.LmnUK75zxi/yJZfRCz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719223521.GA30287@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/zoHN.LmnUK75zxi/yJZfRCz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Thu, 19 Jul 2018 15:35:21 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>
> Yes, replacing imply with the dependency is what I did in the fixup patch.
> Sorry, I should have copied you: https://patchwork.kernel.org/patch/10534=
925/

I will use that as a merge fix patch when I merge the net-next tree
today (unless Dave adds it to his tree first).

--=20
Cheers,
Stephen Rothwell

--Sig_/zoHN.LmnUK75zxi/yJZfRCz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltRNY4ACgkQAVBC80lX
0GzHfQf9HBDd5wX1qD91tVPVa/sRX1eKR15llhqr33mudgAWfqyGqkv74lavb4b3
paEL205yjHsSp1OtFTjYl38GvzCnt08nxGNDnhfBlCF1bonjG7xJIBvd+KNFvKU2
k9+u7znxRu6CLBAX3v8Wub6HBx4WWEZtUJfWHE5yAc4qmSGV16E3IJoL1OEAwRcU
hhkhNBBVc83kIyRYs7vdEKWvx89GLgI8znydiIqcA49tNtyx9aCmuH7cNfhi/FTM
YdQOXbPa85//qXjLy17PVI47G/GsQlnhU9HJZSvfly/9zqaWmrF5vGtxp2bV11p6
oW7EwOWBxuKHh6DVLvsu2+gr4s+kWQ==
=LsPs
-----END PGP SIGNATURE-----

--Sig_/zoHN.LmnUK75zxi/yJZfRCz--
