From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Mon, 8 Oct 2018 15:47:43 +1100
Message-ID: <20181008154743.156e63be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nNaefXIMJ/AX9S.B1DBgi_D"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/nNaefXIMJ/AX9S.B1DBgi_D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/imx/imx-media-dev.c

between commit:

  b803cd359833 ("media: staging/imx: Switch to v4l2_async_notifier_add_*_su=
bdev")

from the v4l-dvb tree and commit:

  f93861c2d611 ("staging: Convert to using %pOFn instead of device_node.nam=
e")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/media/imx/imx-media-dev.c
index 481840195071,3f48f5ceb6ea..000000000000
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@@ -47,34 -80,52 +47,43 @@@ int imx_media_add_async_subdev(struct i
  	struct imx_media_async_subdev *imxasd;
  	struct v4l2_async_subdev *asd;
  	const char *devname =3D NULL;
 -	int ret =3D 0;
 -
 -	mutex_lock(&imxmd->mutex);
 +	int ret;
 =20
 -	if (pdev)
 +	if (fwnode) {
 +		asd =3D v4l2_async_notifier_add_fwnode_subdev(
 +			&imxmd->notifier, fwnode, sizeof(*imxasd));
 +	} else {
  		devname =3D dev_name(&pdev->dev);
 -
 -	/* return -EEXIST if this asd already added */
 -	if (find_async_subdev(imxmd, fwnode, devname)) {
 -		if (np)
 -			dev_dbg(imxmd->md.dev, "%s: already added %pOFn\n",
 -			__func__, np);
 -		else
 -			dev_dbg(imxmd->md.dev, "%s: already added %s\n",
 -			__func__, devname);
 -		ret =3D -EEXIST;
 -		goto out;
 +		asd =3D v4l2_async_notifier_add_devname_subdev(
 +			&imxmd->notifier, devname, sizeof(*imxasd));
  	}
 =20
 -	imxasd =3D devm_kzalloc(imxmd->md.dev, sizeof(*imxasd), GFP_KERNEL);
 -	if (!imxasd) {
 -		ret =3D -ENOMEM;
 -		goto out;
 +	if (IS_ERR(asd)) {
 +		ret =3D PTR_ERR(asd);
- 		if (ret =3D=3D -EEXIST)
- 			dev_dbg(imxmd->md.dev, "%s: already added %s\n",
- 				__func__, np ? np->name : devname);
++		if (ret =3D=3D -EEXIST) {
++			if (np)
++				dev_dbg(imxmd->md.dev, "%s: already added %pOFn\n",
++				__func__, np);
++			else
++				dev_dbg(imxmd->md.dev, "%s: already added %s\n",
++				__func__, devname);
++		}
 +		return ret;
  	}
 -	asd =3D &imxasd->asd;
 =20
 -	if (fwnode) {
 -		asd->match_type =3D V4L2_ASYNC_MATCH_FWNODE;
 -		asd->match.fwnode =3D fwnode;
 +	imxasd =3D to_imx_media_asd(asd);
 +
 +	if (devname)
 +		imxasd->pdev =3D pdev;
 +
- 	dev_dbg(imxmd->md.dev, "%s: added %s, match type %s\n",
- 		__func__, np ? np->name : devname, np ? "FWNODE" : "DEVNAME");
++	if (fwnode)
+ 		dev_dbg(imxmd->md.dev, "%s: added %pOFn, match type FWNODE\n",
+ 			__func__, np);
 -	} else {
 -		asd->match_type =3D V4L2_ASYNC_MATCH_DEVNAME;
 -		asd->match.device_name =3D devname;
 -		imxasd->pdev =3D pdev;
++	else
+ 		dev_dbg(imxmd->md.dev, "%s: added %s, match type DEVNAME\n",
+ 			__func__, devname);
 -	}
 -
 -	list_add_tail(&imxasd->list, &imxmd->asd_list);
 -
 -	imxmd->subdev_notifier.num_subdevs++;
 =20
 -out:
 -	mutex_unlock(&imxmd->mutex);
 -	return ret;
 +	return 0;
  }
 =20
  /*

--Sig_/nNaefXIMJ/AX9S.B1DBgi_D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu64W8ACgkQAVBC80lX
0GxKJggAgJr2EtNxfcR22lRYhjeorG8FlKHyJ7dopiWh4atRkL+0VwDQ1Bctr3do
sTf51G/Laajcj4c/T7S4yymV96ishnzt1jvmdK72RnVEhq6Rm+G58RK2iSA1skJg
crJkuafgrTrg/VS5iawFe1EhgeTdxym7UumqVh7dbeGraMhfoTG8xRcqSwFrOOG0
Wf0LPPBbRM6uKgat0JpAgNs3u/kFsBHHIS6mnhsZHCItax2CQvFKq9IsM9o1kZ8H
fihX1iSZNEr3NUk66j8p3Xe7NA/teN1lHEiQkilg5XycY+TwoZU+7FjNXUXVksNo
RpYpMmYotjkut2wkYhShCvHUHawg8A==
=NfEr
-----END PGP SIGNATURE-----

--Sig_/nNaefXIMJ/AX9S.B1DBgi_D--
