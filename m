From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slave-dma tree with the renesas
 tree
Date: Wed, 18 Mar 2015 12:03:22 +1100
Message-ID: <20150318120322.6a08816e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4gbhYCb/p0czLvnr2cap2h="; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34583 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752963AbbCRBDa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2015 21:03:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>, Simon Horman <horms@verge.net.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--Sig_/4gbhYCb/p0czLvnr2cap2h=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

Today's linux-next merge of the slave-dma tree got a conflict in
arch/arm/mach-shmobile/board-ape6evm.c between commit 9d07d414d4c3
("ARM: shmobile: r8a73a4: ape6evm: Remove legacy platform") from the
renesas tree and commit c078c62a7528 ("mmc: sh_mobile_sdhi: remove
sh_mobile_sdhi_info v2") from the slave-dma tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/4gbhYCb/p0czLvnr2cap2h=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCM7eAAoJEMDTa8Ir7ZwV/2oQAIUI5Bapfl9Ht6HMEVaS3yB7
PURUhGs53fe6jwwEN7IoZVzNWwPfSnB3k1OJd1i/XQnlsBs247z8DzeXDJA18naU
qo3Lj2axYwsna4QuSM/NlTJ5KjyCmh8qEhAtSiKaAi56jCfLqKaml5eN01Eel8XQ
cu5iBi6/4BExFrek0kg/sJ/MfuPQb2flJ7xS4V7lzEbCq1gF9k84W6syb3ebhUpM
bnbkpo7uXQAN6maSf5q7uRWPX+3hsgXuk6E7lf8jmwMaJX6ieVDZ2E2ALFVzLSE0
9oojAW9J7JXlTj6j8Y8DxUKWuYH9WwQ8SNvvUvHOj/720aly6KSuaL96/xYNw4K9
np5BBqmgfymeAzF94XY7xTDi2snHRf/sVfby3Y/4yaoJG4kEyaTlzuHXrwVgjnkk
gHxrGL/au/3nvtKxgMV1M5huN6cqDHWDnJPSrBpXp/4mmO//5IEuyvoNqim+UV+K
OWp0U+4FS77j0FJMC2ycFJDkDe7VtvBOv/QABDnzJYa2179oo0N78pRX0jZCrkhQ
44nZ6TErb1wR1aSg33fjqKqvh3fPyAFGUDKCgnC5zBOAUcpyK/4KMGzZ80oqV9Gb
VmpRUVv4CTcMotHnYPtTFCV3PPmifB5fK9/FO2hZNiMKU0ixe9NdZJGFq2YZLD0f
5diORTkjBx4+QXaqVgBc
=cXyM
-----END PGP SIGNATURE-----

--Sig_/4gbhYCb/p0czLvnr2cap2h=--
