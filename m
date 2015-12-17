From: Eric Anholt <eric@anholt.net>
Subject: Re: linux-next: Tree for Dec 16 (gpu/drm/vc4)
Date: Wed, 16 Dec 2015 16:42:33 -0800
Message-ID: <87twnhrjly.fsf@eliezer.anholt.net>
References: <20151216164343.0cb641ce@canb.auug.org.au>
 <5671BB54.2030208@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0042148385=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5671BB54.2030208@infradead.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

--===============0042148385==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Randy Dunlap <rdunlap@infradead.org> writes:

> On 12/15/15 21:43, Stephen Rothwell wrote:
>> Hi all,
>>=20
>> Changes since 20151215:
>>=20
>
> on i386, when CONFIG_PM_SLEEP is not enabled:
>
> ../drivers/gpu/drm/vc4/vc4_v3d.c: In function 'vc4_v3d_set_power':
> ../drivers/gpu/drm/vc4/vc4_v3d.c:157:29: error: called object is not a fu=
nction or function pointer
>    return pm_generic_poweroff(&vc4->v3d->pdev->dev);
>                              ^
> ../drivers/gpu/drm/vc4/vc4_v3d.c:159:27: error: called object is not a fu=
nction or function pointer
>    return pm_generic_resume(&vc4->v3d->pdev->dev);

A patch got sent to the PM maintainers producing static inlines in the
config-disabled case.  We'll see if they like it, or if I just add a
dependency on the config option instead.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWcgT6AAoJELXWKTbR/J7omCAP+wcrb8Oi9wGBhN3dYhGxEEha
Ka4OofDUsdmcCkHGmZ/hE/K7V4CohT3pxX+StkPf/RI1inY5pKI8h578FquyicmB
FfA0GK0Z0NG0BjBQQeVjfcq3wu1DctAhLpzS/kd2nUxZlcsqt7P7DqKiaXO/1+q2
0Wf/oOhBC1W53pFpq89UIltwDsvUhcpfYGr37XOfiUQmSmhi5dCsmpXjg/5cxPAG
tiotvL5oqZKDR8Zq1jMnnOy2uXUqzRJexRlIAFbd2fgj+k9r5ZNDvfDJC26CuPjo
zUenR49VHHIhIpg53QvFXKF8BBqMs4GAM63DzCqnp/ONqvScZP97ci4VsYIsm8N9
l8voEYn8cAW9viCa3SvKvYm+WUOECQGfl1ZuhMxke+2mcFoc37ZrbTsx0VkylJXm
fBBHABbGB/KpCWDVywC36PIQbB7G88qo4u2J8fz6Oh16xMt/AFj14UiH6Jkf7pVq
56tZo9LvhndNw0WitVdez92bOs96kM/E99PF+uS4/T7WL+KmJGaYCa3sVaIlsKRf
6avD59nlAM0LzGLAEnrfTSygV4AGiXRpWzC6bM/pCw1svSuyl+PVLA/o+73jU5MI
eNEqd7Mgm4AMqi5/vGzt73nPFIE9SXamzzArnCO3XkD+geR0d1dxHA+PXGqu9RU8
MnWyU+Jxo9bR5PRq3JRI
=1azg
-----END PGP SIGNATURE-----
--=-=-=--

--===============0042148385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0042148385==--
