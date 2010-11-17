From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: gadget: g_fs: Fix compilation warning
Date: Wed, 17 Nov 2010 13:25:55 -0800
Message-ID: <20101117212555.GB10541@kroah.com>
References: <20101117131427.fd26efd8.sfr@canb.auug.org.au>
 <20101116215906.GA2869@kroah.com>
 <0c1bd123752a7adc7f034ef81d155903da115081.1290007778.git.mina86@mina86.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0c1bd123752a7adc7f034ef81d155903da115081.1290007778.git.mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, Nov 17, 2010 at 05:09:47PM +0100, Michal Nazarewicz wrote:
> This commit fixes warning in f_fs.c introduced by "usb:
> gadget: f_fs: remove custom printk() wrappers":
> 
> In file included from drivers/usb/gadget/g_ffs.c:64:
> drivers/usb/gadget/f_fs.c:30:1: warning: "pr_fmt" redefined
> 
> Signed-off-by: Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>

Now queued up, thanks.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
