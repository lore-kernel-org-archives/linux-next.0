From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: next-20090202: task kmemleak:763 blocked for more than
	120seconds.
Date: Fri, 06 Feb 2009 16:02:58 +0000
Message-ID: <1233936178.10555.16.camel@pc1117.cambridge.arm.com>
References: <20090203205204.GC6344@nowhere>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:43678 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752376AbZBFQDJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2009 11:03:09 -0500
In-Reply-To: <20090203205204.GC6344@nowhere>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Mandeep Singh Baines <msb@google.com>, Alexander Beregalov <a.beregalov@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 2009-02-03 at 20:52 +0000, Frederic Weisbecker wrote:
> Note that requiring kmemleak to be freezable looks only relevant if it does
> some memory allocations (hibernation needs some memory and prefer that there
> are not too much parallel memory allocations.)

OK. In this case, there is no need for the kmemleak thread to be
freezable. It only scans the memory periodically but doesn't allocate
any itself.

Thanks.

-- 
Catalin
