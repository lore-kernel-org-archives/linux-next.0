From: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Fri, 30 Nov 2018 16:17:33 +0100
Message-ID: <CAFqZXNvGwH4rjdTUsiDjScxV5bkPq=gHs4w3TF-cPMBcun1U_A@mail.gmail.com>
References: <20181127115246.00967523@canb.auug.org.au> <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <11581.1543590618@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11581.1543590618@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Moore <paul@paul-moore.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Nov 30, 2018 at 4:10 PM David Howells <dhowells@redhat.com> wrote:
> Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> > - if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT)
> > + if (fc->purpose == (FS_CONTEXT_FOR_KERNEL_MOUNT|FS_CONTEXT_FOR_SUBMOUNT))
>
> It's not a bitmask, so you can't do that.  You'd need to do:
>
>         if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT ||
>             fc->purpose == FS_CONTEXT_FOR_SUBMOUNT)
>
> or use a switch.

Damn, you're right... I should have noticed that there is '==' instead of '&' :/

Thanks,

--
Ondrej Mosnacek <omosnace at redhat dot com>
Associate Software Engineer, Security Technologies
Red Hat, Inc.
