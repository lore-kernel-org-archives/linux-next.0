From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: manual merge of the kernel-doc tree with the tracing
 and timers trees
Date: Thu, 05 Mar 2009 19:12:48 -0800
Message-ID: <49B094B0.20606@oracle.com>
References: <20090306132104.16a0af9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:49762 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529AbZCFDLq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2009 22:11:46 -0500
In-Reply-To: <20090306132104.16a0af9d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Stephen Rothwell wrote:
> Hi Randy,
> 
> Today's linux-next merge of the kernel-doc tree got a conflict in
> Documentation/kernel-parameters.txt between commits
> b9ce08c01020eb28bfbfa6faf1c740281c5f418e ("kmemtrace: Core
> implementation") fron the tracing tree and
> b98103a5597b87211a1c74077b06faeac554bedc ("x86: hpet: print HPET
> registers during setup (if hpet=verbose is used)") from the timers tree
> and commit 8e141e0b33e2fd17540881a1ead5103dd229bf81
> ("docum-kernprms-alpha3") from the kernel-doc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Sounds good.  Thanks.

-- 
~Randy
