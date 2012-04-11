From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Tue, 10 Apr 2012 20:54:25 -0700
Message-ID: <4F850071.6030906@zytor.com>
References: <20120411134259.61f755a90055b23a6876687b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:53550 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755980Ab2DKDyj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Apr 2012 23:54:39 -0400
In-Reply-To: <20120411134259.61f755a90055b23a6876687b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Neil Brown <neilb@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jim Kukunas <james.t.kukunas@linux.intel.com>

On 04/10/2012 08:42 PM, Stephen Rothwell wrote:
> Hi Neil,
> 
> After merging the md tree, today's linux-next build (powerpc 
> ppc64_defconfig) failed like this:
> 
> lib/raid6/recov.c: In function 'raid6_has_ssse3': 
> lib/raid6/recov.c:27:2: error: implicit declaration of function
> 'boot_cpu_has' [-Werror=implicit-function-declaration] 
> lib/raid6/recov.c:27:22: error: 'X86_FEATURE_XMM' undeclared (first
> use in this function) lib/raid6/recov.c:27:22: note: each
> undeclared identifier is reported only once for each function it
> appears in lib/raid6/recov.c:28:16: error: 'X86_FEATURE_XMM2'
> undeclared (first use in this function) lib/raid6/recov.c:29:16:
> error: 'X86_FEATURE_SSSE3' undeclared (first use in this function) 
> lib/raid6/recov.c: At top level: lib/raid6/recov.c:25:12: warning:
> 'raid6_has_ssse3' defined but not used [-Wunused-function]
> 
> Caused by commit 56d3ac7ef905 ("lib/raid6: Add SSSE3 optimized
> recovery functions").  All the world is not X86 :-)
> 
> I have used the md tree from next-20120410 for today.

While on the subject it would be nice to factor this out into a
separate file.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
