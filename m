From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH -mm] proc: fix BUILD_BUG_ON breakage on powerpc64
Date: Tue, 3 Jul 2018 22:16:02 +0300
Message-ID: <20180703191602.GA25521@avx2>
References: <20180629174946.1b4f40ef@canb.auug.org.au>
 <20180629212521.GA23437@avx2>
 <20180630131710.72cec2be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180630131710.72cec2be@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, Jun 30, 2018 at 01:18:22PM +1000, Stephen Rothwell wrote:
> Hi Alexey,
> 
> On Sat, 30 Jun 2018 00:25:22 +0300 Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >
> > On Fri, Jun 29, 2018 at 05:49:46PM +1000, Stephen Rothwell wrote:
> > > fs/proc/inode.c:110:2: note: in expansion of macro 'BUILD_BUG_ON'
> > >   BUILD_BUG_ON(sizeof(struct proc_dir_entry) >= SIZEOF_PDE);
> > >   ^~~~~~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >   527ae8759f10 ("proc: fixup PDE allocation bloat")
> > > 
> > > I have reverted that commit for today.  
> > 
> > Can't reproduce it with commit 7aa4b0a46be8badd053c958481f0e89e634ae4df
> > (the one before revert) both on 32-bit and 64-bit.
> > 
> > Can you post fs/proc/inode.i ?
> 
> Attached (xz compresesed).
> 
> This is built with gcc 7.3.1 (built from source) hosted on PowerPC LE
> and targeted at PowerPC BE (a powerpc allyesconfig build).  I did not
> have any trouble with any of my other PowerPC targeted builds.

I'm not sure what's going on. Taking preprocessed file and compiling it
with ppc64 cross compiler gives sizeof(struct proc_dir_entry) = 232.

Anyway here is obvious fixlet:

[PATCH -mm] proc: fix BUILD_BUG_ON breakage on powerpc64-allyesconfig

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 fs/proc/internal.h |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@ -65,12 +65,12 @@ struct proc_dir_entry {
 	char inline_name[];
 } __randomize_layout;
 
-#ifdef CONFIG_64BIT
-#define SIZEOF_PDE	(sizeof(spinlock_t) <= 4 ? 192 : 256)
-#else
-#define SIZEOF_PDE	(sizeof(spinlock_t) <= 4 ? 128 : 192)
-#endif
-
+#define SIZEOF_PDE	(				\
+	sizeof(struct proc_dir_entry) < 128 ? 128 :	\
+	sizeof(struct proc_dir_entry) < 192 ? 192 :	\
+	sizeof(struct proc_dir_entry) < 256 ? 256 :	\
+	sizeof(struct proc_dir_entry) < 512 ? 512 :	\
+	0)
 #define SIZEOF_PDE_INLINE_NAME (SIZEOF_PDE - sizeof(struct proc_dir_entry))
 
 extern struct kmem_cache *proc_dir_entry_cache;
