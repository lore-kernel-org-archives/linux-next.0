From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the drm-intel-fixes
 tree
Date: Fri, 25 Jan 2019 13:27:31 +1100
Message-ID: <20190125132731.1c076665@canb.auug.org.au>
References: <20190124221949.4c89542a@canb.auug.org.au>
        <87munq1e9u.fsf@intel.com>
        <9BD218709B5F2A4F96F08B4A3B98A8977335C38E@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iStUS2HT5_QZfgzo/uCY0g0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9BD218709B5F2A4F96F08B4A3B98A8977335C38E@SHSMSX101.ccr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Li, Weinan Z" <weinan.z.li@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhenyu Wang <zhenyuw@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iStUS2HT5_QZfgzo/uCY0g0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 25 Jan 2019 01:21:26 +0000 "Li, Weinan Z" <weinan.z.li@intel.com> w=
rote:
>
> I am not sure about the problem. The commit id "0cce2823ed37" is just
> for the patch of "drm/i915/gvt: Refine error handling for
> prepare_execlist_workload". Is there any other problems I missed?

Its just that the subject line of that commit has a space after the
':', but the copy of that subject line in the Fixes tag omitted that
space.  This is not a big issue, my script just pointed it out.

Its not worth doing anything about it, just take a bit more care in the
future.
--=20
Cheers,
Stephen Rothwell

--Sig_/iStUS2HT5_QZfgzo/uCY0g0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxKdBMACgkQAVBC80lX
0Gxv9gf/eU93yZ6hSWNoTVWCttXwJR4Iosd/fonswdprpHXOXAbiSn5F/HqhLP4o
O0oXsFqiUV0erlGG18U79aaNCuObfHnbKvWnKtpb1+qvedxhIeO2euWB4vGvOthS
7AJ4k6xbR/r9xRXXjHovFFfgcV04Fh0iwQ5yUp4CbRbYnReVKSmkrZhZ9Pn05uSO
+3fyi4Yyyo7Trl4F0cgF3iFmm/qe6AWNYiCbkdHBg2PwGNAvudqnF7RCEM7fU7dZ
ge9S+uQjr1fNq1mzXAWhbhsnsaMODVNNoQpmsd20QIX75wTe3qPVgg/l7ZI7SlVR
dO+18tocJ0ziJRnRwgQQ6IHGXF4Hnw==
=O2DL
-----END PGP SIGNATURE-----

--Sig_/iStUS2HT5_QZfgzo/uCY0g0--
