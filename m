From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] zsmalloc: Add missing #include <linux/sched.h>
Date: Wed, 11 Mar 2015 15:48:30 +1100
Message-ID: <20150311154830.32d4981e@canb.auug.org.au>
References: <1426023991-30407-1-git-send-email-geert@linux-m68k.org>
	<20150310231557.GA4794@blaptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GOvaB3NzmP25b+m0dX/ca.."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50624 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750769AbbCKEsg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2015 00:48:36 -0400
In-Reply-To: <20150310231557.GA4794@blaptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-next@vger.kernel.org

--Sig_/GOvaB3NzmP25b+m0dX/ca..
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, 11 Mar 2015 08:15:57 +0900 Minchan Kim <minchan@kernel.org> wrote:
>
> On Tue, Mar 10, 2015 at 10:46:31PM +0100, Geert Uytterhoeven wrote:
> > mips/allmodconfig:
> >=20
> > mm/zsmalloc.c: In function '__zs_compact':
> > mm/zsmalloc.c:1747:2: error: implicit declaration of function
> > 'cond_resched' [-Werror=3Dimplicit-function-declaration]
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Minchan Kim <minchan@kernel.org>

Added to my copy of Andrew's tree (and thus linux-next) today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/GOvaB3NzmP25b+m0dX/ca..
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/8kiAAoJEMDTa8Ir7ZwVB2kP/2OoDqaGbwmAjsr+nWQPWMrM
1GnlHeocvwq1MQVtY3aqIUgPKPKr0CMAU4AbGO32eHoYRBTu1Gvxo/gxR2/pNN3o
kwZx1yD/QQ2Rq2ikLKoseIbsTT6DDDhLOJUxPVfmsaVtlC9gdrms8um6rA44Y2aS
0YGfd+KfecUOFIebYrQrkxzJw/HvVEqwts/pIQAwoPocqrvTVYwGl4nC8M31atgk
PqLp7zk3PbnofNagD1a/3AqGQMyW0vLlnJBppisznyr8TJdpDlvzhTG8ZFprKqAY
u/1IIIdT9uk5lH8/2PiEm4QKe1/AbnaLDpBV/WSbl13tMLStFKCnDC3Kiqz+WWsY
mYiN9nLDagX+T9e7b/fFjcPkguDopl5vEcrq0OErG0FlLRhVNLSiCh54AtqbMF9f
P0rqAouRIJDRv0kofD/KbC1bqYzTgFuVlZKvGdKxSbFgwfko77HO8P0cQAl8oM+n
KnQnyEv0/XqUMLm2+yIhsovNXEsqJ5eXyxaHJsssY/mtHlQR4gD9hK/nOiD2F66h
tLLN6BAqovJEtZ2CPeffnwgZP9IVNAERigLg1eNSpTxMkezCyRYK/UFCiNXs4DrT
03W8xbXOBvr5eKeamim7ptQ9rgeKvGCwMPFLikLtLK4eRWH7n57Eqo09Z4Lw0o18
KWw2MpmU+7p1YcO4WfMl
=TNJX
-----END PGP SIGNATURE-----

--Sig_/GOvaB3NzmP25b+m0dX/ca..--
