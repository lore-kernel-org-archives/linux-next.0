From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Tue, 27 Sep 2011 15:14:26 +0200
Message-ID: <20110927131426.GA21897@aftab>
References: <20110927151454.9892b23391f20bea20741c21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]:57603
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752090Ab1I0NQV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Sep 2011 09:16:21 -0400
Content-Disposition: inline
In-Reply-To: <20110927151454.9892b23391f20bea20741c21@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Frederic Weisbecker <fweisbec@gmail.com>

On Tue, Sep 27, 2011 at 01:14:54AM -0400, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in
> arch/x86/kernel/cpu/mcheck/mce.c between commit b77e70bf3535 ("x86, mce:
> Replace MCE_SELF_VECTOR by irq_work") from Linus' tree and commit
> ef14aea88fee ("x86: Call idle notifier after irq_enter()") from the rcu
> tree.
> 
> The commit in Linus' tree seem to superced the need for the rcu tree
> patch ... so I effectively dropped the rcu tree change to this file.

Yes, this is correct.

@Frederic, Paul: you guys could probably redo the patch without the
<arch/x86/kernel/cpu/mcheck/mce.c> hunk or leave it like this and let
Linus know about the conflict when sending the pull request during the
merge window...

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
