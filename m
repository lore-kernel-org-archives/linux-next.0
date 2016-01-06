From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Wed, 06 Jan 2016 03:15:04 +0100
Message-ID: <3075970.WbB6DJDsOa@vostro.rjw.lan>
References: <20160106123911.2fff44b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:47048 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751978AbcAFBoX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2016 20:44:23 -0500
In-Reply-To: <20160106123911.2fff44b3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, Loc Ho <lho@apm.com>

On Wednesday, January 06, 2016 12:39:11 PM Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> Today's linux-next merge of the pm tree got a conflict in:
> 
>   drivers/i2c/busses/i2c-designware-platdrv.c
> 
> between commit:
> 
>   90708ce22b48 ("i2c: designware: Add support for AMD Seattle I2C")
> 
> from the i2c tree and commit:
> 
>   a90410e8ae3f ("i2c: dw: Add APM X-Gene ACPI I2C device support")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me and thanks for taking care of this!

Rafael
