From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [BUG] linux-next: Tree for August 21 - WARNING: at
	fs/sysfs/dir.c:465 sysfs_add_one()
Date: Thu, 21 Aug 2008 12:23:15 -0700
Message-ID: <20080821192315.GA17600@suse.de>
References: <20080821191253.ba180d5e.sfr@canb.auug.org.au> <48ADC08C.6030406@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <48ADC08C.6030406-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamalesh Babulal <kamalesh-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Whitcroft <apw-26w3C0LaAnFg9hUCZPvPmw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 22, 2008 at 12:52:52AM +0530, Kamalesh Babulal wrote:
> Hi,
> 
> while booting up the next-20080821 kernel on x86 machine, warning shows up for sysfs_add_one
> of acpi getting called twice

See lkml, patches to resolve this have been posted.

thanks,

greg k-h
