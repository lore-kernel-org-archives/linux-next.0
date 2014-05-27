From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH linux-next] imx-drm: imx-tve: remove unused variable
Date: Tue, 27 May 2014 14:56:22 +0200
Message-ID: <20140527125622.GA14841@phenom.ffwll.local>
References: <1401054854-20932-1-git-send-email-vincent.stehle@laposte.net>
 <20140525221235.GA26619@kroah.com>
 <20140526091252.2a4496d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:59833 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869AbaE0M7V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2014 08:59:21 -0400
Received: by mail-we0-f181.google.com with SMTP id w61so9686171wes.12
        for <linux-next@vger.kernel.org>; Tue, 27 May 2014 05:59:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140526091252.2a4496d4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Dave Airlie <airlied@linux.ie>

On Mon, May 26, 2014 at 09:12:52AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Sun, 25 May 2014 15:12:35 -0700 Greg Kroah-Hartman <gregkh@linuxfo=
undation.org> wrote:
> >
> > On Sun, May 25, 2014 at 11:54:14PM +0200, Vincent Stehl=C3=A9 wrote=
:
> > > Commit f9b0e251dfbf 'drm: make mode_valid callback optional' left=
 variable ret
> > > unused; remove it.
> > >=20
> > > This fixes the following compilation warning:
> > >=20
> > >   drivers/staging/imx-drm/imx-tve.c: In function =E2=80=98imx_tve=
_connector_mode_valid=E2=80=99:
> > >   drivers/staging/imx-drm/imx-tve.c:252:6: warning: unused variab=
le =E2=80=98ret=E2=80=99 [-Wunused-variable]
> >=20
> > It doesn't apply to my tree :(
>=20
> Yeah, commit f9b0e251dfbf 'drm: make mode_valid callback optional' is
> in the drm tree, so this patch needs to go to Dave Airlie (cc'd).
> Though Daniel Vetter may want to send it on.
>=20
> For Dave's benefit, here is the patch again:

I've pulled it into my drm-stuff branch so it doesn't get lost. Should
land in 3.16 one way or the other.

Thanks, Daniel

>=20
> From:	Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
> Subject: [PATCH linux-next] imx-drm: imx-tve: remove unused variable
> Date:	Sun, 25 May 2014 23:54:14 +0200
>=20
> Commit f9b0e251dfbf 'drm: make mode_valid callback optional' left var=
iable ret
> unused; remove it.
>=20
> This fixes the following compilation warning:
>=20
>   drivers/staging/imx-drm/imx-tve.c: In function =E2=80=98imx_tve_con=
nector_mode_valid=E2=80=99:
>   drivers/staging/imx-drm/imx-tve.c:252:6: warning: unused variable =E2=
=80=98ret=E2=80=99 [-Wunused-variable]
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>=20
> Hi,
>=20
> This can be seen with e.g. linux next-20140523 and arm allmodconfig.
>=20
> Best regards,
>=20
> V.
>=20
>  drivers/staging/imx-drm/imx-tve.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/imx-drm/imx-tve.c b/drivers/staging/imx-=
drm/imx-tve.c
> index 3e8b0a1..4caef2b1 100644
> --- a/drivers/staging/imx-drm/imx-tve.c
> +++ b/drivers/staging/imx-drm/imx-tve.c
> @@ -249,7 +249,6 @@ static int imx_tve_connector_mode_valid(struct dr=
m_connector *connector,
>  {
>  	struct imx_tve *tve =3D con_to_tve(connector);
>  	unsigned long rate;
> -	int ret;
> =20
>  	/* pixel clock with 2x oversampling */
>  	rate =3D clk_round_rate(tve->clk, 2000UL * mode->clock) / 2000;
> --=20
> 2.0.0.rc2
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
