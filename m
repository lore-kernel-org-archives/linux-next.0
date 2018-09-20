From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 20 Sep 2018 17:20:58 +0100
Message-ID: <31225.1537460458@warthog.procyon.org.uk>
References: <875zz0jvfs.fsf@concordia.ellerman.id.au> <20180919094847.2103082b@canb.auug.org.au> <20180919073826.02370812@canb.auug.org.au> <20180910133525.28c5dd20@canb.auug.org.au> <15925.1537309041@warthog.procyon.org.uk> <3565.1537336860@warthog.procyon.org.uk> <20180919163102.1a0adefb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875zz0jvfs.fsf@concordia.ellerman.id.au>
Content-ID: <31224.1537460458.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> wrote:

> I realise these are in samples rather than selftests, but what most of
> the selftests do is just #define the syscall number if it's not defined,
> so that you're not dependent on getting the headers.

The reason I don't want to do that is that syscall numbers aren't consistent
across arches - they aren't even consistent within arches.

I've made the VFS samples contingent on X86 in Kconfig for the moment.

David
