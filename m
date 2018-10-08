From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Mon, 8 Oct 2018 15:53:15 +1100
Message-ID: <20181008155315.3ecadc28@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WubPpHMgJlRj+nYV/MDIctJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/WubPpHMgJlRj+nYV/MDIctJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/imx/imx-media-of.c

between commit:

  21711787045d ("media: staging/imx: of: Remove recursive graph walk")

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

diff --cc drivers/staging/media/imx/imx-media-of.c
index 1c9175433ba6,163437e421c5..000000000000
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@@ -20,13 -20,67 +20,13 @@@
  #include <video/imx-ipu-v3.h>
  #include "imx-media.h"
 =20
 -static int of_get_port_count(const struct device_node *np)
 +static int of_add_csi(struct imx_media_dev *imxmd, struct device_node *cs=
i_np)
  {
 -	struct device_node *ports, *child;
 -	int num =3D 0;
 +	int ret;
 =20
 -	/* check if this node has a ports subnode */
 -	ports =3D of_get_child_by_name(np, "ports");
 -	if (ports)
 -		np =3D ports;
 -
 -	for_each_child_of_node(np, child)
 -		if (of_node_cmp(child->name, "port") =3D=3D 0)
 -			num++;
 -
 -	of_node_put(ports);
 -	return num;
 -}
 -
 -/*
 - * find the remote device node given local endpoint node
 - */
 -static bool of_get_remote(struct device_node *epnode,
 -			  struct device_node **remote_node)
 -{
 -	struct device_node *rp, *rpp;
 -	struct device_node *remote;
 -	bool is_csi_port;
 -
 -	rp =3D of_graph_get_remote_port(epnode);
 -	rpp =3D of_graph_get_remote_port_parent(epnode);
 -
 -	if (of_device_is_compatible(rpp, "fsl,imx6q-ipu")) {
 -		/* the remote is one of the CSI ports */
 -		remote =3D rp;
 -		of_node_put(rpp);
 -		is_csi_port =3D true;
 -	} else {
 -		remote =3D rpp;
 -		of_node_put(rp);
 -		is_csi_port =3D false;
 -	}
 -
 -	if (!of_device_is_available(remote)) {
 -		of_node_put(remote);
 -		*remote_node =3D NULL;
 -	} else {
 -		*remote_node =3D remote;
 -	}
 -
 -	return is_csi_port;
 -}
 -
 -static int
 -of_parse_subdev(struct imx_media_dev *imxmd, struct device_node *sd_np,
 -		bool is_csi_port)
 -{
 -	int i, num_ports, ret;
 -
 -	if (!of_device_is_available(sd_np)) {
 +	if (!of_device_is_available(csi_np)) {
- 		dev_dbg(imxmd->md.dev, "%s: %s not enabled\n", __func__,
- 			csi_np->name);
+ 		dev_dbg(imxmd->md.dev, "%s: %pOFn not enabled\n", __func__,
 -			sd_np);
++			csi_np);
  		/* unavailable is not an error */
  		return 0;
  	}

--Sig_/WubPpHMgJlRj+nYV/MDIctJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu64rsACgkQAVBC80lX
0GzRtAf/TJTWF4BVPvDRufUibISmhswkytM87QCduKIE1wVlsQnDVLrd2yYKO/17
c0IN0xLcfK0oVRTzykuvdHh9nXZYlYOJVJceSX17fThlbw8uNZOexs6GLF56r0CQ
Jnbbzt9p9Jyu6X/ss6Hwx6i2fX3a4Ok3zs/Im7n83aMRb46XTa9RwDLLp0MS70lr
tZbZmyuwMx3TTNFJeJwZlO5D3EeUBzu/MRAVWml/cTRyfUzK3aBjU2Qr8u1sf7g+
soCEcTKpa5X20PqQCe+mZW7PsZe8hitD/4lLjCwf99vEBYVBFOPbvXnVSSe/csFg
B1tIlLF+wPQ1q4/350KSmoN+mZX1/g==
=kqkF
-----END PGP SIGNATURE-----

--Sig_/WubPpHMgJlRj+nYV/MDIctJ--
