From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Mon, 8 Apr 2019 16:30:12 -0400
Message-ID: <CAHC9VhRT3WDbidC2=0wGnKEB5syHh6D=zWS4TX2ZGYAKxfxASw@mail.gmail.com>
References: <20190408113131.222f480a@canb.auug.org.au> <20190408171534.GA11717@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408171534.GA11717@altlinux.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dmitry V. Levin" <ldv@altlinux.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 8, 2019 at 1:15 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
> On Mon, Apr 08, 2019 at 11:31:31AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the audit tree got conflicts in:
> >
> >   arch/mips/kernel/ptrace.c
> >   kernel/seccomp.c
> >
> > between commit:
> >
> >   b35f549df1d7 ("syscalls: Remove start and number from syscall_get_arguments() args")
> >
> > from Linus' tree and commit:
> >
> >   16add411645c ("syscall_get_arch: add "struct task_struct *" argument")
> >
> > from the audit tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Thanks, the merge fix is correct.
> I've also re-tested it using the new selftests/ptrace test
> from PTRACE_GET_SYSCALL_INFO patchset.

Thanks for the verification Dmitry.

Stephen, thanks for the heads-up, I'll pass this along to Linus come merge time.

-- 
paul moore
www.paul-moore.com
