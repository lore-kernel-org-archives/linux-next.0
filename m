From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Fri, 10 Apr 2015 22:57:16 +1000
Message-ID: <20150410225716.4a831e61@canb.auug.org.au>
References: <20150410201143.4adb51b0@canb.auug.org.au>
	<2431868.FjHG917i2e@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1xMDP+Oz2SHLthgX_4LnTee"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60895 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932288AbbDJM5Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Apr 2015 08:57:25 -0400
In-Reply-To: <2431868.FjHG917i2e@avalon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>, Radhey Shyam Pandey <radheys@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Hans Verkuil <hans.verkuil@cisco.com>

--Sig_/1xMDP+Oz2SHLthgX_4LnTee
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, 10 Apr 2015 15:45:11 +0300 Laurent Pinchart <laurent.pinchart@ideas=
onboard.com> wrote:
>
> On Friday 10 April 2015 20:11:43 Stephen Rothwell wrote:
> >=20
> > After merging the v4l-dvb tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > drivers/media/platform/xilinx/xilinx-dma.c:15:35: fatal error:
> > linux/amba/xilinx_dma.h: No such file or directory #include
> > <linux/amba/xilinx_dma.h>
> >                                    ^
> >=20
> > Caused by commit df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video
> > IP core").
> >=20
> > I have reverted that commit (and the 2 following it) for today.
>=20
> linux/amba/xilinx_dma.h has been moved to linux/dma/xilinx_dma.h by
>=20
> commit 937abe88aea3161cd3a563e577fc9cf4522c7aad
> Author: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
> Date:   Mon Mar 2 23:24:24 2015 +0530
>=20
>     dmaengine: xilinx-dma: move header file to common location
>    =20
>     This patch moves the xilinx_dma.h header file
>     to the include/linux/dma.
>    =20
>     Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
>     Signed-off-by: Vinod Koul <vinod.koul@intel.com>
>=20
> Could you update the path instead of reverting the commits ?

Thanks for finding this ... I will do that on Monday.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1xMDP+Oz2SHLthgX_4LnTee
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ8iyAAoJEMDTa8Ir7ZwV5cQP/i7MR2XJTwUgJWHQh3b/aptL
DO/MWJlRfbJNpHY2P3a0xytAKBFzD1N3cLT0MEJ22/IoI/Tag7I9sGX644CxT8IS
nvH35M8+1R45iCf0x/f7gTzXEGk8q+PRWHCgIF8tu50tLcd4DEBiwbLwMgctqFLJ
hLisyQlKhqBiz7n8BQpCqwFa8DF82scsur7lXZE639d0EAgHm9jkDAGYkgEVAPId
MTHcIpdgMC3n4atP2sUdouoCMMR6PlmXT83jUnTWmhKpTz9j1e4br98p87FUpzSH
xspvQz37b28CoZGm3d/RWsMMM7fnblRaxbxb4fkJ/2dd2wfRcZBkCEfqxd2p3ovd
xa+DDcNzm01G4JLEp/JPFgme5ZWE+7Sd+Xc/jouDtzW7De0XrUfKDa9A7fi/fasg
IdH/wxNFnw4ACurx9HM33yQL50NbzK8d2brOU1bGJE2+nCwWcFQh6PEZxsxbl9nX
gW7VWX4v0Qc2DEYMvtEu097EiKhv6r/fmbbKhgbzhaOLoMqjQ6B/j3av0C9tfOIf
6kjwNR/yDFZe2AjnB3Mo/Z81c/SxPXi9aQrasMC0eBQE7mLqzPTX3tpqJ3tAS2Er
4ly8e63EGo4PUcnGylxTjGUVHed5kRzhRj52Ovcv/rd6UVW+40Gv7iX2NakpPcPh
NiEZvm+j5hhWKq1+D/dj
=flny
-----END PGP SIGNATURE-----

--Sig_/1xMDP+Oz2SHLthgX_4LnTee--
