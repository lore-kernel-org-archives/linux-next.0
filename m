From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 28 Jun 2017 14:24:43 +1000
Message-ID: <20170628142443.0f78ee27@canb.auug.org.au>
References: <20170628134310.3a605636@canb.auug.org.au>
        <595329D3.7080808@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751581AbdF1EYp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 00:24:45 -0400
In-Reply-To: <595329D3.7080808@rock-chips.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jeffy <jeffy.chen@rock-chips.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Gustavo Padovan <gustavo@padovan.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi jeffy,

On Wed, 28 Jun 2017 12:00:19 +0800 jeffy <jeffy.chen@rock-chips.com> wrote:
>
> commit 50816c48997af857d4bab3dca1aba90339705e96
> Author: Ingo Molnar <mingo@kernel.org>
> Date:   Sun Mar 5 10:33:16 2017 +0100
> 
>      sched/wait: Standardize internal naming of wait-queue entries
> 
> 
> changed wait_queue_entry_t to struct wait_queue_entry, and also wait to 
> wq_entry, maybe we should do it too?

Sure, but that can be done later.

-- 
Cheers,
Stephen Rothwell
