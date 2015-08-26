From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the tip tree
Date: Thu, 27 Aug 2015 07:30:38 +1000
Message-ID: <20150827073038.06f66e4b@canb.auug.org.au>
References: <20150824155954.0cb8a6a8@canb.auug.org.au>
	<20150826182100.GA2662@fergus.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38189 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752224AbbHZVak (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Aug 2015 17:30:40 -0400
In-Reply-To: <20150826182100.GA2662@fergus.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Alexander Graf <agraf@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Hi Paul,

On Wed, 26 Aug 2015 11:21:00 -0700 Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Mon, Aug 24, 2015 at 03:59:54PM +1000, Stephen Rothwell wrote:
> >  -		} else if (should_resched()) {
> >  +		} else if (need_resched()) {
> >  +			vc->vcore_state = VCORE_PREEMPT;
> 
> This line is removed in the kvm-ppc tree because it is now in the new
> kvmppc_vcore_preempt() function.  Thus we don't need this line in the
> merge result.  However, having it here just means that we set
> vc->vcore_state to VCORE_PREEMPT twice.

Thanks for the report.  I have fixed up my reolution.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
