From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip tree question
Date: Mon, 12 Oct 2009 08:49:44 +0200
Message-ID: <20091012064944.GA32027@elte.hu>
References: <20091012145609.c3cc78aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754041AbZJLGuh@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091012145609.c3cc78aa.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> I noticed that the auto-latest branch of the tip tree (which is what 
> is included in linux-next) has had the tip out-of-tree branch merged 
> into it. [...]

That was unintended. tip:out-of-tree is like the tail section of -mm: 
for useful but never-for-upstream patches.

Fixed it - thanks Stephen,

	Ingo
