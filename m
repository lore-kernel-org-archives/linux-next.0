From: Pantelis Koukousoulas <pktoss@gmail.com>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Fri, 20 Mar 2009 06:38:05 +0200
Message-ID: <1295ed070903192138y23ef0a67mf0e38d96cad54dc0@mail.gmail.com>
References: <20090320113242.bfe7fe62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:43437 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752082AbZCTEiI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 00:38:08 -0400
Received: by ewy9 with SMTP id 9so610739ewy.37
        for <linux-next@vger.kernel.org>; Thu, 19 Mar 2009 21:38:05 -0700 (PDT)
In-Reply-To: <20090320113242.bfe7fe62.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Mark McLoughlin <markmc@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>

On Fri, Mar 20, 2009 at 2:32 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi David,
>
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/virtio_net.c between commit
> 4783256ef92f5aecd6d54693b16386f2a0021c2a ("virtio_net: Make virtio_net
> support carrier detection") from the net-current tree and commit
> 9f4d26d0f3016cf8813977d624751b94465fa317 ("virtio_net: add link status
> handling") from the net tree.
>
> I think that the latter patch means that the former is not needed, so I
> used the version from the net tree.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>

Hi,

The correct merge is so that the conflicting part becomes like this:

+       /* If we have no carrier info, the answer is "always on". */
       vi->status = VIRTIO_NET_S_LINK_UP;
+       netif_carrier_on(vi->dev);

I.e., you need to keep this netif_carrier_on(vi->dev) to maintain
useful behavior
for current/older versions of qemu that don't support link handling (because
in this case VIRTIO_NET_S_LINK_UP will not cause netif_carrier_on to
be called).

Thanks,
Pantelis
