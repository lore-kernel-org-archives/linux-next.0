From: "Arend Van Spriel" <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: linux-next: Tree for November 22
Date: Mon, 22 Nov 2010 12:08:28 -0800
Message-ID: <400C43189542CE41BC0A5B252FC90136952F05944A@SJEXCHCCR02.corp.ad.broadcom.com>
References: <20101122134911.b7e106f9.sfr@canb.auug.org.au>
 <AANLkTi=QeU_vb6+XRei0pqz7GSfp2E4TC3oTJYy9adv4@mail.gmail.com>,<20101122194643.GB21985@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101122194643.GB21985-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Zimny Lech <napohybelskurwysynom2010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brett Rudley <brudley-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Henry Ptasinski <henryp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hi Greg, Stephen,

The file wl_iw.c declare a struct semaphore variable and uses semaphore function, but there is no explicit inclusion of <linux/semaphore.h>. I hit this problem last week when trying a minimal kernel configuration for my development system. Normally we build and test against kernel configuration similar to Ubuntu configuration and we got the semaphore definitions for free. Expect a patch soon.

Gr. AvS
________________________________________
From: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Greg KH [gregkh-l3A5Bk7waGM@public.gmane.org]
Sent: Monday, November 22, 2010 8:46 PM
To: Zimny Lech
Cc: Stephen Rothwell; linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; LKML; Brett Rudley; Henry Ptasinski; linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: Re: linux-next: Tree for November 22

On Mon, Nov 22, 2010 at 04:37:57PM +0100, Zimny Lech wrote:
> Salve
>
> 2010/11/22 Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>:
> > Hi all,
> >
> > Changes since 20101119:
> >
>
>
>   CC [M]  drivers/staging/brcm80211/brcmfmac/wl_iw.o
> /home/test/linux-2.6/drivers/staging/brcm80211/brcmfmac/wl_iw.c:130:19:
> error: field 'sysioc_sem' has incomplete type
> /home/test/linux-2.6/drivers/staging/brcm80211/brcmfmac/wl_iw.c: In
> function 'wl_iw_timerfunc':
> /home/test/linux-2.6/drivers/staging/brcm80211/brcmfmac/wl_iw.c:1070:4:
> error: implicit declaration of function 'up'
> /home/test/linux-2.6/drivers/staging/brcm80211/brcmfmac/wl_iw.c: In
> function '_iscan_sysioc_thread':
> /home/test/linux-2.6/drivers/staging/brcm80211/brcmfmac/wl_iw.c:1181:2:
> error: implicit declaration of function 'down_interruptible'
> /home/test/linux-2.6/drivers/staging/brcm80211/brcmfmac/wl_iw.c: In
> function 'wl_iw_attach':
> /home/test/linux-2.6/drivers/staging/brcm80211/brcmfmac/wl_iw.c:3708:2:
> error: implicit declaration of function 'sema_init'
> make[5]: *** [drivers/staging/brcm80211/brcmfmac/wl_iw.o] Error 1
> make[4]: *** [drivers/staging/brcm80211/brcmfmac] Error 2
> make[3]: *** [drivers/staging/brcm80211] Error 2
> make[2]: *** [drivers/staging] Error 2
> make[1]: *** [drivers] Error 2
> make: *** [sub-make] Error 2
>

Ick, not good.

Henry, Brett, any ideas?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
