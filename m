From: Mark McLoughlin <markmc@redhat.com>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Fri, 20 Mar 2009 08:24:37 +0000
Message-ID: <1237537477.4938.60.camel@blaa>
References: <20090320113242.bfe7fe62.sfr@canb.auug.org.au>
	 <1295ed070903192138y23ef0a67mf0e38d96cad54dc0@mail.gmail.com>
Reply-To: Mark McLoughlin <markmc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:41401 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753549AbZCTIY6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 04:24:58 -0400
In-Reply-To: <1295ed070903192138y23ef0a67mf0e38d96cad54dc0@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pantelis Koukousoulas <pktoss@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

Hi Pantelis,

On Fri, 2009-03-20 at 06:38 +0200, Pantelis Koukousoulas wrote:
> On Fri, Mar 20, 2009 at 2:32 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi David,
> >
> > Today's linux-next merge of the net tree got a conflict in
> > drivers/net/virtio_net.c between commit
> > 4783256ef92f5aecd6d54693b16386f2a0021c2a ("virtio_net: Make virtio_net
> > support carrier detection") from the net-current tree and commit
> > 9f4d26d0f3016cf8813977d624751b94465fa317 ("virtio_net: add link status
> > handling") from the net tree.
> >
> > I think that the latter patch means that the former is not needed, so I
> > used the version from the net tree.
> > --
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > http://www.canb.auug.org.au/~sfr/
> >
> 
> Hi,
> 
> The correct merge is so that the conflicting part becomes like this:
> 
> +       /* If we have no carrier info, the answer is "always on". */
>        vi->status = VIRTIO_NET_S_LINK_UP;
> +       netif_carrier_on(vi->dev);
> 
> I.e., you need to keep this netif_carrier_on(vi->dev) to maintain
> useful behavior
> for current/older versions of qemu that don't support link handling (because
> in this case VIRTIO_NET_S_LINK_UP will not cause netif_carrier_on to
> be called).

(Sorry, I missed the original discussion while on vacation)

The merge resolution looks fine ... although netif_carrier_on() isn't
really needed (it's the default) and, also, it's unusual to add a
comment in a merge resolution.

Probably best for davem to merge net-2.6 into net-next-2.6 in order to
sort it out.

Cheers,
Mark.
