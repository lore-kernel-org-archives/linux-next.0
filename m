From: Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] kbuild, sparseirq: work around GCC bug with __weak
	aliases
Date: Mon, 29 Dec 2008 10:27:35 +1100
Message-ID: <18776.2919.275253.180651@cargo.ozlabs.ibm.com>
References: <20081223132127.GA5450@linux.vnet.ibm.com>
	<495153A4.5060201@kernel.org>
	<20081224163400.GA11562@linux.vnet.ibm.com>
	<49529CE1.4040005@kernel.org>
	<20081226091217.GA5100@linux.vnet.ibm.com>
	<4954AC7B.3020603@kernel.org>
	<20081226102716.GA31450@uranus.ravnborg.org>
	<20081226133354.GC29265@elte.hu>
	<20081226134218.GA1054@elte.hu>
	<18773.43656.189438.155690@cargo.ozlabs.ibm.com>
	<20081227105944.GA13198@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:59636 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752563AbYL1X1n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 18:27:43 -0500
In-Reply-To: <20081227105944.GA13198@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Yinghai Lu <yinghai@kernel.org>, David Howells <dhowells@redhat.com>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mel@csn.ul.ie

Ingo Molnar writes:

> hm, does Yinghai's patch below do the trick? (also in perfcounters/core 
> and tip/master)

Yes, it seems to fix the problem.

Paul.
