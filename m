From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the selinux tree with the security tree
Date: Tue, 3 Apr 2018 07:59:19 -0400
Message-ID: <CAHC9VhTFbYC68eS_S3N+Q6h6JFdNBuYC5SUAdYp=TS91kkm3Xg@mail.gmail.com>
References: <20180403144349.7db7f5e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403144349.7db7f5e0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Haines <richard_c_haines@btinternet.com>, Sargun Dhillon <sargun@sargun.me>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 3, 2018 at 12:43 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next merge of the selinux tree got a conflict in:
>
>   include/linux/lsm_hooks.h
>
> between commit:
>
>   22402b0b736d ("security: convert security hooks to use hlist")
>
> from the security tree and commit:
>
>   72e89f50084c ("security: Add support for SCTP security hooks")
>
> from the selinux tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

That looks right, thanks Stephen.

-- 
paul moore
www.paul-moore.com
