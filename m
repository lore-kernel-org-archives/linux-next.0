From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in em-x270.c
Date: Tue, 6 Mar 2012 20:22:29 +0800
Message-ID: <CAN1soZyZwi5O089WedOzX-1h4SFKHF9kf=cBxM+3J08FA1RBvA@mail.gmail.com>
References: <1330989122-6323-1-git-send-email-paul.gortmaker@windriver.com>
	<4F55CEDB.90909@compulab.co.il>
	<CAN1soZxdT=N1BtK5Jf4+Qu3GGCHPuKK1BqgfEV-D7QorjnsLpg@mail.gmail.com>
	<20120306121627.GM19635@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:37757 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030501Ab2CFMW3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 07:22:29 -0500
Received: by vbbff1 with SMTP id ff1so4371792vbb.19
        for <linux-next@vger.kernel.org>; Tue, 06 Mar 2012 04:22:29 -0800 (PST)
In-Reply-To: <20120306121627.GM19635@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Igor Grinberg <grinberg@compulab.co.il>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>

On Tue, Mar 6, 2012 at 8:16 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Mar 06, 2012 at 05:12:18PM +0800, Haojian Zhuang wrote:
>
>> Could you pick up this patch since it's depend on latest change on r=
egulator?
>
> There's no direct dependency, there's been no need to use that struct
> member for years - should be safe to just apply via the PXA tree. =A0=
If
> you do want it to go via regulator please resend, I didn't keep a cop=
y
> of the patch.

OK. Let me merge this patch.

Best Regards
Haojian
