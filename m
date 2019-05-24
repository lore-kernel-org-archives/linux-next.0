From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
Date: Fri, 24 May 2019 20:41:30 +1000
Message-ID: <20190524204130.35fd2b63@canb.auug.org.au>
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
        <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
        <20190524201548.2e8594a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=wMrdjYPpv2SAVt7Y0+ABtL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524201548.2e8594a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/=wMrdjYPpv2SAVt7Y0+ABtL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 24 May 2019 20:15:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Ah, in the drm-fixes tree, the definition of  is protected by
                                               ^
ASICREV_IS_PICASSO

--=20
Cheers,
Stephen Rothwell

--Sig_/=wMrdjYPpv2SAVt7Y0+ABtL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznyloACgkQAVBC80lX
0GxJbQgAj0dhFiXefIMEVotDJekVsFhb6aKrghhuZ5tUdUEO2J3VmCpA/kRwUPQj
NgfgVp3d6uOl8WKJvzKxmeH8XUQ+fr13I2rO6ltRKIODWW5Hs+iAHd5lp3EkWF9M
OFNuM2HuUFV+HIymiD6Nq1Jx8uElzK0lwlCi1LarO3Zeo4orB1B6/TdxQvXuOVTD
xXLaAM5hvuFF0e8SicPturJ16laxlfH1snCI8gtjmxol7KG1QGWQyUi+Bf3MfQQk
9tOWZ9Y5Yz3Kz8SOInDpvrEXm14nQ7OWP/n6FLVxCo0UGsL3vkJdaOyCqcr1ojMb
ZIndbfGIyM2VomQ8oZhTaC3kAjc0ow==
=rVue
-----END PGP SIGNATURE-----

--Sig_/=wMrdjYPpv2SAVt7Y0+ABtL--
