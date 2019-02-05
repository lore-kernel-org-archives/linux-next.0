From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: Fixes tag needs some work in the userns tree
Date: Tue, 05 Feb 2019 15:29:04 -0600
Message-ID: <87bm3pzzz3.fsf@xmission.com>
References: <20190206073330.6e266351@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206073330.6e266351@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 6 Feb 2019 07:33:30 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> In commit
>
>   a692933a8769 ("signal: Always attempt to allocate siginfo for SIGSTOP")
>
> Fixes tag
>
>   Fixes: 6dfc88977e42 ("[PATCH] shared thread signals")
>
> has these problem(s):
>
>   - Target SHA1 does not exist

The SHA1 tag does exist and I have another tag:
History Tree: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
That lists the tree it actually came from.

That is the best way I can see to handle bugs that predate v2.6.12 that
Linus first put into git.

Would it make sense to graft you tree that you check for the existence
of bad sha1s to Thomas's import of the bk tree into git?

Is there a better way to refer to old commits that I haven't seen?

Eric
