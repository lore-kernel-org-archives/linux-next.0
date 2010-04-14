From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the limits tree
Date: Wed, 14 Apr 2010 08:41:00 +0200
Message-ID: <4BC5637C.4020606@gmail.com>
References: <20100414135905.47494958.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100414135905.47494958.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 04/14/2010 05:59 AM, Stephen Rothwell wrote:
> Today's linux-next merge of the tip tree got a conflict in
> kernel/posix-cpu-timers.c between commit
> 0c1b5ce8de67c36bbf67db38240a91f358133bdd ("core: add task_struct to
> update_rlimit_cpu") from the limits tree and commit
> f55db609042faecd5e518ce372b87f846659b32e ("cpu-timers: Simplify
> RLIMIT_CPU handling") from the tip tree.
> 
> I did the obvious fixup (see below) but it is probably not completely
> correct.   Jiri, did I see Linus ask for major revisions of the writable
> limits work?

Hi. Yes, but as I didn't understand the way he described and didn't get
reply to what I asked, please drop the limits tree from -next
completely. If I ever get it into a usable state I'll apply you to merge
it again (or ask akpm again).

thanks,
-- 
js
