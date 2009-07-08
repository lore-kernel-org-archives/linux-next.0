From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Merge request for the Thumb-2 branch
Date: Wed, 08 Jul 2009 16:34:29 +0100
Message-ID: <1247067269.6595.44.camel@pc1117.cambridge.arm.com>
References: <1246035591.30717.54.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:34896 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751271AbZGHPel (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2009 11:34:41 -0400
In-Reply-To: <1246035591.30717.54.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>

Hi Stephen and Russell,

On Fri, 2009-06-26 at 17:59 +0100, Catalin Marinas wrote:
> Could you please merge the thumb-2 branch into linux-next:
> 
>   git://linux-arm.org/linux-2.6.git thumb-2
> 
> It adds support for compiling the ARM kernel to the Thumb-2 instruction
> set (16 or 32 bit opcodes) and it makes sense to check it doesn't break
> other things before the next merging window (it's a bit more intrusive
> but limited to arch/arm/* files).

(I'm replying to myself but I'd like to make sure this e-mail wasn't
missed)

Russell - are you OK with getting this branch merged during the next
window, assuming that any new comments are implemented and testing is
fine? If there are other issues, please let me know.

While merging will eventually be done via Russell's ARM tree, should we
first get it into linux-next directly or into Russell's for-next branch
(if such branch exists)?

Thanks.

-- 
Catalin
