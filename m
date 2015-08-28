From: Jiri Pirko <jiri@resnulli.us>
Subject: Re: linux-next: manual merge of the rdma tree with the net-next tree
Date: Fri, 28 Aug 2015 08:35:15 +0200
Message-ID: <20150828063515.GA2156@nanopsycho.orion>
References: <20150828112650.50b2ae58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:36431 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810AbbH1GfS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2015 02:35:18 -0400
Received: by wicgk12 with SMTP id gk12so11113786wic.1
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2015 23:35:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150828112650.50b2ae58@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matan Barak <matanb@mellanox.com>, Jiri Pirko <jiri@mellanox.com>

Fri, Aug 28, 2015 at 03:26:50AM CEST, sfr@canb.auug.org.au wrote:
>Hi Doug,
>
>Today's linux-next merge of the rdma tree got a conflict in:
>
>  net/core/dev.c
>
>between commit:
>
>  0e4ead9d7b36 ("net: introduce change upper device notifier change info")
>
>from the net-next tree and commit:
>
>  133b5b93c734 ("net: Add info for NETDEV_CHANGEUPPER event")
>
>from the rdma tree.
>
>They are doing very similar things, but not identical.
>
>I fixed it up (see bottom of email and the below extra patch) and can
>carry the fix as necessary (no action is required unless something more
>correct is supplied, of course).
>
>From: Stephen Rothwell <sfr@canb.auug.org.au>
>Date: Fri, 28 Aug 2015 11:14:38 +1000
>Subject: [PATCH] net: merge change upper notifier changes
>
>Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>---

<snip>

>diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>index 0aa7d19ac85e..4ce420487d07 100644
>--- a/include/linux/netdevice.h
>+++ b/include/linux/netdevice.h
>@@ -2115,13 +2115,22 @@ struct netdev_notifier_change_info {
> 	unsigned int flags_changed;
> };
> 
>+enum netdev_changeupper_event {
>+	NETDEV_CHANGEUPPER_LINK,
>+	NETDEV_CHANGEUPPER_UNLINK,
>+};
>+

I have this handled by "bool linking". So this is not needed.


> struct netdev_notifier_changeupper_info {
> 	struct netdev_notifier_info info; /* must be first */
>+	enum netdev_changeupper_event event;

	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



Other than this, looks good. Thanks

> 	struct net_device *upper_dev; /* new upper dev */
> 	bool master; /* is upper dev master */
> 	bool linking; /* is the nofication for link or unlink */
> };
> 
