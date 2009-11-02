From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: percpu/kvm/tip tree build failure
Date: Mon, 02 Nov 2009 11:46:42 +0200
Message-ID: <4AEEAA82.8070705@redhat.com>
References: <20091102161722.eea4358d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39646 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754140AbZKBJrj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Nov 2009 04:47:39 -0500
In-Reply-To: <20091102161722.eea4358d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On 11/02/2009 07:17 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> kernel/user-return-notifier.c: In function 'fire_user_return_notifiers':
> kernel/user-return-notifier.c:45: error: expected expression before ')' token
>
> Introduced by commit 7c68af6e32c73992bad24107311f3433c89016e2 ("core,
> x86: Add user return notifiers") from the tip and kvm trees but revealed
> by commit e0fdb0e050eae331046385643618f12452aa7e73 ("percpu: add __percpu
> for sparse") from the percpu tree.  Before that percpu tree commit,
> "put_cpu_var()" would compile without error (even though it really needs
> a parameter).
>
> I have applied the following patch for today.
>    

Ingo, can you queue this on x86/entry?

-- 

error compiling committee.c: too many arguments to function
