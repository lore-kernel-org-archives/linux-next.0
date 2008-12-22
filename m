From: Ken Chen <kenchen@google.com>
Subject: Re: linux-next: sched tree build warning
Date: Sun, 21 Dec 2008 22:49:46 -0800
Message-ID: <b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.45.13]:6421 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751920AbYLVGtu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Dec 2008 01:49:50 -0500
Received: from zps19.corp.google.com (zps19.corp.google.com [172.25.146.19])
	by smtp-out.google.com with ESMTP id mBM6nmOn006769
	for <linux-next@vger.kernel.org>; Sun, 21 Dec 2008 22:49:48 -0800
Received: from rv-out-0708.google.com (rvbf25.prod.google.com [10.140.82.25])
	by zps19.corp.google.com with ESMTP id mBM6nUKT023401
	for <linux-next@vger.kernel.org>; Sun, 21 Dec 2008 22:49:47 -0800
Received: by rv-out-0708.google.com with SMTP id f25so3116138rvb.54
        for <linux-next@vger.kernel.org>; Sun, 21 Dec 2008 22:49:46 -0800 (PST)
In-Reply-To: <20081222152247.b934ed5b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Sun, Dec 21, 2008 at 8:22 PM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next build (powerpc ppc64_defconfig) produced this new
> warning:
>
> fs/proc/base.c: In function 'proc_pid_schedstat':
> fs/proc/base.c:352: warning: format '%llu' expects type 'long long unsigned int',
> but argument 3 has type 'u64'
>
> Introduced by commit 9c2c48020ec0dd6ecd27e5a1298f73b40d85a595
> ("schedstat: consolidate per-task cpu runtime stats").

oh boy, this is the 2nd time that printing u64 bite me, I really need
to get hold of a machine that is non-x86_64.

Just saw Ingo's patch came in while I'm typing this email.  Thank you
Ingo for fixing this.

- Ken
