From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Tue, 19 Jun 2018 09:40:38 +0100
Message-ID: <22145.1529397638@warthog.procyon.org.uk>
References: <20180619112140.58be35dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619112140.58be35dd@canb.auug.org.au>
Content-ID: <22144.1529397638.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>  /* These sb flags are internal to the kernel */
>  #define MS_SUBMOUNT     (1<<26)
> -#define MS_NOREMOTELOCK	(1<<27)
>  #define MS_NOSEC	(1<<28)
>  #define MS_BORN		(1<<29)
>  #define MS_ACTIVE	(1<<30)

Ummm...  Can MS_NOREMOTELOCK be removed?  I know it's listed in the internal
flags section, but all of these have been exposed to userspace for over a
year.  Ideally, I'd remove all of these from UAPI, but can anyone guarantee
that no pieces of userspace refer to them?

David
