From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] hid-picolcd_cir: fix compilation
Date: Wed, 31 Oct 2012 14:51:54 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1210311451340.12781@pobox.suse.cz>
References: <20121031082208.7522.22716.stgit@zeus.hardeman.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50733 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422848Ab2JaNv7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 31 Oct 2012 09:51:59 -0400
In-Reply-To: <20121031082208.7522.22716.stgit@zeus.hardeman.nu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?ISO-8859-15?Q?David_H=E4rdeman?= <david@hardeman.nu>
Cc: mchehab@infradead.org, sfr@canb.auug.org.au, bonbons@linux-vserver.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 31 Oct 2012, David H=C3=A4rdeman wrote:

> Commit c003ab1bedf0 ("[media] rc-core: add separate defines for
> protocol bitmaps and numbers") overlooked hid-picolcd.
>=20
> This patch (against git.linuxtv.org/media_tree.git, branch
> staging/for_v3.8) fixes the compilation breakage.
>=20
> Signed-off-by: David H=C3=A4rdeman <david@hardeman.nu>
> ---
>  drivers/hid/hid-picolcd_cir.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-picolcd_cir.c b/drivers/hid/hid-picolcd_=
cir.c
> index 13ca919..a79e95b 100644
> --- a/drivers/hid/hid-picolcd_cir.c
> +++ b/drivers/hid/hid-picolcd_cir.c
> @@ -116,7 +116,7 @@ int picolcd_init_cir(struct picolcd_data *data, s=
truct hid_report *report)
> =20
>  	rdev->priv             =3D data;
>  	rdev->driver_type      =3D RC_DRIVER_IR_RAW;
> -	rdev->allowed_protos   =3D RC_TYPE_ALL;
> +	rdev->allowed_protos   =3D RC_BIT_ALL;
>  	rdev->open             =3D picolcd_cir_open;
>  	rdev->close            =3D picolcd_cir_close;
>  	rdev->input_name       =3D data->hdev->name;

This has been reported by Stephen a few days ago already ... Mauro, any=
=20
plans to have that fixed up in media tree please?

Thanks,

--=20
Jiri Kosina
SUSE Labs
