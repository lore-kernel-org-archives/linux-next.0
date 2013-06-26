From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: linux-next: manual merge of the cpuinit tree with the arm-current
 tree
Date: Wed, 26 Jun 2013 10:27:29 +0200
Message-ID: <51CAA5F1.2010001@free-electrons.com>
References: <20130626171241.4629f4072fbd36f12d5fe3be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([94.23.35.102]:47149 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349Ab3FZI1d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 04:27:33 -0400
In-Reply-To: <20130626171241.4629f4072fbd36f12d5fe3be@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On 06/26/2013 09:12 AM, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the cpuinit tree got a conflict in arch/arm/mm/proc-v7.S between commit 3e0a07f8c401 ("ARM: 7773/1: PJ4B: Add support for errata 4742") from the arm-current
> tree and commit "arm: delete __cpuinit/__CPUINIT usage from all ARM users" from the cpuinit tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action is required).
> 
>From my point of view it looks good.
Thanks,
-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
