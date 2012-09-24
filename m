From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] irqchip: fill in empty Kconfig
Date: Mon, 24 Sep 2012 10:09:36 -0700
Message-ID: <CAOesGMjv6nU3vH0KX56ib2ptLsDOR9KrDvGngHNLAmdBLyML+w@mail.gmail.com>
References: <1348506174-28641-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:40293 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756728Ab2IXRJi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Sep 2012 13:09:38 -0400
Received: by lbbgj3 with SMTP id gj3so7067339lbb.19
        for <linux-next@vger.kernel.org>; Mon, 24 Sep 2012 10:09:37 -0700 (PDT)
In-Reply-To: <1348506174-28641-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: arm@kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@xenotime.net>, Simon Arlott <simon@fire.lp0.eu>, Chris Boot <bootc@bootc.net>, Dom Cobley <popcornmix@gmail.com>

Hi,

On Mon, Sep 24, 2012 at 10:02 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> Commit 89214f0 "ARM: bcm2835: add interrupt controller driver" added an
> empty drivers/irqchip/Kconfig. Empty files apparently don't work well
> with git (sometimes, with some versions?) so add some dummy content to
> resolve this issue.

Applied to arm-soc. Thanks.


-Olof
