From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: including PHY tree in linux-next
Date: Mon, 24 Oct 2016 09:27:27 +1100
Message-ID: <20161024092727.4f01dce6@canb.auug.org.au>
References: <5808995C.3010300@ti.com>
        <20161021090041.46cc5fee@canb.auug.org.au>
        <58099C11.8050700@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38803 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754380AbcJWW13 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Oct 2016 18:27:29 -0400
In-Reply-To: <58099C11.8050700@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-next@vger.kernel.org

Hi Kishon,

On Fri, 21 Oct 2016 10:09:45 +0530 Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> I send pull request to gregkh. This tree contains USB, SATA and other PHYs
> except ethernet PHY. greg generally merges it into his USB tree.

OK, so I have put your trees after Gregs USB trees now.

> hmm.. I see atleast 4 drivers in drivers/phy which has just
> MODULE_LICENSE("GPL"). I can check if these can be changed to GPL v2.

I would not be too fussed about existing licenses.

-- 
Cheers,
Stephen Rothwell
