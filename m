From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] ar9170: fix build when !CONFIG_PM
Date: Mon, 4 May 2009 20:51:05 +0400
Message-ID: <a4423d670905040951s2499539cg7bdd5c4f31b97329@mail.gmail.com>
References: <1241455585-436-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.186]:2125 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756299AbZEDQvG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 12:51:06 -0400
Received: by fk-out-0910.google.com with SMTP id 18so1956275fkq.5
        for <linux-next@vger.kernel.org>; Mon, 04 May 2009 09:51:05 -0700 (PDT)
In-Reply-To: <1241455585-436-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, Christian Lamparter <chunkeey@web.de>, Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>

=46ix wrong Christian's mail-address.

2009/5/4 Alexander Beregalov <a.beregalov@gmail.com>:
> Fix this build error when CONFIG_PM is not set:
> drivers/net/wireless/ath/ar9170/usb.c: In function 'ar9170_usb_probe'=
:
> drivers/net/wireless/ath/ar9170/usb.c:692:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0error: 'struct usb_device' has no member n=
amed 'reset_resume'
>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
> =C2=A0drivers/net/wireless/ath/ar9170/usb.c | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ar9170/usb.c b/drivers/net/wire=
less/ath/ar9170/usb.c
> index d7b562d..d7c13c0 100644
> --- a/drivers/net/wireless/ath/ar9170/usb.c
> +++ b/drivers/net/wireless/ath/ar9170/usb.c
> @@ -689,7 +689,9 @@ static int ar9170_usb_probe(struct usb_interface =
*intf,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0aru->common.exec_cmd =3D ar9170_usb_exec_c=
md;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0aru->common.callback_cmd =3D ar9170_usb_ca=
llback_cmd;
>
> +#ifdef CONFIG_PM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0udev->reset_resume =3D 1;
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D ar9170_usb_reset(aru);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_freeh=
w;
> --
> 1.6.2.3
>
>
