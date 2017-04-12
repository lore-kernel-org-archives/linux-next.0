From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mvebu tree with the arm-soc
 tree
Date: Wed, 12 Apr 2017 20:51:13 +1000
Message-ID: <20170412205113.5d96637c@canb.auug.org.au>
References: <20170412083404.76cda3b3@canb.auug.org.au>
        <87a87mhw5w.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56007 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751620AbdDLKvQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 06:51:16 -0400
In-Reply-To: <87a87mhw5w.fsf@free-electrons.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Eric Anholt <eric@anholt.net>

Hi Gregory,

On Wed, 12 Apr 2017 10:23:07 +0200 Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:
>
> How do you want to proceed with this conflict?
> 
> Do you want that I merged arm-soc/next/arm64 in my mvebu/defconfig64
> branch before applying my patch ?
> 
> Or do you prefer that I continue to base my branch on v4.11-rc1 and then
> you will take care of the conflict when pulling the branch?

The conflict is trivial, I would hope that it will be handled when they
merge your tree.

-- 
Cheers,
Stephen Rothwell
