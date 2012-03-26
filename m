From: Alex Shi <alex.shi@intel.com>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Mon, 26 Mar 2012 13:20:35 +0800
Message-ID: <4F6FFCA3.3010000@intel.com>
References: <20120326150107.392bc3a7e0175b5009bcfeff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:23962 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752098Ab2CZFVr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Mar 2012 01:21:47 -0400
In-Reply-To: <20120326150107.392bc3a7e0175b5009bcfeff@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Suresh Siddha <suresh.b.siddha@intel.com>

On 03/26/2012 12:01 PM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the akpm tree got a conflict in  between
> commit a6fca40f1d7f ("x86, tlb: Switch cr3 in leave_mm() only when
> needed") from the tip tree and commit "x86: use this_cpu_xxx to replace
> percpu_xxx funcs" from the akpm tree.
>
> I fixed it up (see below) and can carry the fix as necessary.
Thanks!
