From: David Howells <dhowells@redhat.com>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Mon, 29 Dec 2008 15:04:35 +0000
Message-ID: <12273.1230563075@redhat.com>
References: <20081228200726.7b7078b4.akpm@linux-foundation.org> <8930.1229560221@redhat.com> <20081218142420.GA16728@infradead.org> <20081218123601.11810b7f.akpm@linux-foundation.org> <200812190007.34581.bernd.schubert@fastmail.fm> <20081218152616.a24c013f.akpm@linux-foundation.org> <20081219110539.7e7e230c.sfr@canb.auug.org.au> <20081229144533.4a0ab696.sfr@canb.auug.org.au>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20081228200726.7b7078b4.akpm@linux-foundation.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, hch@infradead.org, linux-kernel@vger.kernel.org, steved@redhat.com, linux-fsdevel@vger.kernel.org, rwheeler@redhat.com, linux-next@vger.kernel.org, Trond Myklebust <trond.myklebust@fys.uio.no>
List-Id: linux-next.vger.kernel.org

Andrew Morton <akpm@linux-foundation.org> wrote:

> And that of course means that many many 2.6.28 patches which I am
> maintaining will need significant rework to apply on top of linux-next,
> and then they won't apply to mainline.  Or that linux-next will not apply
> on top of those patches.  Mainly memory management.

Significant rework to many many patches?  The FS-Cache patches don't have all
that much impact outside of their own directories, AFS and NFS.

> Please drop the NFS tree until after -rc1.
> 
> Guys, this: http://lkml.org/lkml/2008/12/27/173

Okay, that's a reasonable request.

David
