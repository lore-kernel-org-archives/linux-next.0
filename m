From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Thu, 21 Jul 2016 09:29:50 +1000
Message-ID: <20160721092950.0047531e@canb.auug.org.au>
References: <20160718203634.GF2207@kernel.org>
	<20160719082235.42aec856@canb.auug.org.au>
	<20160718234132.GI2207@kernel.org>
	<20160719102629.0a12a1a1@canb.auug.org.au>
	<20160719003906.GJ2207@kernel.org>
	<20160719132608.1aa2692a@canb.auug.org.au>
	<20160719125443.GL2207@kernel.org>
	<20160719174551.GM2207@kernel.org>
	<20160720092157.7cd8de65@canb.auug.org.au>
	<20160720095333.3034531c@canb.auug.org.au>
	<20160720025202.GB18962@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34248 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751493AbcGTX3w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 19:29:52 -0400
In-Reply-To: <20160720025202.GB18962@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Arnaldo,

On Tue, 19 Jul 2016 23:52:02 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
>
> Humm, it seems that the compiler used is not the cross one, but the
> native, check if, say, __powerpc__ is defined.

Yes, __powerpc__ is defined (unsuprisingly).

-- 
Cheers,
Stephen Rothwell
