From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Wed, 10 Jun 2015 10:28:18 +1000
Message-ID: <20150610102818.6ec3d92e@canb.auug.org.au>
References: <20150609234230.216ac85c@canb.auug.org.au>
	<A3397C8B8B789E45844E7EC5DEAD89D06E8BF335@satlexdag05.amd.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D9uSW2GKOo3NI=c2Zh.Naz8"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49150 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752557AbbFJA20 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 20:28:26 -0400
In-Reply-To: <A3397C8B8B789E45844E7EC5DEAD89D06E8BF335@satlexdag05.amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: Dave Airlie <airlied@linux.ie>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--Sig_/D9uSW2GKOo3NI=c2Zh.Naz8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Tue, 9 Jun 2015 14:02:21 +0000 "Deucher, Alexander" <Alexander.Deucher@a=
md.com> wrote:
>
> > -----Original Message-----
> > From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> > Sent: Tuesday, June 09, 2015 9:43 AM
> > To: Dave Airlie
> > Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Deucher,
> > Alexander
> > Subject: linux-next: build failure after merge of the drm tree
> >=20
> > Hi Dave,
> >=20
> > After merging the drm tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: In function
> > 'gfx_v7_0_cp_gfx_resume':
> > drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2879:9: error: 'BUF_SWAP_32BIT'
> > undeclared (first use in this function)
> >   tmp |=3D BUF_SWAP_32BIT;
> >          ^
> > drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2879:9: note: each undeclared
> > identifier is reported only once for each function it appears in
> > drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: In function
> > 'gfx_v7_0_cp_compute_resume':
> > drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3398:41: error:
> > 'BUF_SWAP_32BIT' undeclared (first use in this function)
> >    mqd->queue_state.cp_hqd_pq_control |=3D BUF_SWAP_32BIT;
> >                                          ^
> > drivers/gpu/drm/amd/amdgpu/cik_sdma.c: In function
> > 'cik_sdma_gfx_resume':
> > drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:14: error:
> > 'SDMA_RB_SWAP_ENABLE' undeclared (first use in this function)
> >    rb_cntl |=3D SDMA_RB_SWAP_ENABLE |
> > SDMA_RPTR_WRITEBACK_SWAP_ENABLE;
> >               ^
> > drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:14: note: each undeclared
> > identifier is reported only once for each function it appears in
> > drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:36: error:
> > 'SDMA_RPTR_WRITEBACK_SWAP_ENABLE' undeclared (first use in this
> > function)
> >    rb_cntl |=3D SDMA_RB_SWAP_ENABLE |
> > SDMA_RPTR_WRITEBACK_SWAP_ENABLE;
> >                                     ^
> >=20
> > Caused by commit a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts").
> >=20
>=20
> Should be fixed with this patch.  Sorry for the breakage.

I will apply this as a fix to the drm tree merge today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/D9uSW2GKOo3NI=c2Zh.Naz8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVd4SnAAoJEMDTa8Ir7ZwVycYP/0nHtDZILCa3+K39VSIayOMM
FKC885kOzkPATvinkUbTcG629l4EwqlE/rbwuap5Xt0rNXYrXe0pOVhxNDhA+avK
I0Mfq468xqv1q95zDuYD4K6nikMW/Q02HMbdLWrdJjCus+LubPzhzbo+9WHgrqJt
aloUxWK/hR+TWuzgKRljzIj1rMXZZ9n1rfzZdgQ5pivQdKAFOO+wJllISb1Bes1L
uRqjfMrVYOcMlrxWVWZlMXmqyfl9EB6Dgo3QrBKWlIt0dnE6ODnrpfzFtBtQwCsG
Xt5rSDLfehLTM2qg83SJ991+2F8Y24dP9eVc1qqtNd8gODcXmMYokVB6vx943zm/
cBDv4f8gN7EWeG+G7Tns+Qq8vi6HjeVhYX3PABJc/nBLETMLJhlZhiXhnnlzBC/I
grVqtx0jkT6bKMlJfgBhAd/XOglyWPv9B+j+tAUM3RpjAo0WDAFpHRNgcXjfYuXV
1WCQTUK1y0kBjVMRfihT1+U4uxa+jNexDiXnBfKj9mXLsH8l+KBTpN8KMOMsUZua
COdajEiZpSTW5zZAdh+UDiytRetxQyP8jwB4lexUppQ28H7nFqVxgLAimyS8FZGG
ai93XW68q/Z0Aw42Ejw88fE3+ISQvIgxyyT9ntmucRbDtfUFw/tsFL8SCsPkfd5x
GFsEiqLLGkaXHey5vzlu
=S/oo
-----END PGP SIGNATURE-----

--Sig_/D9uSW2GKOo3NI=c2Zh.Naz8--
