From: Inaky Perez-Gonzalez <inaky-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: linux-next: Tree for June 3 (rfkill)
Date: Thu, 4 Jun 2009 06:48:11 +0800
Message-ID: <200906040648.11839.inaky@linux.intel.com>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au> <4A26B0D2.3090207@oracle.com> <1244050400.22105.0.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1244050400.22105.0.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wimax-BPSAo7wm5JOHVYUYWc+uSQ@public.gmane.org
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wimax-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thursday 04 June 2009, Johannes Berg wrote:
> On Wed, 2009-06-03 at 10:20 -0700, Randy Dunlap wrote:
> > Ugh, there are similar errors in the wimax area, which doesn't
> > seem to mention RFKILL in its Kconfig file at all.  :(
>
> Guess it too will have to get a
>
> 	depends on RFKILL || !RFKILL
>
> I can take care of it after dinner.

Ugh...bitten again by Randy's evil autobuilder. Thanks for fixing
it, Johannes.

-- 
Inaky
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
