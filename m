From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: +
 zsmalloc-do-not-remap-dst-page-while-prepare-next-src-page.patch added to
 -mm tree
Date: Wed, 25 Mar 2015 17:49:38 +1100
Message-ID: <20150325174938.3d05eb8a@canb.auug.org.au>
References: <5511d133.CLvN99GLSL/edQEW%akpm@linux-foundation.org>
	<20150325054230.GB1675@swordfish>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F94IYkquGvdYmm07ImMm_ea"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50964 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751148AbbCYGtp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2015 02:49:45 -0400
In-Reply-To: <20150325054230.GB1675@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: akpm@linux-foundation.org, sergey.senozhatsky@gmail.com, minchan@kernel.org, ngupta@vflare.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Heesub Shin <heesub.shin@samsung.com>

--Sig_/F94IYkquGvdYmm07ImMm_ea
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Wed, 25 Mar 2015 14:42:30 +0900 Sergey Senozhatsky <sergey.senozhatsky.w=
ork@gmail.com> wrote:
>
> On (03/24/15 14:03), akpm@linux-foundation.org wrote:
> > The patch titled
> >      Subject: zsmalloc: do not remap dst page while prepare next src pa=
ge
> > has been added to the -mm tree.  Its filename is
> >      zsmalloc-do-not-remap-dst-page-while-prepare-next-src-page.patch
> >=20
> > This patch should soon appear at
> >     http://ozlabs.org/~akpm/mmots/broken-out/zsmalloc-do-not-remap-dst-=
page-while-prepare-next-src-page.patch
> > and later at
> >     http://ozlabs.org/~akpm/mmotm/broken-out/zsmalloc-do-not-remap-dst-=
page-while-prepare-next-src-page.patch
> >=20
>=20
> Heesub Shin has reported that this patch causes BUG_ON on ARM
> (with CONFIG_DEBUG_HIGHMEM enabled). Could you please revert
> it in linux-next 20150325?

Done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/F94IYkquGvdYmm07ImMm_ea
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVElqGAAoJEMDTa8Ir7ZwVeSkP/igYwxme4a5O5aCy6gn3K/i4
G89NSUOLCdWCMtqovasWZqcIpVM8CeuHD59tFqDJO6nEckSABs6onwAcd8E2V3G3
gLwNps/RJdEtiYExXRH+d0gwN1YUERaYYxHbRUq5YtbHrepZZ2Yu9fMPRjtS+58N
PvAfhkEgLAJ8mQoRnFg0js7eq58Si5F2JnDYdN0oBKgl8sHuO7mvQATJ9JLg3T9Z
mW+Wl+oGpDOsz3JRVXflntjO+paIaQG2e3+CYX6nSgMfZYPVXMKl/m27ETZthoF8
mcQU6JKcbrPNCXrT6bXCSAtyQEaQ24fE+cmjT3qyXw0wQBJzaWX1DlVJXcrxNl6g
0iIcuXUGyCzMiLldkLk6GjOqqLSTo+w1F2XpM9Oxn3grlU1+6zEMY5oclXnk4g7q
1UQARluzdUkRcr0ml+UeOtkX+31a2/VCDIz9blkAk9CkEaBt2XHlGF6SGVEc6Qg/
+xJoj592lnileiyAcb/crmmQJqrFPARJT2Y7cS3CLdeJBaGcIp+APl5tcSqadj62
uQBLqCK3KfALhNFvUU/EY8h2V8LMuCSSSIcKCdTw9bLozraN/OiuZUo8TEbGZvoJ
tF4RLKvAJztjy6vdfSQOe35XgSuNGvQa0f6UuxUu2WMEDaVyxiWeHHB8SA2oxen7
PWw/ohTuC//LokE5DbbE
=gH1e
-----END PGP SIGNATURE-----

--Sig_/F94IYkquGvdYmm07ImMm_ea--
