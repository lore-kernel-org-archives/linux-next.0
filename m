From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build warning after merge of the virtio tree
Date: Fri, 13 Mar 2015 15:52:51 +1030
Message-ID: <87r3stv5ck.fsf@rustcorp.com.au>
References: <20150313153157.2709e561@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53033 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750767AbbCMFg6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Mar 2015 01:36:58 -0400
In-Reply-To: <20150313153157.2709e561@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Rusty,
>
> After merging the virtio tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> net/9p/trans_virtio.c: In function 'p9_virtio_remove':
> net/9p/trans_virtio.c:662:7: warning: unused variable 'inuse' [-Wunused-variable]
>   bool inuse;
>        ^
>
> Introduced by commit 1991755689ad ("9p/trans_virtio: fix hot-unplug").
>
> Some of the whitespace is mucked up in that commit as well (some
> leading tabs, some leading spaces)

Hmm, I had a fix queued, but I'll just rebase and fix the whitespace
too.  And this:

WARNING: quoted string split across lines
#28: FILE: net/9p/trans_virtio.c:676:
+			dev_emerg(&vdev->dev, "p9_virtio_remove: "
+				  "waiting for device in use.\n");

Thanks,
Rusty.
