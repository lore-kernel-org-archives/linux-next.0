From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86, pkeys: fix siginfo ABI breakage from new field
Date: Mon, 29 Feb 2016 09:01:43 +0100
Message-ID: <20160229080143.GB31950@gmail.com>
References: <20160226173427.54A6949F@viggo.jf.intel.com>
 <6C5C3B9B-CAD6-4010-9A3E-AFFF7E13FAE3@zytor.com>
 <20160227091013.6e0606d1@canb.auug.org.au>
 <20160227114154.GA16200@gmail.com>
 <56D1F61C.5050308@sr71.net>
 <9E8119F8-1F37-4084-AE31-34CA6DE8C15E@zytor.com>
 <20160228102629.0ef4ef4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36643 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978AbcB2IBr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Feb 2016 03:01:47 -0500
Content-Disposition: inline
In-Reply-To: <20160228102629.0ef4ef4f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave@sr71.net>, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > u32?
> 
> It would have to be __u32, but we already use int and unsigned int
> extensively in the siginfo structure (which are both always assumed to
> be 32 bits).  So "unsigned int" probably makes most sense.

No. This whole mishap is an object lesson in why it's a bad idea to ever use ABI 
types outside of the __[us][8|16|32|64] space: some of them are 'fine', some of 
them (like longs) are not.

And we have to start somewhere, so we might as well start with new code that adds 
new ABI details: if a patch only uses __[us][8|16|32|64] types then it's easier to 
tell whether it's a safe ABI extension.

Thanks,

	Ingo
