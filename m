From: Trond Myklebust <Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for October 6
Date: Tue, 26 Oct 2010 08:32:13 -0400
Message-ID: <1288096333.3123.9.camel@heimdal.trondhjem.org>
References: <20101006163632.c1943a38.sfr@canb.auug.org.au>
	 <AANLkTimb2NxXcfj-o=F18S1u2rn-o851F+1sgQ_2uOVQ@mail.gmail.com>
	 <20101026080822.GA10520@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101026080822.GA10520-X9Un+BFzKDI@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Charles Edward Lever <Chuck.Lever-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Zimny Lech <napohybelskurwysynom2010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2010-10-26 at 10:08 +0200, Ingo Molnar wrote:
> * Zimny Lech <napohybelskurwysynom2010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > 2010/10/6 Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>:
> > > Hi all,
> > >
> > > Changes since 20101005:
> > 
> > It looka like a bug or a beetle or something like that
> > 
> > /home/test/linux-2.6/fs/nfs/nfsroot.c: In function 'nfs_root_debug':
> > /home/test/linux-2.6/fs/nfs/nfsroot.c:110:2: error: 'nfs_debug'
> > undeclared (first use in this function)
> > /home/test/linux-2.6/fs/nfs/nfsroot.c:110:2: note: each undeclared
> > identifier is reported only once for each function it appears in
> > make[3]: *** [fs/nfs/nfsroot.o] Error 1
> > make[2]: *** [fs/nfs] Error 2
> > make[1]: *** [fs] Error 2
> > make: *** [sub-make] Error 2
> 
> This build bug has now been pushed upstream and triggers rather easily. Trond?
> 
> Thanks,
> 
> 	Ingo

Grrr.... Chuck, I forwarded this report to you almost 3 weeks ago.
Anyhow, does the following fix the bug?

Cheers
   Trond

----------------------------------------------------------------------------------------
NFS: Fix a compile issue in nfs_root

From: Trond Myklebust <Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>

Stephen Rothwell reports:

> /home/test/linux-2.6/fs/nfs/nfsroot.c: In function 'nfs_root_debug':
> /home/test/linux-2.6/fs/nfs/nfsroot.c:110:2: error: 'nfs_debug'
> undeclared (first use in this function)
> /home/test/linux-2.6/fs/nfs/nfsroot.c:110:2: note: each undeclared
> identifier is reported only once for each function it appears in
> make[3]: *** [fs/nfs/nfsroot.o] Error 1
> make[2]: *** [fs/nfs] Error 2
> make[1]: *** [fs] Error 2
> make: *** [sub-make] Error 2

Which is caused by commit 306a075362a288683f6346185f97dd0e06df19da
(NFS: Allow NFSROOT debugging messages to be enabled dynamically)

Fix is to disable this code when RPC_DEBUG is disabled.

Signed-off-by: Trond Myklebust <Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
---

 fs/nfs/nfsroot.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)


diff --git a/fs/nfs/nfsroot.c b/fs/nfs/nfsroot.c
index 460df36..903908a 100644
--- a/fs/nfs/nfsroot.c
+++ b/fs/nfs/nfsroot.c
@@ -101,6 +101,7 @@ static char nfs_export_path[NFS_MAXPATHLEN + 1] __initdata = "";
 /* server:export path string passed to super.c */
 static char nfs_root_device[NFS_MAXPATHLEN + 1] __initdata = "";
 
+#ifdef RPC_DEBUG
 /*
  * When the "nfsrootdebug" kernel command line option is specified,
  * enable debugging messages for NFSROOT.
@@ -112,6 +113,7 @@ static int __init nfs_root_debug(char *__unused)
 }
 
 __setup("nfsrootdebug", nfs_root_debug);
+#endif
 
 /*
  *  Parse NFS server and directory information passed on the kernel

--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
