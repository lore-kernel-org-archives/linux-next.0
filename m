From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Mon, 2 Dec 2013 12:04:37 +1100
Message-ID: <20131202120437.db17c98af3f3e09ecdde0f2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1148883583=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Deepak S <deepak.s@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paulo Zanoni <paulo.r.zanoni@intel.com>
List-Id: linux-next.vger.kernel.org

--===============1148883583==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__2_Dec_2013_12_04_37_+1100_vlJIGOG36lSUwceD"

--Signature=_Mon__2_Dec_2013_12_04_37_+1100_vlJIGOG36lSUwceD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/intel_display.c between commit a1216444283e
("drm/i915: use the correct force_wake function at the PC8 code") from
the drm-intel-fixes tree and commit c8d9a5905e45 ("drm/i915: Add power
well arguments to force wake routines") from the drm-intel tree.

I fixed it up (I just used the drm-intel-fixes version) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__2_Dec_2013_12_04_37_+1100_vlJIGOG36lSUwceD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSm9ypAAoJEMDTa8Ir7ZwVze4P/16Joq0bNvuGHRO48BmP91wF
oi4iIdeYHjx4vSl2BZ/44e0Bvccp33pRIIW6w5aHPk70513V29PwY9tMIalhTbDI
IHYDz1pZ0WRS84nwIRsxc58POI+xm/G6bjRl1B+odvICyKZWd/Q8uGoWZUjJRUJu
DehiV5sQAbRps9ljAhypSp+Xcvf46ZNGYpOsVcn7pDQw3iQmJvAQfnfRHM6ZHF80
yC8YebRjb4IEzGElML9Yvp2ym5W1vNFR9a7p59y5YcH98+nDNzmdrgw0LZKncKcU
JVm9QwnLUqwiOELpLUFuakwobdvu4d4yy8uYEA5h60HHwL6lvoXhnpsm25OA6W9b
g0Hw+1+zixFL5hcV910v/G7cF/55G+FJ0z3ZocJFRMcdgQg3hUPt1BzvhSKfMB+N
1Hbm223rAo8E8+u6BeXEoW4YOsea3oreJuAtqnBnd+Jv3YQ8sx7By4S56Of78v/U
FuKk7kAV9AulOTSJiUM3BkS8dClYs4VjjtQlqTRWgbRohdirzZyM5laYU5W17ION
4LSeUPMirZkM3Yc0+AmI0RK8HQrVNOv6ECTIJ6z9k4fKTnOJSiBQ9SoA61jSAxdV
E38xUUFxJS/bLTEz4O7L81aBX8aM3fT/zxmE91uFv3OP9wAr4XdKd5rSOKnuCaf1
y3tqY9xkm0bKHhKrkXbl
=Ln7+
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Dec_2013_12_04_37_+1100_vlJIGOG36lSUwceD--

--===============1148883583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1148883583==--
