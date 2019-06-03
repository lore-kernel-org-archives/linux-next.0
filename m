From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: linux-next: unable to fetch the mvebu tree
Date: Mon, 03 Jun 2019 16:11:51 +0200
Message-ID: <87y32ikbbs.fsf@FE-laptop>
References: <20190603082346.7bd1d7a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603082346.7bd1d7a4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> Hi all,
>
> Tyring to fetch the mvebu tree
> (git://git.infradead.org/linux-mvebu.git#for-next) for the past several
> days produces this error message:
>
> fatal: Couldn't find remote ref refs/heads/for-next

Sorry for this, the main reason was that I didn't create a for-next
branch for this new cycle.

I was waiting for 5.2-rc1 and then didn't take time to merge our current
branches in the for-next branch.

But now it should be available.

Gregory

>
> -- 
> Cheers,
> Stephen Rothwell

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
