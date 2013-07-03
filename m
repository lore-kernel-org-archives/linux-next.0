From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: manual merge of the xen-two tree with the tip tree
Date: Wed, 03 Jul 2013 07:36:59 -0400
Message-ID: <38bbecb3-4426-48a1-ba19-805769b15a4c@email.android.com>
References: <20130703155914.cc0f48d817f4ca02e3bb18a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130703155914.cc0f48d817f4ca02e3bb18a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>Hi Konrad,
>
>Today's linux-next merge of the xen-two tree got a conflict in
>arch/x86/xen/time.c between commit 5584880e44e4 ("x86: xen: Sync the
>wallclock when the system time is set") from the tip tree and commit
>c9d76a24a289 ("xen/time: Don't leak interrupt name when offlining")
>from
>the xen-two tree.
>
>I fixed it up (see below) and can carry the fix as necessary (no action
>is required).

Yes.  Thanks for fixing it up. 
-- 
Sent from my Android phone. Please excuse my brevity.
