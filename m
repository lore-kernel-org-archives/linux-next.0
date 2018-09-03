From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the net-next
 tree
Date: Mon, 3 Sep 2018 15:21:25 +1000
Message-ID: <20180903152125.57233880@canb.auug.org.au>
References: <20180903074043.65038277@canb.auug.org.au>
        <DB7PR04MB4252FC3E1B9B2A56C5B81B268B0C0@DB7PR04MB4252.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qvKqqEPnL=cGsqyjTfk94jc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB4252FC3E1B9B2A56C5B81B268B0C0@DB7PR04MB4252.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vakul Garg <vakul.garg@nxp.com>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/qvKqqEPnL=cGsqyjTfk94jc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vakul,

On Mon, 3 Sep 2018 05:08:08 +0000 Vakul Garg <vakul.garg@nxp.com> wrote:
>
> > -----Original Message-----
> > Commit
> >=20
> >   c2ad647c6442 ("selftests/tls: Add test for recv(PEEK) spanning across
> > multiple records")
> >=20
> > is missing a Signed-off-by from its author.
>=20
> It is my fault to miss adding signoff.

See section 11 of Documentation/process/submitting-patches.rst.

> I am sorry about that.

It happens ...

> Please advise if I need to do something to fix it.

Dave's tree does not rebase, so nothing can be done about this case.  I
guess you should just remember to add a Signed-off-by line in the
future.  Also, Dave should probably check before publishing to his tree.

That being said, I have not seen many like this in Dave's tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/qvKqqEPnL=cGsqyjTfk94jc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluMxNUACgkQAVBC80lX
0GwVrQf/bejc7HG5fCIylZNrnuUrdzEwh82AinM+BoZKuSrr8CdmnbChf0QoAQii
JtQDGqoVXbUW9qEFeAgJcNsqMlgXl6CZmZJ9ZFNKPrmxRefCxttGhP9vR27tA+0N
FBIGkdsG+s4sZXbfiuk9EHbC/2k8CtIy9wsg825cOvkdS8g1WhcbuR3NBA/67Ra0
HTgFLWY5VvyEHZHm6DVlXXYM89MGr0D5fwGxVV9vDf8iUxK/HjIw/00EGKc/JJX7
Wsl6WcRVOkyT8oZZ5HdKar8wmMLt9iZ5RaOwPwhy8nuSw3hJgPmhW24UfntT11BY
U7orGF5t6ofEwLczBtNjibyg6zAtBQ==
=biop
-----END PGP SIGNATURE-----

--Sig_/qvKqqEPnL=cGsqyjTfk94jc--
