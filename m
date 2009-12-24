From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build warning
Date: Wed, 23 Dec 2009 16:51:27 -0800
Message-ID: <20091224005127.GA14997@kroah.com>
References: <20091224110109.37ac11c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754933AbZLXAv6@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091224110109.37ac11c9.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Neukum <oliver@neukum.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 24, 2009 at 11:01:09AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> drivers/usb/core/sysfs.c: In function 'set_reset_quirk':
> drivers/usb/core/sysfs.c:201: warning: unused variable 'value'
> 
> Introduced by commit 9bc2b949ea002c26fafa8c8aa82595ff56075d4f ("USB:
> Export USB_QUIRK_RESET_MORPHS through sysfs").

Thanks, I have a follow-up patch in my queue that fixes this.  I'll
merge it together.

greg k-h
