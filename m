From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: linux-next: error while fetching the spi-nor tree
Date: Tue, 12 Dec 2017 22:24:17 +0100
Message-ID: <12d92a91-bacc-38ae-9906-ac83ed32a0f6@wedev4u.fr>
References: <20171213075845.5923cc80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:63788 "EHLO smtp3-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752346AbdLLVYU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 16:24:20 -0500
In-Reply-To: <20171213075845.5923cc80@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

I've just added 2 commits about 8 hours ago, nothing special.
Could the issue be explained by an unlikely bad timing?

I don't see anything wrong when fetching the tree or when browsing the
web server:
http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/spi-nor/next

Please, let me know whether it was a spurious error or if it still doesn't
work. Currently, I don't know what's going on.

Anyway, thanks for your report.

Best regards,

Cyrille

Le 12/12/2017 à 21:58, Stephen Rothwell a écrit :
> Hi Cyrille,
> 
> Fetching the spi-nor tree
> (git://git.infradead.org/l2-mtd.git#spi-nor/next) this morning, I get
> theses errors:
> 
> remote: error: Could not read 6e408e3aa1643624ea7da50ad5b27a226a16a654
> remote: fatal: bad tree object 6e408e3aa1643624ea7da50ad5b27a226a16a654
> remote: aborting due to possible repository corruption on the remote side.
> fatal: protocol error: bad pack header
> 
> I wil continue to use the previously fetched tree.
> 
