From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] edac: need to export cpu_llc_id
Date: Tue, 15 Sep 2009 21:51:47 -0700
Message-ID: <4AB06EE3.4010509@zytor.com>
References: <20090916093935.6bc2c91f.sfr@canb.auug.org.au> <20090916044151.GB5767@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:58668 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbZIPEx0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2009 00:53:26 -0400
In-Reply-To: <20090916044151.GB5767@aftab>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>

On 09/15/2009 09:41 PM, Borislav Petkov wrote:
> 
> proper fix is at http://marc.info/?l=linux-kernel&m=125302459621925
> 
> we still have to figure out who's gonna pick it up. Ingo?
> 

This was from a tree you pushed straight to Linus, so it's probably
better you push it directly.

You can add:

Acked-by: H. Peter Anvin <hpa@zytor.com>

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
