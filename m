From: Tony Breeds <tony@bakeyournoodle.com>
Subject: Re: linux-next: Tree for October 13
Date: Thu, 14 Oct 2010 13:55:26 +1100
Message-ID: <20101014025526.GD24185@ozlabs.org>
References: <20101013154522.7b087a20.sfr@canb.auug.org.au>
 <20101013173826.f4b911b4.akpm@linux-foundation.org>
 <4CB651A4.60205@zytor.com>
 <20101013174740.f48e4ec2.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:38522 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753827Ab0JNCz2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Oct 2010 22:55:28 -0400
Content-Disposition: inline
In-Reply-To: <20101013174740.f48e4ec2.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Feng Tang <feng.tang@intel.com>

On Wed, Oct 13, 2010 at 05:47:40PM -0700, Andrew Morton wrote:

> gcc-4.1.0.  Which is actually an officially banned compiler version:
> 
>  # if __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ <= 1
>  #  error Your version of gcc miscompiles the __weak directive
> 
> lazyass here needs to find a new cross-compiler.

*cough*
http://kernel.org/pub/tools/crosstool/files/bin/

If there are problems let me know.

Yours Tony
