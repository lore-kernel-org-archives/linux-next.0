From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree (pm
 tree related)
Date: Fri, 19 Aug 2011 23:39:50 +1000
Message-ID: <20110819233950.e526ac71ca862f45538b8721@canb.auug.org.au>
References: <20110819130328.ee5c4b7191db0ce2c8a02e39@canb.auug.org.au>
	<CAN5iSWpGKF4qu5yqeDk=nxvq0tVs6+mozAEJ+FLdh=Ryx-hsEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Aug_2011_23_39_50_+1000_cv+zttbXkQHIdwSk"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN5iSWpGKF4qu5yqeDk=nxvq0tVs6+mozAEJ+FLdh=Ryx-hsEA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Pihet-XID, Jean" <j-pihet@ti.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__19_Aug_2011_23_39_50_+1000_cv+zttbXkQHIdwSk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,=20

On Fri, 19 Aug 2011 10:14:11 +0200 "Pihet-XID, Jean" <j-pihet@ti.com> wrote:
>
> Well, it is not as easy as it seems. As the patch set describes, I am
> build testing for x86 and OMAP. At the moment due to config
> dependencies it is _impossible_ to disable PM in the OMAP config.
>=20
> Also I cannot build test every platform out there.
> Do you have a procedure for build testing?

I do not expect developers (or even maintainers) to build for every
architecture/platform  - that is partly what linux-next is for (see
http://kisskb.ellerman.id.au/linux-next ).  It is good to see you at
least thought about the !PM case.  Can't it be turned off in x86?

I am a bit sensitive about these sort of build errors as I see it happen
way to often that a developer make a typo in the !CONFIG_XXX stubs.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Aug_2011_23_39_50_+1000_cv+zttbXkQHIdwSk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOTmemAAoJEDMEi1NhKgbsF/YH/R96riCfayf5D+5U+AftIVbE
SJ4UlPkPp/qmjOLWKfJk75Gr8jCRW7gitfMdxGDpTOLsWU78blxcPTbZIRHu9uu5
ynr6LKxUodvZ4ZLcLEFe4Wd7SaOdsjHj9wcfUiAwLBxvTLusSlluFL5aI7Y1P7F+
t7wJA5129Lrpe63WXFSrlzpvCAPG22EXC4U05O/GyH6mh1/fQpgWGy3tHuYpXbLh
t6TDLMQO8sObOLP1FMLQ1b6fow+d/v2grtYApaCxB7T5DF/CoMwIGqTuP4/2EgUC
u3qRd7Nkzk0Llt3KmJRJjCkweceF0ttJeZjmB5L9pRZ0kY43Z0Y0uXmjKstaU2Q=
=X8vS
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Aug_2011_23_39_50_+1000_cv+zttbXkQHIdwSk--
