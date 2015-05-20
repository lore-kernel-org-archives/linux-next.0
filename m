From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the usb-gadget tree
Date: Wed, 20 May 2015 16:29:37 +1000
Message-ID: <20150520162937.5cca5b00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/874ZWZuCuN=mb8DeLaIX3ZK"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35232 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752502AbbETG3n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 02:29:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <balbi@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@samsung.com>

--Sig_/874ZWZuCuN=mb8DeLaIX3ZK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felipe,

After merging the usb-gadget tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/usb/gadget/function/rndis.c: In function 'rndis_proc_write':
drivers/usb/gadget/function/rndis.c:1147:4: warning: passing argument 1 of =
'rndis_signal_connect' makes pointer from integer without a cast
    rndis_signal_connect(p->confignr);
    ^
drivers/usb/gadget/function/rndis.c:748:5: note: expected 'struct rndis_par=
ams *' but argument is of type 'u8'
 int rndis_signal_connect(struct rndis_params *params)
     ^
drivers/usb/gadget/function/rndis.c:1151:4: warning: passing argument 1 of =
'rndis_signal_disconnect' makes pointer from integer without a cast
    rndis_signal_disconnect(p->confignr);
    ^
drivers/usb/gadget/function/rndis.c:755:5: note: expected 'struct rndis_par=
ams *' but argument is of type 'u8'
 int rndis_signal_disconnect(struct rndis_params *params)
     ^

Probably caused by commit 83210e59ee15 ("usb: gadget: rndis: use
rndis_params instead of configNr").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/874ZWZuCuN=mb8DeLaIX3ZK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXCnWAAoJEMDTa8Ir7ZwVZ6QP/jAfb0sL/7HFGa4rIFhGAvCa
aQZuL1qojBPmQ0m/bpldW1eTRFDZTrD+taISsmy9qV3dOEBuEOyazH5nEytk1/YI
NSxxbOaxU9ToiOXvUN4HQTxBiihJjKd0iITz2rnk1DkDtjUMqd4p0gUo+/Kz9Kuw
nK8CgsDh0/KVXs1qH3Mm4qxDhSV0Xh53snGsw7H4zso7+DJQ1Sc5BVar5E2SkCmE
PWjgXonkVf5zoMxj2VssRYrzBdflACiSo17/ZyNmzPwHaL57UQY2PRsSbX1wxHAC
ys33T5AfT2VlEoYbk71bKNjNt4FbqWelgqrTXUSYaxakCZojSnD9su8P8eefatMo
KwcfeKSrxzK3Ika71BWov3Lwmkl45TW1zFD8nu3veyCEfOSzrdcfnhHMacpTli0G
9jMfUTedh8Ka+3V0h5aGKkgsiVXECiHbXVye6wcxYmPBjzVDJSf1+pfuNsaozmdC
HepJhG2yARzMoppjANXInwx5irNVv/Qs+xWX0EYkNQjJRlCER59TJm8o8UGa3eS3
xJEnXpQ/LMVsMRBCjres1YowB4URFphvg1zRUxvo/NvtSDUyV8iFLeTJiBa5XR/z
IFyi42+5z2qghy69xOOkiOztV0D4AHLBfTgIV33bza1yiDr8I3QzW6GQXKjmJa5P
MLxt8OhTOo03wwWXGE+A
=CNbs
-----END PGP SIGNATURE-----

--Sig_/874ZWZuCuN=mb8DeLaIX3ZK--
