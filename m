From: Luciano Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with
 the wireless-drivers tree
Date: Thu, 26 Apr 2018 10:38:11 +0300
Message-ID: <6f5ba028f120d092bd5c96557144750518faf9c1.camel@intel.com>
References: <20180426110917.446204af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180426110917.446204af-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux-Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Haim Dreyfuss <haim.dreyfuss-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Shaul Triebitz <shaul.triebitz-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2018-04-26 at 11:09 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the wireless-drivers-next tree got a
> conflict in:
> 
>   drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
> 
> between commit:
> 
>   77e30e10ee28 ("iwlwifi: mvm: query regdb for wmm rule if needed")
> 
> from the wireless-drivers tree and commits:
> 
>   9c4f7d512740 ("iwlwifi: move all NVM parsing code to the common
> files")
>   4c625c564ba2 ("iwlwifi: get rid of fw/nvm.c")
> 
> from the wireless-drivers-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your
> tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any
> particularly
> complex conflicts.

Thanks for resolving this, Stephen!

I checked your resolution and it's spot on.

--
Cheers,
Luca.
