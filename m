From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the arm64 tree
Date: Tue, 7 Nov 2017 16:31:17 +1100
Message-ID: <20171107163117.5aeaac71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55279 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753165AbdKGFbT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Nov 2017 00:31:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>

Hi Catalin,

Commit

  2c0db5b45071 ("rm64: Implement __lshrti3 library function")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
