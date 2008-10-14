From: "Alexey Klimov" <klimov.linux@gmail.com>
Subject: Re: linux-next: manual merge of the usb tree
Date: Tue, 14 Oct 2008 09:44:07 +0400
Message-ID: <208cbae30810132244k89e8ce7p5d7423c008a5fc77@mail.gmail.com>
References: <20081014143137.007fe44c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qb-out-0506.google.com ([72.14.204.239]:22419 "EHLO
	qb-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958AbYJNFoJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Oct 2008 01:44:09 -0400
Received: by qb-out-0506.google.com with SMTP id f11so2060210qba.17
        for <linux-next@vger.kernel.org>; Mon, 13 Oct 2008 22:44:08 -0700 (PDT)
In-Reply-To: <20081014143137.007fe44c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Douglas Schilling Landgraf <dougsland@gmail.com>

Hi, all

On Tue, Oct 14, 2008 at 7:31 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> Today's linux-next merge of the usb tree got a conflict in
> drivers/media/radio/dsbr100.c between commit
> 90b698dd47f3929f20746f828e2cd648bc6539dd ("V4L/DVB (9151): dsbr100: Add
> returns and fix codingstyle for vidioc_s_ctrl") from Linus' tree and
> commit 58e43f3f48c28cc35be7502b5aa81ce53de51815 ("USB: remove warn()
> macro from usb media drivers") from the usb tree.

Let's see the flight of time: i sent this patch to v4l-dvb team, may
be simultaneously warn()-statements were removed from all usb-devices,
but i didn't saw it. Actually i didn't know about it. (I saw patch
about removing info()-macros) Probably there is bad delay between
USB-subsystem-tree and V4L-tree.

> Just trivial overlaps.  I fixed it up (see below).
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
> diff --cc drivers/media/radio/dsbr100.c
> index 66783ff,bbd237d..0000000
> --- a/drivers/media/radio/dsbr100.c
> +++ b/drivers/media/radio/dsbr100.c
> @@@ -360,15 -360,13 +360,17 @@@ static int vidioc_s_ctrl(struct file *f
>        switch (ctrl->id) {
>        case V4L2_CID_AUDIO_MUTE:
>                if (ctrl->value) {
>  -                      if (dsbr100_stop(radio)==-1)
>  +                      if (dsbr100_stop(radio) == -1) {
> -                               warn("Radio did not respond properly");
> +                               dev_warn(&radio->usbdev->dev,
> +                                        "Radio did not respond properly\n");
>  +                              return -EBUSY;
>  +                      }
>                } else {
>  -                      if (dsbr100_start(radio)==-1)
>  +                      if (dsbr100_start(radio) == -1) {
> -                               warn("Radio did not respond properly");
> +                               dev_warn(&radio->usbdev->dev,
> +                                        "Radio did not respond properly\n");
>  +                              return -EBUSY;
>  +                      }
>                }
>                return 0;
>        }
> @@@ -416,9 -413,9 +418,10 @@@ static int usb_dsbr100_open(struct inod
>        radio->muted = 1;
>
>        if (dsbr100_start(radio)<0) {
> -               warn("Radio did not start up properly");
> +               dev_warn(&radio->usbdev->dev,
> +                        "Radio did not start up properly\n");
>                radio->users = 0;
>  +              unlock_kernel();
>                return -EIO;
>        }
>        dsbr100_setfreq(radio, radio->curfreq);

-- 
Best regards, Klimov Alexey
