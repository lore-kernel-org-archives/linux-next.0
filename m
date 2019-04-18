From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the phy-next tree with the qcom
 tree
Date: Thu, 18 Apr 2019 17:59:09 +1000
Message-ID: <20190418175909.76f16930@canb.auug.org.au>
References: <20190418152954.255015e1@canb.auug.org.au>
        <d194fa50-8bff-544e-eb88-128810f525f9@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+AshyETYX/BeJTHUPqiBhL2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d194fa50-8bff-544e-eb88-128810f525f9@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>, Linux Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/+AshyETYX/BeJTHUPqiBhL2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Thu, 18 Apr 2019 09:35:44 +0200 Marc Gonzalez <marc.w.gonzalez@free.fr> =
wrote:
>
> It is not clear to me what I could/should have done differently to avoid
> the conflict?

Nothing really, it will need to be fixed up when these trees are merged
into Linus' tree (or some other tree along the way).  It is not a big
problem as the conflict is pretty simple.  I send the emails just so
people can see what I think the resolution should be and correct me if
I am mistaken.

--=20
Cheers,
Stephen Rothwell

--Sig_/+AshyETYX/BeJTHUPqiBhL2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly4Lk0ACgkQAVBC80lX
0GzyxQgAjLDPt/0aB7gYWTpzZ4eyr5+ZNBefenCqyThvkmhre+oktf96SM94dk/S
Lo6H+dlw2JLJiSMaHKouImgFGAWcPY2iwRRhcSO2tv2HUdu2VNbXCoNf8qcGytO7
8e9HsyIOIsRAWAg00B6i1OKIZ802860yHj7ZPuYICCmELRlltamwPrcqKo/CFxGc
QV3zTFp8Cx9M8/ZQ+KrykfaCAbrOSmYRgYLoBr3ZinU5je4ucBVsZvE6s1M0TLAl
knn0CYx5U00w9IR+GqyulwSFRBa9HQhD4qI/+Xmo+BtkvlRs+/IMna6EIfsjIf4G
gksIPkytUs2j/fssD2t8LBlRRdGqxw==
=FrcR
-----END PGP SIGNATURE-----

--Sig_/+AshyETYX/BeJTHUPqiBhL2--
