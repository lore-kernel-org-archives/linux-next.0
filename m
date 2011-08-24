From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Wed, 24 Aug 2011 14:16:46 -0700
Message-ID: <20110824211646.GB9707@kroah.com>
References: <20110824154741.3cbe03b403b646e2a99d63a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110824154741.3cbe03b403b646e2a99d63a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, edwin_rong <edwin_rong@realsil.com.cn>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 24, 2011 at 03:47:41PM +1000, Stephen Rothwell wrote:
> Hi ,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/staging/rts5139/rts51x_scsi.c: In function 'inquiry':
> drivers/staging/rts5139/rts51x_scsi.c:498:2: error: implicit declaration of function 'vmalloc'
> drivers/staging/rts5139/xd.c: In function 'xd_init_l2p_tbl':
> drivers/staging/rts5139/xd.c:745:2: error: implicit declaration of function 'vmalloc'
> drivers/staging/rts5139/xd.c: In function 'free_zone':
> drivers/staging/rts5139/xd.c:771:3: error: implicit declaration of function 'vfree'
> drivers/staging/rts5139/ms.c: In function 'ms_init_l2p_tbl':
> drivers/staging/rts5139/ms.c:2214:2: error: implicit declaration of function 'vmalloc'
> drivers/staging/rts5139/ms.c:2257:3: error: implicit declaration of function 'vfree'
> 
> Caused by commit 1dac4186bcc6 ("Staging: add driver for Realtek RTS5139
> cardreader").
> 
> I have reverted that commit for today.

To fix it, all we have to do is include linux/vmalloc.h, right?  Or is
ppc "special" in some other way regarding this call?

thanks,

greg k-h
