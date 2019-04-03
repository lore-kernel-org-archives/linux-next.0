From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: build failure after merge of the selinux tree
Date: Tue, 2 Apr 2019 21:25:18 -0400
Message-ID: <CAHC9VhRbYZzd=526r4k6d12Rs=PKx0ro4+04BKfAN-ozarc2cg@mail.gmail.com>
References: <20190403122212.68a9964d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403122212.68a9964d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 2, 2019 at 9:22 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> After merging the selinux tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> x86_64-linux-gnu-ld: security/selinux/hooks.o: in function `selinux_kernfs_init_security':
> hooks.c:(.text+0x8f7d): undefined reference to `kernfs_xattr_get'
> x86_64-linux-gnu-ld: hooks.c:(.text+0x8ff5): undefined reference to `kernfs_xattr_get'
> x86_64-linux-gnu-ld: hooks.c:(.text+0x91b5): undefined reference to `kernfs_xattr_set'
>
> Caused by commit
>
>   1991af34fa26 ("kernfs: fix xattr name handling in LSM helpers")
>
> I have used the selinux tree from next-20190402 for today.

Hi Stephen,

My apologies, I just noticed the same failure and removed the commit
from selinux/next.  I let Ondrej know and I would expect he'll have an
updated patch shortly.

-- 
paul moore
www.paul-moore.com
