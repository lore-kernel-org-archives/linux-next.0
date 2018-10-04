From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the y2038 tree
Date: Thu, 04 Oct 2018 09:14:26 +0200
Message-ID: <87efd6mbe5.fsf@xmission.com>
References: <20181004161107.77a010e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004161107.77a010e9@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 4 Oct 2018 16:11:07 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next merge of the userns tree got a conflict in:
>
>   kernel/signal.c
>
> between commit:
>
>   49c39f8464a9 ("y2038: signal: Change rt_sigtimedwait to use __kernel_timespec")
>
> from the y2038 tree and commit:
>
>   ae7795bc6187 ("signal: Distinguish between kernel_siginfo and siginfo")
>
> from the userns tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you.

This is good to know about.

Eric
