From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 sound-asoc tree
Date: Wed, 14 Jun 2017 08:55:37 -0500
Message-ID: <CAL_Jsq+h8Bx9Ks8K8f6G7JJcouqChUEX40T4xosBdk+1GJiQiQ@mail.gmail.com>
References: <20170614125423.48266e23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f170.google.com ([209.85.161.170]:35841 "EHLO
        mail-yw0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750756AbdFNNz6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2017 09:55:58 -0400
In-Reply-To: <20170614125423.48266e23@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Tue, Jun 13, 2017 at 9:54 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   drivers/of/base.c
>
> between commits:
>
>   4c9c3d595f1b ("of_graph: add of_graph_get_remote_endpoint()")
>   0ef472a973eb ("of_graph: add of_graph_get_port_parent()")
>   ac1e6958d3be ("of_graph: add of_graph_get_endpoint_count()")
>
> from the sound-asoc tree and commit:
>
>   1df09bc66f9b ("of: Move OF property and graph API from base.c to property.c")
>
> from the devicetree tree.

Sakari, I forgot about these other changes and the resolution is more
complex than I want to pass on to Linus. Has the branch I provided
been pulled in (I guess not since this is the first I've seen of the
conflict)? We should drop the move for now and do it late in the merge
window or post -rc1. It can be after your other changes.

Rob
