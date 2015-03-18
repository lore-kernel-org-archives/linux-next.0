From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the renesas
 tree
Date: Wed, 18 Mar 2015 16:46:50 +0530
Message-ID: <20150318111650.GI32683@intel.com>
References: <20150318120322.6a08816e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:3152 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755177AbbCRLUk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Mar 2015 07:20:40 -0400
Content-Disposition: inline
In-Reply-To: <20150318120322.6a08816e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simon Horman <horms@verge.net.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 12:03:22PM +1100, Stephen Rothwell wrote:
> Hi Vinod,
>=20
> Today's linux-next merge of the slave-dma tree got a conflict in
> arch/arm/mach-shmobile/board-ape6evm.c between commit 9d07d414d4c3
> ("ARM: shmobile: r8a73a4: ape6evm: Remove legacy platform") from the
> renesas tree and commit c078c62a7528 ("mmc: sh_mobile_sdhi: remove
> sh_mobile_sdhi_info v2") from the slave-dma tree.
>=20
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary (no action is required).
Thanks for reporting,

Yes the fix is the right one.

--=20
~Vinod


--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJVCV6iAAoJEHwUBw8lI4NHujIQALF9fGly2JCeO619n23WdabF
8zCuoJMrtXiv3LXl52d52FvHmTOVDU3+/SLqmvJiZ2x7nh/Xn8JCgVYMoQojRJ/U
hTcaDi2ZE4+0I/BmRROFgnf4E8lt/dG3MQOMaezxLAjqWbAwyzeLCUUg7XLPqbeU
HVuaVcvlT2lfKfMnn1U5+KJGsH3Z1fHnWaKkJL+afe3iymHziAHGZt0vZsAn33qd
b5F0pEeSQ1VrbtpFpJXlrOc62G+D06oXkFaPpJ/ClagIpGipLkLTQxOPoRmcr0nX
KEs5zWhK5pKHPXJOEFSXwFr5kFzLVs+yoCSgg4MXViiuqAWYNfkP8S3KqtxAYMvX
LQEQc7NFCxGV0GNDJfxRYqquiWtx0PzOqeHWnaTtsFvmnf/AopzG/To9heNzr51z
lO/4t8D/+9mkSQgabbhEC+EnweFiBKYiAizmnTDbSA+4VLZNUaq2OkK+LkuXiXc2
ftDK+NH5nPR1ZFHuwvcTvc9d5xOWEsBBsBLVHo4pMlnOcB+JhvNNETe1rc/wMmhR
cfIgf9ru4KzD4HntKdgJmirNyRcr7bz1cXnq7qi/Dyyg43nUFf/bIlfbYoQpH8FE
nio5ePSYmW7/1IE+Tm3PH9MgjoIQT/PdgVURQYRbjnF4BxEpnAOkFrL+egobFLUO
vYQvIwX/TW0DHiLGvKJt
=SdMw
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
