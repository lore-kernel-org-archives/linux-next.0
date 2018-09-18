From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Tue, 18 Sep 2018 23:17:21 +0100
Message-ID: <15925.1537309041@warthog.procyon.org.uk>
References: <20180919073826.02370812@canb.auug.org.au> <20180910133525.28c5dd20@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919073826.02370812@canb.auug.org.au>
Content-ID: <15924.1537309041.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > After merging the vfs tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > samples/vfs/test-fsinfo.c: In function 'fsinfo':
> > samples/vfs/test-fsinfo.c:37:17: error: '__NR_fsinfo' undeclared (first use in this function); did you mean 'fsinfo'?

I think the problem is that I haven't allocated system call numbers for any
arches other than x86 - even the x86 syscall numbers are provisional until the
patchset is taken upstream.  I'm not sure of the best way to deal with this -
make the samples dependent on the X86 arch?

> > samples/vfs/test-fsinfo.c:180:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> >   printf("\tmax file size: %llx\n", f->max_file_size);

Sigh.  On powerpc __u64 is unsigned long, but on x86_64 it's unsigned long
long.  Is it possible to shift all arches to use unsigned long long for __u64?

David
