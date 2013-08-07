From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the mvebu tree
Date: Wed, 7 Aug 2013 10:37:50 +0200
Message-ID: <20130807103750.743b389a@skate>
References: <20130807142501.79fea47cae17a6a25f1e719e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:58549 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756394Ab3HGIiW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2013 04:38:22 -0400
In-Reply-To: <20130807142501.79fea47cae17a6a25f1e719e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Dear Stephen Rothwell,

On Wed, 7 Aug 2013 14:25:01 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mvebu tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
> 
> arch/x86/kernel/x86_init.c:115:22: error: 'default_restore_msi_irqs' undeclared here (not in a function)
>   .restore_msi_irqs = default_restore_msi_irqs,
>                       ^

Thanks Stephen, I'm looking into this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
