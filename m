From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 17 Oct 2017 14:30:29 +0300
Message-ID: <dbf0a501-7dcf-82ff-6fbf-000d66a68e18@cogentembedded.com>
References: <20171016093635.zxyyq2px4hdewse3@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:50803 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932834AbdJQLab (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2017 07:30:31 -0400
Received: by mail-lf0-f42.google.com with SMTP id a132so1592408lfa.7
        for <linux-next@vger.kernel.org>; Tue, 17 Oct 2017 04:30:30 -0700 (PDT)
In-Reply-To: <20171016093635.zxyyq2px4hdewse3@sirena.co.uk>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hello!

On 10/16/2017 12:36 PM, Mark Brown wrote:

> Today's linux-next merge of the net-next tree got a conflict in:
> 
>    drivers/net/dsa/mv88e6060.c
> 
> between commit:
> 
>    3efc93c2bc243 ("net: dsa: mv88e6060: fix switch MAC address")
> 
> from the net tree and commit:
> 
>    56c3ff9bf23e1 ("net: dsa: mv88e6060: setup random mac address")
> 
> from the net-next tree.
> 
> I fixed it up (see below, the relevant code was deleted in net-next) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 
> diff --cc drivers/net/dsa/mv88e6060.c
> index f123ed57630d,6173be889d95..000000000000
> --- a/drivers/net/dsa/mv88e6060.c
> +++ b/drivers/net/dsa/mv88e6060.c

    Your mail ends here.

MBR, Sergei
