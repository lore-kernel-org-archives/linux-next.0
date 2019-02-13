From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 13 Feb 2019 11:59:05 -0800
Message-ID: <20190213115905.f8b0f189c4196eac2ca1138f@linux-foundation.org>
References: <20190213174928.18128be0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213174928.18128be0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

On Wed, 13 Feb 2019 17:49:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   scripts/atomic/check-atomics.sh
> 
> between commit:
> 
>   4ad119545d78 ("locking/atomics: Check atomic headers with sha1sum")
> 
> from the tip tree and patch:
> 
>   "scripts/atomic/check-atomics.sh: don't assume that scripts are executable"
> 
> from the akpm tree.
> 
> I fixed it up (this latter patch is now needed against the new
> scripts/atomic/gen-atomics.sh instead) and can carry the fix as
> necessary.

Thanks.  I don't know why I've been carrying that fix for so long :(
Shall resend.
