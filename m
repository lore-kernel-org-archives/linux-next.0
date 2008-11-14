From: "J.R. Mauro" <jrm8005@gmail.com>
Subject: Re: linux-next: Tree for November 14 (staging#2)
Date: Fri, 14 Nov 2008 17:13:07 -0500
Message-ID: <3aaafc130811141413u7d1ee054g9690f1837d96ae6d@mail.gmail.com>
References: <20081114184021.ed198f4b.sfr@canb.auug.org.au>
	 <20081114101111.f138c2ba.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755015AbYKNWNU@vger.kernel.org>
In-Reply-To: <20081114101111.f138c2ba.randy.dunlap@oracle.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 14, 2008 at 1:11 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> On Fri, 14 Nov 2008 18:40:21 +1100 Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20081113:
>>
>> New tree:
>>       staging
>
> ERROR: "usb_deregister" [drivers/staging/asus_oled/asus_oled.ko] undefined!
> ERROR: "usb_get_dev" [drivers/staging/asus_oled/asus_oled.ko] undefined!
> ERROR: "usb_bulk_msg" [drivers/staging/asus_oled/asus_oled.ko] undefined!
> ERROR: "usb_put_dev" [drivers/staging/asus_oled/asus_oled.ko] undefined!
> ERROR: "usb_register_driver" [drivers/staging/asus_oled/asus_oled.ko] undefined!
>
> (CONFIG_USB=n)

Randy,

Can you send the whole .config? I turned off USB and asus_oled still
built, but it's hard to narrow down due to all the other staging build
failures.

Thanks
~J.R.

>
> ---
> ~Randy
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
