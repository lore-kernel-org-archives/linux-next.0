From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with the wireless-drivers tree
Date: Thu, 18 Apr 2019 16:49:24 +0300
Message-ID: <87k1fr2zkr.fsf@kamboji.qca.qualcomm.com>
References: <20190415120853.39e0e46a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190415120853.39e0e46a-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> (Stephen Rothwell's
        message of "Mon, 15 Apr 2019 12:08:53 +1000")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ihab Zhaika <ihab.zhaika-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Luca Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> writes:

> Today's linux-next merge of the wireless-drivers-next tree got a
> conflict in:
>
>   drivers/net/wireless/intel/iwlwifi/pcie/drv.c
>
> between commits:
>
>   0d5bad14226a ("iwlwifi: rename structs to fit the new names")
>   972d8e137779 ("iwlwifi: add new 0x2723/0x2080 card for 22000")
>
> from the wireless-drivers tree and commit:
>
>   ef8a913766cd ("iwlwifi: remove misconfigured pci ids from 22260 series")
>
> from the wireless-drivers-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, I'll let Dave know about this when he pulls w-d-next.

-- 
Kalle Valo
