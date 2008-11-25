From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: ftrace tree build warnings
Date: Mon, 24 Nov 2008 21:44:56 -0500
Message-ID: <1227581096.7622.7.camel@localhost.localdomain>
References: <20081125133828.8f9b49df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:37495 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751924AbYKYCpv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 21:45:51 -0500
In-Reply-To: <20081125133828.8f9b49df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>


On Tue, 2008-11-25 at 13:38 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) produced lots of these
> warnings:
> 
> include/linux/tty.h:330: warning: '______f' is static but declared in inline function 'tty_kref_get' which is not static
> 
> Caused by commit 2bcd521a684cc94befbe2ce7d5b613c841b0d304 ("trace:
> profile all if conditionals").  Something needs to be done about
> this ...  maybe tty_kref_get needs to be "static inline" instead of
> "extern inline"?
> 

Is there a way to suppress this warning here? Since we are only
profiling, if it complies fine, then it should not be an issue.


Looking at the uses of this function, is there any reason that it is not
"static inline"?

-- Steve
 
