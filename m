From: Robert Richter <robert.richter@amd.com>
Subject: Re: linux-next: manual merge of the rr tree with the cpus4096 tree
Date: Tue, 31 Mar 2009 11:42:31 +0200
Message-ID: <20090331094230.GK7030@erda.amd.com>
References: <20090331133953.73d33570.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa4ehsobe005.messaging.microsoft.com ([216.32.181.15]:51686
	"EHLO WA4EHSOBE006.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751099AbZCaJmr (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2009 05:42:47 -0400
Content-Disposition: inline
In-Reply-To: <20090331133953.73d33570.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On 31.03.09 13:39:53, Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> drivers/oprofile/buffer_sync.c between commit
> 4c50d9ea9ca9e46b65aeffed3e0d6f54ff38c8d4 ("cpumask: modifiy oprofile
> initialization") from the cpus4096 tree and commit
> d6d66104b6a06bc0bb541ac59aff59fad46ad466 ("oprofile: Thou shalt not call
> __exit functions from __init functions") from the rr tree.
> 
> The former just removed the code that the latter was modifying, so I used
> the former version.

Rusty,

please revert d6d66104b6a06bc0bb541ac59aff59fad46ad466. The
tip/cpus4096 branch has been pulled incompletely. Patch
4c50d9ea9ca9e46b65aeffed3e0d6f54ff38c8d4 fixes the section mismatch.

Ingo,

will you send a pull request for tip/cpus4096? Otherwise the patch
should be added to the urgent branch or so.

Thanks,

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
email: robert.richter@amd.com
