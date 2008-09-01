From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: linux-next: revert of "debug: add notifier chain debugging"
Date: Mon, 01 Sep 2008 07:23:58 -0700
Message-ID: <48BBFAFE.7030808@linux.intel.com>
References: <20080901182619.cb799b52.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.89]:42912 "EHLO
	fmsmga101.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751227AbYIAOYH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Sep 2008 10:24:07 -0400
In-Reply-To: <20080901182619.cb799b52.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, David Woodhouse <dwmw2@infradead.org>

Stephen Rothwell wrote:
> Hi all,
> 
> I have reverted commit 16f9b13de93c8bfdac16b4d15577af2c132358ef ("debug:
> add notifier chain debugging") for today hate typing thas it prevents Powerpc kernels
> from booting.  There is (I think) a bug there (__devinit routines are not
> put in the right section as pointed otu by David Woodhouse), but not a
> fatal bug and the above commit makes it one.

well it's a pretty bad bug since there are many places that depend on the kernel text stuff to work.
(backtracing, lockdep, some of the security checks etc). PPC needs to be fixed rather urgently.
but yeah the system kept plodding on.
David also sent a patch to fix it fwiw.

I'm a bit sad to see a debug patch get reverted just because it caught bugs ;-)
at least I assume this is very temporary.
