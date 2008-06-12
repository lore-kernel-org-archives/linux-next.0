From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 12 Jun 2008 11:38:19 +1000
Message-ID: <18512.32267.636550.47385@cargo.ozlabs.ibm.com>
References: <20080611192748.686236fd.sfr@canb.auug.org.au>
	<20080611095951.GB14033@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:52400 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751393AbYFLBi2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 21:38:28 -0400
In-Reply-To: <20080611095951.GB14033@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, amodra@bigpond.net.au

Ingo Molnar writes:

> could this be a tool chain limitation perhaps, or a gcc bug? Or does the 
> allyesconfig size go beyond some fundamental hardware limitation. (i 
> doubt it's the latter)

Direct unconditional branches, including procedure calls, can only
reach +/- 32MB from the address of the branch on powerpc.  So if the
image grows to more than 32MB of text there is a problem unless the
linker is smart enough to insert trampolines.  I don't know whether
GNU ld is that smart.  I'm cc'ing Alan Modra who would know the answer
to that.

Paul.
