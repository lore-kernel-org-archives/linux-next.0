From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is
 used
Date: Wed, 2 Mar 2016 13:27:35 +1100
Message-ID: <20160302132735.37262b34@canb.auug.org.au>
References: <20160301122910.74ff0a92@canb.auug.org.au>
	<20160301070750.GA6636@gmail.com>
	<20160301204001.5594bed3@canb.auug.org.au>
	<20160301215451.GC4852@treble.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160301215451.GC4852@treble.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Josh,

On Tue, 1 Mar 2016 15:54:51 -0600 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Changing it to use the host compiler would probably be an easy fix, but
> that would expose a harder bug related to endianness.

Just by luck, my PowerPC host is little endian :-)

> How about the below workaround patch to disable objtool and warn when
> CROSS_COMPILE is used?  If anybody complains about lack of cross-compile
> support later, we could try to fix it then.

This seems reasonable.

> From a3c65947011a420743f308b698171c4209105d3f Mon Sep 17 00:00:00 2001
> Message-Id: <a3c65947011a420743f308b698171c4209105d3f.1456868910.git.jpoimboe@redhat.com>
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> Date: Tue, 1 Mar 2016 13:35:51 -0600
> Subject: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is used

I have applied this to the merge of the tip tree in linux-next today
and it compiles fine for me.  I will continue applying it until
something better comes along or it is applied to the tip tree.

Thanks for that.
-- 
Cheers,
Stephen Rothwell
