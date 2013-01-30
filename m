From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Wed, 30 Jan 2013 13:50:34 +0100
Message-ID: <1566561.03jnTAp6bm@vostro.rjw.lan>
References: <20130130194841.abd832c601b21c3e67aae4f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hydra.sisk.pl ([212.160.235.94]:60989 "EHLO hydra.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751851Ab3A3MoX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jan 2013 07:44:23 -0500
In-Reply-To: <20130130194841.abd832c601b21c3e67aae4f6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Wednesday, January 30, 2013 07:48:41 PM Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/built-in.o: In function `ipc_init':
> pl320-ipc.c:(.init.text+0xf96b): undefined reference to `amba_driver_register'
> 
> Caused by commit 970066f5b269 ("ARM / highbank: add support for pl320 IPC").
> 
> I have used the pm tree from next-20130128 for today.

Sorry for the breakage.  I'm not sure why that hasn't been caught by the
automatic build testing.  Anyway, I've dropped the whole cpufreq material
from my linux-next branch for now.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
