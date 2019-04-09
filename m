From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 9 Apr 2019 18:08:55 +1000
Message-ID: <20190409180855.6a33e4e9@canb.auug.org.au>
References: <20190409160849.391d3efa@canb.auug.org.au>
        <20190409072218.nepac7a4pngacweh@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/z3HVKEe3u0hM5_Y3vXgAWZB"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409072218.nepac7a4pngacweh@sirius.home.kraxel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

--Sig_/z3HVKEe3u0hM5_Y3vXgAWZB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gerd,

On Tue, 9 Apr 2019 09:22:18 +0200 Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Apr 09, 2019 at 04:08:49PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the drm-misc tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > drivers/gpu/drm/cirrus/cirrus.c: In function 'cirrus_fb_blit_rect':
> > drivers/gpu/drm/cirrus/cirrus.c:310:25: error: implicit declaration of =
function '__io_virt'; did you mean '__do_irq'? [-Werror=3Dimplicit-function=
-declaration]
> >    drm_fb_memcpy_dstclip(__io_virt(cirrus->vram),
> >                          ^~~~~~~~~
> >                          __do_irq =20
>=20
> Probably just a missing arm/io.h include.

I assume you meant asm/io.h?

--=20
Cheers,
Stephen Rothwell

--Sig_/z3HVKEe3u0hM5_Y3vXgAWZB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlysUxcACgkQAVBC80lX
0Gzskgf/YCKaKjcJzoDMfYeruWGquXXzPKTwqS4mgnOxiAxQKG9YDbzTf4micFd2
PaUeRMwXd7MGVejYsfPUY0GAobdddYI5k2toUkpfzaAJKpcqQXWPxFVRcvY+vt+4
Qdhdad4ot2cm102kEkvUNZo8y/4cvUat7K3uCHhORYkhrOK1AfLAyl6cvs/ujXmN
pq5LqSJTTg+0QiS1QFygD5a0l2+e5frWVIpFSvzV9A1nZKlDeUSVCC4hN+59mB4T
Kixky5dbUpH7/PKtmNHmbFW0k94A4IegVxVOkpKQRjgMQj72CylRkCfs/V2JVZTn
zLHYloGeVYrsMP4JUKYkF3pPhSpdhg==
=cXB5
-----END PGP SIGNATURE-----

--Sig_/z3HVKEe3u0hM5_Y3vXgAWZB--
