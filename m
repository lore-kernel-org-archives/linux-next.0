From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Date: Mon, 26 Nov 2018 14:22:57 -0800
Message-ID: <20181126222257.GB55960@jaegeuk-macbookpro.roam.corp.google.com>
References: <20181126111933.1b0fb324@canb.auug.org.au>
 <20181126215924.GA55960@jaegeuk-macbookpro.roam.corp.google.com>
 <20181127091747.4830d123@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181127091747.4830d123@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <keescook@google.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

On 11/27, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> On Mon, 26 Nov 2018 13:59:24 -0800 Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > On 11/26, Stephen Rothwell wrote:
> > > 
> > > After merging the f2fs tree, today's linux-next build
> > > (x86_64_allmodconfig) produced this warning:
> > > 
> > > In file included from fs/f2fs/dir.c:11:
> > > fs/f2fs/f2fs.h: In function '__mark_inode_dirty_flag':
> > > fs/f2fs/f2fs.h:2388:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
> > >    if (set)
> > >       ^
> > > fs/f2fs/f2fs.h:2390:2: note: here
> > >   case FI_DATA_EXIST:
> > >   ^~~~
> > > 
> > > Exposed by my use of -Wimplicit-fallthrough
> > > 
> > > I am not sure why this has turned up now (as opposed to earlier today).  
> > 
> > The above change had been there for a long time, as an intended behavior.
> 
> Yeah, it popped up due to line number changes in that file and the way
> I was filtering new warnings.
> 
> > Hmm, I'm not sure how to avoid this.
> 
> if you add a comment
> 	/* fall through */
> at the point the fall through occurs, then the warning is suppressed
> (and it documents that it is deliberate).

Oh, thanks~
Is this okay?

>From 79e24f1509e5b6a07069be9cc8163969da78c57a Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 26 Nov 2018 14:20:32 -0800
Subject: [PATCH] f2fs: avoid build warn of fall_through

After merging the f2fs tree, today's linux-next build
 (x86_64_allmodconfig) produced this warning:

 In file included from fs/f2fs/dir.c:11:
 fs/f2fs/f2fs.h: In function '__mark_inode_dirty_flag':
 fs/f2fs/f2fs.h:2388:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
    if (set)
       ^
 fs/f2fs/f2fs.h:2390:2: note: here
   case FI_DATA_EXIST:
   ^~~~

 Exposed by my use of -Wimplicit-fallthrough

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 26ad1de8641c..b3fe6803d4c6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2387,6 +2387,7 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 	case FI_NEW_INODE:
 		if (set)
 			return;
+		/* fall through */
 	case FI_DATA_EXIST:
 	case FI_INLINE_DOTS:
 	case FI_PIN_FILE:
-- 
2.19.0.605.g01d371f741-goog
