From: "Guy, Wey-Yi" <wey-yi.w.guy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for June 3 (iwlwifi)
Date: Thu, 03 Jun 2010 10:42:03 -0700
Message-ID: <1275586923.16009.0.camel@wwguy-ubuntu>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au>
	 <20100603085501.ac113779.randy.dunlap@oracle.com>
	 <20100603172114.GA14597@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100603172114.GA14597-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Chatre, Reinette" <reinette.chatre-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hi John,

On Thu, 2010-06-03 at 10:21 -0700, John W. Linville wrote:
> On Thu, Jun 03, 2010 at 08:55:01AM -0700, Randy Dunlap wrote:
> > On Thu, 3 Jun 2010 13:47:53 +1000 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20100602:
> > 
> > 
> > when CONFIG_IWLAGN=n:
> > 
> > drivers/net/wireless/iwlwifi/iwl-rx.c:254: error: 'struct iwl_priv' has no member named '_agn'
> > drivers/net/wireless/iwlwifi/iwl-rx.c:303: error: 'struct iwl_priv' has no member named '_agn'
> > drivers/net/wireless/iwlwifi/iwl-rx.c:304: error: 'struct iwl_priv' has no member named '_agn'
> > drivers/net/wireless/iwlwifi/iwl-rx.c:305: error: 'struct iwl_priv' has no member named '_agn'
> > drivers/net/wireless/iwlwifi/iwl-rx.c:306: error: 'struct iwl_priv' has no member named '_agn'
> > 
> > and many more.
> > 
> > Haven't we seen this movie before?
> 
> Ugh...caused be this:
> 
> commit a2064b7a4a22d118087898e4308670da7ac07911
> Author: Wey-Yi Guy <wey-yi.w.guy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Date:   Fri Apr 30 14:21:48 2010 -0700
> 
>     iwlwifi: move _agn statistics related structure
>     
>     agn and 3945 has different statistics_notif data structure; since 3945
>     has it statistics_notif data structure inside the _3945 portion of
>     iwl_priv, it make sense to move the agn statistics_notif into _agn portion.
>     
>     Signed-off-by: Wey-Yi Guy <wey-yi.w.guy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>     Signed-off-by: Reinette Chatre <reinette.chatre-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> Since iwl-rx.o is part of iwlcore.ko, this change seems wrong.
> Reinette, any reason why I shouldn't just revert it?
> 
Sorry for the mistake, please revert it and I will fix the issue and
re-submit.

Thanks
Wey

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
