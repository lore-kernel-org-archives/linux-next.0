From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the mfd tree
Date: Wed, 24 Aug 2011 00:16:33 +0200
Message-ID: <201108240016.33529.rjw@sisk.pl>
References: <20110823135619.be8b64d2eec7cb78bc0160a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:32926 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754712Ab1HWWOp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Aug 2011 18:14:45 -0400
In-Reply-To: <20110823135619.be8b64d2eec7cb78bc0160a8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Tuesday, August 23, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> drivers/mfd/twl4030-irq.c between commit 99efe0d4c992 ("mfd: Drop the
> twl4030-irq kthread") from the mfd tree and commit febab68efa45
> ("freezer: don't unnecessarily set PF_NOFREEZE explicitly") from the pm
> tree.
> 
> The former dropped the code modified by the latter, so I did that.

Thanks!

Unfortunately, I don't think we can really fix that other that making
one tree depend on the other.
