From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 vhost tree
Date: Fri, 8 Jan 2016 17:50:11 +1100
Message-ID: <20160108175011.27fb2679@canb.auug.org.au>
References: <20160108165908.2da89bfd@canb.auug.org.au>
	<20160108083449-mutt-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160108083449-mutt-send-email-mst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Michael,

On Fri, 8 Jan 2016 08:46:15 +0200 "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> On Fri, Jan 08, 2016 at 04:59:08PM +1100, Stephen Rothwell wrote:
> > 
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   mm/balloon_compaction.c
> > 
> > between commit:
> > 
> >   0b5ffdb4f7c6 ("balloon: fix page list locking")
> > 
> > from the vhost tree and commit:
> > 
> >   0c983ec0c078 ("virtio_balloon: fix race between migration and ballooning")
> > 
> > from the akpm-current tree.
> > 
> > I fixed it up (I think that the former is a superset of the latter, so
> > I used that, completely reversing the latter patch) and can carry the
> > fix as necessary (no action is required).  
> 
> Oops, it isn't.
> 
> Andrew, your tree seems to still carry original patch by Minchan Kim:
> 
> 0c983ec0c078ed5d5c219cf97af06364e7a8e19f
> 
> I reported on list that it has a deadlock:
> http://article.gmane.org/gmane.linux.kernel.stable/159208
> 
> I think it should be reverted and my patch applied - it's in my tree
> but if you prefer it in yours instead, please let me know.

That is what I effectively did in today's tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
\
