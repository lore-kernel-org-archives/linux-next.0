From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: build failure after merge of the arm64 tree
Date: Mon, 17 Sep 2012 09:41:08 +0100
Message-ID: <20120917084108.GA23549@arm.com>
References: <20120917112405.4f7b7555209ad024e0531b21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:62435 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755016Ab2IQIlx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Sep 2012 04:41:53 -0400
Content-Disposition: inline
In-Reply-To: <20120917112405.4f7b7555209ad024e0531b21@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Stephen,

On Mon, Sep 17, 2012 at 02:24:05AM +0100, Stephen Rothwell wrote:
> After merging the arm64 tree, today's linux-next build ()
> failed like this:
> 
> arch/powerpc/kernel/sys_ppc32.c:146:17: error: conflicting types for 'compat_sys_sendfile'
> include/linux/compat.h:593:16: note: previous declaration of 'compat_sys_sendfile' was here
> arch/powerpc/kernel/sys_ppc32.c:231:17: error: conflicting types for 'compat_sys_sched_rr_get_interval'
> include/linux/compat.h:596:16: note: previous declaration of 'compat_sys_sched_rr_get_interval' was here
> 
> Caused by commits 2a23f0dba0c6 ("fs: Add generic compat_sys_sendfile
> implementation") and a0c6fc489bf6 ("compat: Add generic
> compat_sys_sched_rr_get_interval implementation").  Grep is your friend.

Thanks for this. It was an attempt to add generic compat_sys_sendfile()
and compat_sys_sched_rr_get_interval() implementations to be shared by
other architectures (patches for the other architectures to be pushed
separately). I'll drop them for now as PowerPC has different prototypes
and push the patches separately.

-- 
Catalin
