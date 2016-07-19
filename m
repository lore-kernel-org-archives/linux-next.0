From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Tue, 19 Jul 2016 10:26:29 +1000
Message-ID: <20160719102629.0a12a1a1@canb.auug.org.au>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
	<20160715072243.GP30154@twins.programming.kicks-ass.net>
	<20160715073119.GR30927@twins.programming.kicks-ass.net>
	<20160715150903.GA2523@redhat.com>
	<20160715152436.GB2523@redhat.com>
	<20160715154326.GC2523@redhat.com>
	<20160718151845.4de6e274@canb.auug.org.au>
	<CALCETrWqdi=7hsXTx=WKf-=He-9GP-WNLXppijeZgcoZDCq=bg@mail.gmail.com>
	<20160718203634.GF2207@kernel.org>
	<20160719082235.42aec856@canb.auug.org.au>
	<20160718234132.GI2207@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38579 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751457AbcGSA0c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 20:26:32 -0400
In-Reply-To: <20160718234132.GI2207@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Arnaldo,

On Mon, 18 Jul 2016 20:41:32 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
>
> Ok, one of the possible reasons was for tools/{include,lib,perf,objtool}
> code to be including code directly from the kernel, and that was still
> the case for some headers, I fixed those and pushed to Ingo now, if he
> pulls lets see if this fixes things.

If you have a single patch (or few) relative to yesterday's tip tree,
please send it to me as well and I will apply it as a fix patch if Ingo
doesn't get to pulling in time.

-- 
Cheers,
Stephen Rothwell
