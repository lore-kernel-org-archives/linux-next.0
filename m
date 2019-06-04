From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [POWERPC][next-20190603] Boot failure : Kernel BUG at
 mm/vmalloc.c:470
Date: Wed, 5 Jun 2019 00:20:21 +1000
Message-ID: <20190605002021.12392167@canb.auug.org.au>
References: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
        <20190604202918.17a1e466@canb.auug.org.au>
        <88ADCAAE-4F1A-49FE-A454-BBAB12A88C70@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_igep8kUAWl9L/+0neHtMzK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <88ADCAAE-4F1A-49FE-A454-BBAB12A88C70@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-mm@kvack.org, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/_igep8kUAWl9L/+0neHtMzK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Tue, 4 Jun 2019 19:09:26 +0530 Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>
> With today=E2=80=99s next (20190604) I no longer see this issue.

Excellent, thanks for verifying.

--=20
Cheers,
Stephen Rothwell

--Sig_/_igep8kUAWl9L/+0neHtMzK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz2fiUACgkQAVBC80lX
0GwP7Af+Nds/li0BeO7YFEHCVlP8ZGoPFFEQWkfiT8toFusuPbkFeVnHRYq3wODm
5FviWpQpujr9p5c2XrArh4o+CmZR9Ht7DJrpN2pwpNLYzDE6ewRX42sK3zWEr7wf
MIYwHJRSjLyxcQ2gJDKUe1UjHQZZpaBnk9zjuuPbVNLilOMUUgYUXCZwWS8AU2Qr
/8DVv3lT5EQSB3lDQNJR6ULYYPOTXmdA8B1DrDV4knmzc/VtOdevKhEHAQabbXj5
e7mcLfr91dqNQU+pNakAd+bT6h8Z54a7nqNHL8ObT4SoIi/K4uCYpNM4dfk0+n31
MrkfBaVsgQll4+Gbt7/Sflxco6udxQ==
=SSN/
-----END PGP SIGNATURE-----

--Sig_/_igep8kUAWl9L/+0neHtMzK--
