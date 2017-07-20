From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Thu, 20 Jul 2017 07:17:03 -0500
Message-ID: <87h8y79ubk.fsf@xmission.com>
References: <20170720132549.0f086e4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170720132549.0f086e4a@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 20 Jul 2017 13:25:49 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kirill Tkhai <ktkhai@virtuozzo.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the userns tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> kernel/pid_namespace.c: In function 'create_pid_namespace':
> kernel/pid_namespace.c:105:7: error: too many arguments to function 'in_userns'
>   if (!in_userns(parent_pid_ns->user_ns, user_ns))
>        ^
> In file included from kernel/pid_namespace.c:13:0:
> include/linux/user_namespace.h:148:20: note: declared here
>  static inline bool in_userns(const struct user_namespace *target_ns)
>                     ^
>
> Caused by commit
>
>   1f1b28d80cd9 ("userns,pidns: Verify the userns for new pid namespaces")
>
> I have used the userns tree from next-20170719 for today.

*scratches my head*

Yes.  That isn't a powerpc specific bug.

This has been in my for-testing branch forever.  I thought this had
received plenty of build testing but apparently not.

I will get this sorted out.

Thank you very much.

Eric
