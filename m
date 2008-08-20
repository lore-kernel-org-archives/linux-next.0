From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: linux-next: Tree for August 20
Date: Wed, 20 Aug 2008 14:36:56 -0700
Message-ID: <20080820143656.88a03e1f.akpm@linux-foundation.org>
References: <20080820190649.a63e3e00.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080820190649.a63e3e00.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Duncan Sands <duncan.sands-GANU6spQydw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, 20 Aug 2008 19:06:49 +1000
Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:

> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

drivers/usb/atm/usbatm.c: In function 'usbatm_extract_one_cell':
drivers/usb/atm/usbatm.c:347: error: implicit declaration of function 'warn'

due to

#define UDSL_ASSERT(x)  do { if (!(x)) warn("failed assertion '%s' at line %d", __stringify(x), __LINE__); } while(0)

which was quite clever really - neither drivers/usb/atm/usbatm.c nor
drivers/usb/atm/usbatm.h was changed.

config: http://userweb.kernel.org/~akpm/config-akpm2.txt  (it's x86_64)
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
