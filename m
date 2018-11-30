From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Fri, 30 Nov 2018 15:10:18 +0000
Message-ID: <11581.1543590618@warthog.procyon.org.uk>
References: <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com> <20181127115246.00967523@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
Content-ID: <11580.1543590618.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Paul Moore <paul@paul-moore.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Ondrej Mosnacek <omosnace@redhat.com> wrote:

> - if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT)
> + if (fc->purpose == (FS_CONTEXT_FOR_KERNEL_MOUNT|FS_CONTEXT_FOR_SUBMOUNT))

It's not a bitmask, so you can't do that.  You'd need to do:

	if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT ||
	    fc->purpose == FS_CONTEXT_FOR_SUBMOUNT)

or use a switch.

David
