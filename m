From: Bin Liu <b-liu@ti.com>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Date: Thu, 15 Mar 2018 17:47:27 -0500
Message-ID: <20180315224727.GC73@LTA0271908.dhcp.ti.com>
References: <20180316091355.2d2b7b04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180316091355.2d2b7b04@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Aaron Wu <aaron.wu@analog.com>
List-Id: linux-next.vger.kernel.org

Hi,

On Fri, Mar 16, 2018 at 09:13:55AM +1100, Stephen Rothwell wrote:
> Hi Arnd,
> 
> After merging the asm-generic tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/usb/musb/musb_host.c: In function 'musb_rx_reinit':
> drivers/usb/musb/musb_host.c:577:10: error: 'struct musb' has no member named 'double_buffer_not_ok'
>   if (musb->double_buffer_not_ok)
>           ^~
> drivers/usb/musb/musb_host.c: In function 'musb_ep_program':
> drivers/usb/musb/musb_host.c:807:12: error: 'struct musb' has no member named 'double_buffer_not_ok'
>     if (musb->double_buffer_not_ok) {
>             ^~
> 
> Caused by commit
> 
>   8312c0cad792 ("usb: musb: remove blackfin port")

I don't have a clone of the asm-generic tree to check, but this patch
Arnd sent yesterday for review doesn't remove double_buffer_not_ok from
struct musb. Is it removed when Arnd you were revising it based on my
review comments? Anyway, it is better to remove it too since this flag
is Blackfin specific, but...

> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 16 Mar 2018 08:58:41 +1100
> Subject: [PATCH] usb: musb: more blackfin removal
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

...is it possible to combine this fixup patch with the original patch to
avoid bisect headache in the future?

Regards,
-Bin.
