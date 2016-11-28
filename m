From: Barry Day <briselec@gmail.com>
Subject: Re: linux-next: build warning after merge of the
 wireless-drivers-next tree
Date: Mon, 28 Nov 2016 18:16:51 +1000
Message-ID: <20161128081649.GA8403@testbox>
References: <20161128115814.2cabf139@canb.auug.org.au>
 <87d1hg83rp.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87d1hg83rp.fsf@kamboji.qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jes Sorensen <Jes.Sorensen@redhat.com>, Wireless <linux-wireless@vger.kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Nov 28, 2016 at 09:25:30AM +0200, Kalle Valo wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Hi all,
> >
> > After merging the wireless-drivers-next tree, today's linux-next build
> > (x86_64 allmodconfig) produced this warning:
> >
> > In file included from include/linux/usb/ch9.h:35:0,
> >                  from include/linux/usb.h:5,
> >                  from drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:32:
> > drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c: In function 'rtl8xxxu_fill_txdesc_v2':
> > include/linux/device.h:1214:36: warning: 'rate' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >  #define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
> >                                     ^
> > drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:4841:6: note: 'rate' was declared here
> >   u32 rate;
> >       ^
> >
> > Introduced by commit
> >
> >   b4c3d9cfb607 ("rtl8xxxu: Pass tx_info to fill_txdesc in order to have access to retry count")
> >
> > This is a correct diagnosis.
> 
> Thanks for the report. Jes, can you send a patch to fix this? (Unless
> someone else beats to it.)
> 
> -- 
> Kalle Valo

I posted a patch on the 26th that fixes this

Barry
