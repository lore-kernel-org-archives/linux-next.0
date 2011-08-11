From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (wireless & staging trees related)
Date: Thu, 11 Aug 2011 07:16:04 -0700
Message-ID: <20110811141604.GA14763@suse.de>
References: <20110811155529.e5f47afa0504c4ddef58ab37@canb.auug.org.au>
 <4E438D56.5020801@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E438D56.5020801-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vasanthakumar Thiagarajan <vthiagar-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Raja Mani <rmani-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 11, 2011 at 11:05:42AM +0300, Kalle Valo wrote:
> Hi Stephen,
> 
> On 08/11/2011 08:55 AM, Stephen Rothwell wrote:
> > After merging the final tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > drivers/staging/built-in.o: In function `aggr_recv_delba_req_evt':
> > (.opd+0x23a60): multiple definition of `aggr_recv_delba_req_evt'
> > drivers/net/built-in.o:(.opd+0x79980): first defined here
> > drivers/staging/built-in.o: In function `.wlan_node_reclaim':
> > (.text+0x303360): multiple definition of `.wlan_node_reclaim'
> > drivers/net/built-in.o:(.text+0xdd0618): first defined here
> > drivers/staging/built-in.o: In function `aggr_init':
> > (.opd+0x23a00): multiple definition of `aggr_init'
> > drivers/net/built-in.o:(.opd+0x79968): first defined here
> > drivers/staging/built-in.o: In function `.aggr_recv_delba_req_evt':
> > (.text+0x302614): multiple definition of `.aggr_recv_delba_req_evt'
> > drivers/net/built-in.o:(.text+0xdc8b60): first defined here
> > drivers/staging/built-in.o: In function `.wlan_node_table_cleanup':
> > (.text+0x303888): multiple definition of `.wlan_node_table_cleanup'
> > drivers/net/built-in.o:(.text+0xdd0a6c): first defined here
> > 
> > You get the idea. :-(  So, the ath6kl driver now exists in the wireless
> > tree and the staging tree.
> > 
> > I applied this patch for today (I have elided the part from "rm -rf
> > drivers/staging/ath6kl"):
> 
> Oh man, sorry about this (again). I did compile both drivers at the same
> time, but only as modules and didn't realise the conflicts also with the
> staging driver.
> 
> Yes, the cleaned up version of ath6kl is now in wireless-next and the
> staging version can be removed in 3.2. Greg, how do you want to handle
> removal of the staging version? Should I send a patch to you removing
> it? Or should I send the patch to John?

Just tell me.  Should I really delete drivers/staging/ath6kl/ for the
3.2 kernel release?  If so, I'll gladly do so in my tree so linux-next
will be fine for issues like this in the future.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
