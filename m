From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is
 used
Date: Thu, 3 Mar 2016 18:57:10 +1100
Message-ID: <20160303185710.1e758bd6@canb.auug.org.au>
References: <20160301122910.74ff0a92@canb.auug.org.au>
	<20160301070750.GA6636@gmail.com>
	<20160301204001.5594bed3@canb.auug.org.au>
	<20160301215451.GC4852@treble.redhat.com>
	<20160302132735.37262b34@canb.auug.org.au>
	<CA+icZUXsFowWpGaY9nYd_w_pP6=qTb7qH-pTP5zFK1QZR8ueZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53313 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753924AbcCCH5O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 02:57:14 -0500
In-Reply-To: <CA+icZUXsFowWpGaY9nYd_w_pP6=qTb7qH-pTP5zFK1QZR8ueZg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sedat,

On Thu, 3 Mar 2016 08:31:57 +0100 Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Does Linux next-20160303 has this patch?
> On a quick view I could not find it.

It is applied as part of the merge commit that merges the tip tree, so
there is not a separate commit for it.

-- 
Cheers,
Stephen Rothwell
