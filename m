From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: Tree for Aug 20 (media: gspca)
Date: Mon, 20 Aug 2012 17:23:02 -0300
Message-ID: <50329CA6.6000705@redhat.com>
References: <20120820192336.1be51b225ce2883bdcad5b15@canb.auug.org.au> <50325AE5.8060304@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50325AE5.8060304@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Em 20-08-2012 12:42, Randy Dunlap escreveu:
> On 08/20/12 02:23, Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> Changes since 20120817:
>>
> 
> 
> on x86_64:
> 
> gspca.c:(.text+0x22aa81): undefined reference to `usb_alloc_urb'
> gspca.c:(.text+0x22aaad): undefined reference to `usb_alloc_coherent'
> gspca.c:(.text+0x22ac38): undefined reference to `usb_submit_urb'
> gspca.c:(.text+0x22af0a): undefined reference to `usb_free_coherent'
> gspca.c:(.text+0x22af12): undefined reference to `usb_free_urb'
> gspca.c:(.text+0x22af6c): undefined reference to `usb_ifnum_to_if'
> gspca.c:(.text+0x22afef): undefined reference to `usb_kill_urb'
> gspca.c:(.text+0x22b00a): undefined reference to `usb_free_coherent'
> gspca.c:(.text+0x22b0f9): undefined reference to `usb_set_interface'
> gspca.c:(.text+0x22b539): undefined reference to `usb_ifnum_to_if'
> gspca.c:(.text+0x22b64e): undefined reference to `usb_set_interface'
> gspca.c:(.text+0x22b6af): undefined reference to `usb_clear_halt'
> 
> 
> when CONFIG_USB_SUPPORT is not enabled.
> 
> Full randconfig file is attached.

Randy,

Thanks for the report!

Not really sure why it failed here... I suspect it is because:

menu "Media USB Adapters"
       visible if USB && MEDIA_SUPPORT

doesn't do the same as:

menuconfig MEDIA_USB_SUPPORT
       bool "Media USB Adapters"
       depends on USB && MEDIA_SUPPORT

Anyway, there is one patch on my experimental tree changes from one
syntax into the other one:

http://git.linuxtv.org/mchehab/experimental.git/commitdiff/6dbbfefe6c101d617670c486b1aa665e09df5244

Testing your randconfig against my experimental tree, after the above
patch, fixed it.

As I'm waiting for some feedback on this (hopefully) final series
of reorg patches, I'll wait until tomorrow before merging it at
-next.

Thanks!
Mauro
