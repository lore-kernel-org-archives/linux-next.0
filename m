From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: linux-next: manual merge of the voltage tree with the mfd tree
Date: Wed, 25 Nov 2009 11:56:32 +0000
Message-ID: <1259150192.3697.63.camel@odin>
References: <20091125175602.0e765187.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:49865 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758639AbZKYMC4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2009 07:02:56 -0500
In-Reply-To: <20091125175602.0e765187.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>, Samuel Ortiz <sameo@linux.intel.com>

Hi Stephen,

On Wed, 2009-11-25 at 17:56 +1100, Stephen Rothwell wrote:
> Hi Liam,
> 
> Today's linux-next merge of the voltage tree got a conflict in
> drivers/mfd/Kconfig between commit
> b60463644b8baea3c649faeb9d7c44c104f14588 ("mfd: Fix 88PM8607 I2C
> dependency") from the mfd tree and commit
> 258e3427f83a573d738344c2f5499da5e026e1df ("regulator: add 88PM8607 PMIC
> driver") from the voltage tree.
> 
> I fixed it up using the mfd tree version. ("depends on I2C=y" v "depends
> on I2C").

Thanks for letting me know and the fixup. Will you be carrying the fix ?

Thanks

Liam
