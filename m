From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/pl111: Remove reverse dependency on DRM_DUMB_VGA_DAC
Date: Thu, 22 Feb 2018 12:10:46 -0800
Message-ID: <874lm8aipl.fsf@anholt.net>
References: <b1028c02-9633-47bf-e930-a20926e14ca9@infradead.org>
 <20180220102903.27787-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1167782827=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180220102903.27787-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-next.vger.kernel.org

--===============1167782827==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thierry Reding <thierry.reding@gmail.com> writes:

> From: Thierry Reding <treding@nvidia.com>
>
> DRM_DUMB_VGA_DAC is a user-visible symbol. Selecting it can cause unmet
> direct dependencies such as this (on i386, randconfig):
>
> 	warning: (DRM_PL111) selects DRM_DUMB_VGA_DAC which has unmet direct dep=
endencies (HAS_IOMEM && DRM && DRM_BRIDGE && OF)
>
> This is because DRM_DUMB_VGA_DAC depends on OF while DRM_PL111 does not.
> It does indirectly depend on OF via the ARM and ARM64 dependencies, but
> since it can also be enabled under COMPILE_TEST, randconfig can find a
> case where DRM_PL111 is selected without pulling in OF and not meeting
> the dependency for DRM_DUMB_VGA_DAC.
>
> Since select is "heavy handed", DRM_DUMB_VGA_DAC is going to be enabled
> regardless of the above warning and causes the following build error:
>
> 	../drivers/gpu/drm/bridge/dumb-vga-dac.c: In function 'dumb_vga_probe':
> 	../drivers/gpu/drm/bridge/dumb-vga-dac.c:207:13: error: 'struct drm_brid=
ge' has no member named 'of_node'
> 	  vga->bridge.of_node =3D pdev->dev.of_node;
>
> See Documentation/kbuild/kconfig-language.txt, "reverse dependencies".
>
> Fixes: 49f81d80ab84 ("drm/pl111: Support handling bridge timings")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Eric Anholt <eric@anholt.net>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/pl111/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index 82cb3e60ddc8..e5e2abd66491 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -8,7 +8,6 @@ config DRM_PL111
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_BRIDGE
>  	select DRM_PANEL_BRIDGE
> -	select DRM_DUMB_VGA_DAC
>  	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
>  	help
>  	  Choose this option for DRM support for the PL111 CLCD controller.
> --=20
> 2.15.1

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqPI8YACgkQtdYpNtH8
nujEbw/+NWqlfPjgyUOmiqHl60qbfJSRH4N081rcvDzjmYh0WGnwUhpjjP/SmaIy
qSOJdEg9utBIbKiVdFIyWiViT0jqBtF9/LwbBL9RG+fsUgGPF7BMdvScnhdGaaRX
kDgKwwUBn+KRPQ52jRljtotnn37NzzYmNgWmduF5tM1Ha6h4ntjxx1DvjrT/G1ow
E3gXuOUzxPIWZfu/5Rg6dy1jc52+grdSPHtYbQ9rO/h84C/s06lodqyKCBITKUrc
L9uqIzC/O0NfAaF07xnUbEoZfqfonO3iiNYKfTJcBwWsxIpQxzxZnzepLIjZBkFd
yBHMroroSi+vrqsbpNJL7GKAkUoQN4TnWOb76FEo3TRg5nGVuV6BfbJzR0cR5u92
UkRif2rnuFDT5vMotc3Q1FjMwM17vLSRHhaY38PaQSK/7y5i/ukqzmfkIDEPf2kk
Qyca7GDmon2Mb7IKtiPHrfC0bLVwBJE099exIfdxGGuPvt9zmOnI8JJs9DNxglLM
KTpbfPGaeNnrAifSAt5EpHTKzSkk6xd2M92GyGcresUFulxEJY7HjIUy2aB8/IWR
f6fX6BFdFH5lUldZhpN6gtF5P4OTdiVo9ZhzjwYPblcqpogkV9za1vaKrDjvYA90
Bsd5eUudkGde0uVK5qoLsuojwjjsrc3uyH3/JImFsdQICcYwdEo=
=d/Xr
-----END PGP SIGNATURE-----
--=-=-=--

--===============1167782827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1167782827==--
