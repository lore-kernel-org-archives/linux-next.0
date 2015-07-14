From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 14 Jul 2015 12:52:32 +1000
Message-ID: <20150714125232.5059feb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xcT.5NCRNaPLAfhF3vy/CLx"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54694 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753097AbbGNCwl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jul 2015 22:52:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>

--Sig_/xcT.5NCRNaPLAfhF3vy/CLx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/virtio/virtgpu_drm_bus.c: In function 'virtio_pci_kick_out_=
firmware_fb':
drivers/gpu/drm/virtio/virtgpu_drm_bus.c:55:2: error: implicit declaration =
of function 'drm_fb_helper_remove_conflicting_framebuffers' [-Werror=3Dimpl=
icit-function-declaration]
  drm_fb_helper_remove_conflicting_framebuffers(ap, "virtiodrmfb",
  ^

Caused by commit

  7bd870e7b1c8 ("drm/virtio: Use new drm_fb_helper functions")

I have used the drm-misc tree from next-20150713 for today.

(That commit said "COMPILE TESTED ONLY"  :-()
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/xcT.5NCRNaPLAfhF3vy/CLx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVpHl3AAoJEMDTa8Ir7ZwVwmsP/R4GSZL22LSQ9H+M/HEjqfk2
kbyLtOQ6739EkWmiChQd2sfoXAH32QLMoISs5qhGmw5t0Gib/8kmhhwYedXCy3Cb
SXBXjQKE5HNItMZvofSiOiOaFtJ3agmCS5/PyG9K3d9XzMjBpd7opN9uRdak9lgc
jK3f0vIa26CCL+LZvbaCtIBf8FkX+/n6zCBpT5b7mZ4dE1tSunCesLUXvcEeDBlZ
2fW0URNI3vkkvhy+qeJ357aqW6skxI3zFRN7N/x2lNOYjO7qTaqkFkRCb2uuPPho
k4dKNeavcPif/hc0562I9xEPY3W0E9xw5BcJT+tDZnSh6fBI55Zv2P3j2mnsCzVH
2ZsbyFij2KKt5x3P8qmhDg6SqWLDFfOfsVIj+TQtqUuif2BaY/h6EXSfH5j0POP6
kiK+6zX2KhHO72mG7rZ3RLi+7TRm0Zld+z2SQqPNF64vsJsgxeq0+Qmlnk+KbtFv
67Wj2HwsvYLlpuNK/OTQAKwINWwA/J0KbeKhE9Ggkn4c4NPyPTJFoEXzDrLb24wf
yMWuzdxMQixTTVE7N3OVpnF8Yp/bhuZ0laHXafo01R9eSJcjViw6xTyA89miOZXS
e2plhEReYoMNKCMccO7AO5YKaHBb3w77TVcbXVI/+NNbYBLFIPUHVWrsFlmL2PK/
4w7OXMEg9Zg8rzodUo/i
=AvuP
-----END PGP SIGNATURE-----

--Sig_/xcT.5NCRNaPLAfhF3vy/CLx--
