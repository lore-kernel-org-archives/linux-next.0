From: John Whitmore <johnfwhitmore@gmail.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Date: Tue, 4 Sep 2018 10:04:07 +0100
Message-ID: <20180904090406.GB29158@xux707-tw>
References: <20180903120617.34f4f8cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903120617.34f4f8cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 03, 2018 at 12:06:17PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> WARNING: drivers/staging/rtl8192u/r8192u_usb: 'dot11d_init' exported twice. Previous export was in drivers/staging/rtl8192e/rtllib.ko
> 
> Introduced by commit
> 
>   c01f06b7506f ("staging:rtl8192u: Rename Dot11d_Init - Style")
> 
> -- 
> Cheers,
> Stephen Rothwell

Aragh, sorry my bad, and a newbie mistake. I now know to do more of a
check for exported symbols. If it had occured to me I'd not have touched
it.

I'm not sure what the procedure is, having written my first bug, but I'll
submit a patch to revert that change.

jwhitmore
