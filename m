From: Masami Hiramatsu <mhiramat@redhat.com>
Subject: Re: linux-next: origin (tip) tree build warning
Date: Tue, 08 Dec 2009 19:44:51 -0500
Message-ID: <4B1EF303.60208@redhat.com>
References: <20091209104216.94249b11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:29549 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966998AbZLIApD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2009 19:45:03 -0500
In-Reply-To: <20091209104216.94249b11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> Today's (and probably several earlier) linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> arch/x86/tools/test_get_len.c: In function 'main':
> arch/x86/tools/test_get_len.c:116: warning: unused variable 'c'
> 
> Introduced by commit d65ff75fbe6f8ac7c17f18e4108521898468822c ("x86: Add
> verbose option to insn decoder test").
> 

Ah, this warning has been fixed on tip:perf/urgent by commit be2bf0a2.

Thank you,

-- 
Masami Hiramatsu

Software Engineer
Hitachi Computer Products (America), Inc.
Software Solutions Division

e-mail: mhiramat@redhat.com
