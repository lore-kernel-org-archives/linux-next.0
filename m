From: Kevin Hilman <khilman@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the pm tree
Date: Tue, 27 Aug 2013 08:30:32 -0700
Message-ID: <87wqn7w3qf.fsf@linaro.org>
References: <20130827183313.aa7d51c6dd0b21cd8168aa35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:56336 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310Ab3H0Pag (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2013 11:30:36 -0400
Received: by mail-pa0-f49.google.com with SMTP id ld10so4905677pab.8
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2013 08:30:36 -0700 (PDT)
In-Reply-To: <20130827183313.aa7d51c6dd0b21cd8168aa35@canb.auug.org.au>
	(Stephen Rothwell's message of "Tue, 27 Aug 2013 18:33:13 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-mvebu/platsmp.c between commit f6cec7cd0777 ("ARM: mvebu:
> remove device tree parsing for cpu nodes") from the  tree and commit
> 994c8c94b419 ("ARM: mvebu: Remove the harcoded BootROM window
> allocation") from the arm-soc tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Fix looks correct, thanks.

Kevin (for arm-soc folks)
