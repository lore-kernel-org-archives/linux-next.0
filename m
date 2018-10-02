From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the qcom tree
Date: Tue, 2 Oct 2018 13:31:44 +1000
Message-ID: <20181002133144.4ea80f23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5tcLE6c.4bdLcwazvQcTehZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Andy Gross <agross@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/5tcLE6c.4bdLcwazvQcTehZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  drivers/soc/qcom/apr.c

between commit:

  4fadb26574cb ("soc: qcom: apr: Avoid string overflow")

from the qcom tree and commit:

  b2efb5b04591 ("soc: Convert to using %pOFn instead of device_node.name")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/soc/qcom/apr.c
index 716762d59c1f,4bda793ba6ae..000000000000
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@@ -219,9 -219,9 +219,9 @@@ static int apr_add_device(struct devic
  	adev->domain_id =3D id->domain_id;
  	adev->version =3D id->svc_version;
  	if (np)
- 		strscpy(adev->name, np->name, APR_NAME_SIZE);
+ 		snprintf(adev->name, APR_NAME_SIZE, "%pOFn", np);
  	else
 -		strncpy(adev->name, id->name, APR_NAME_SIZE);
 +		strscpy(adev->name, id->name, APR_NAME_SIZE);
 =20
  	dev_set_name(&adev->dev, "aprsvc:%s:%x:%x", adev->name,
  		     id->domain_id, id->svc_id);

--Sig_/5tcLE6c.4bdLcwazvQcTehZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluy5qAACgkQAVBC80lX
0Gyg1wf9Gxvpbo+KXpmdbSJkTrWo2gTHntDv/w2PivEmYLWqVvuTTcMOWEEFF7wS
j/pC2rpyPIXh2z4Vd83uV0lUoezukfs2Hq4s9fdWUvXmLDpTXr9e+hyOdM1y5QMZ
mQa1cFCqDz5bS9K21/tpDDtaDWiYQHOonkS5wXqcldC8OhRSmM/fZc09m321mm/W
8RKlZgM0ATMuzCNlbGHK+m38XAQDDbB1g08F1zB7pJNszDNfdK3XigVMjELanTpu
mXE+j7JcZj+Gm9t5ZJ5mlbDEJAzm/KPS6eShQLTpkzMUZ4ch+eqXV8l1SMmaHp7L
2b1qjXkf2ixLXnmCsMU86Lh3yS3dYQ==
=yk49
-----END PGP SIGNATURE-----

--Sig_/5tcLE6c.4bdLcwazvQcTehZ--
