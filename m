From: Minchan Kim <minchan@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the vhost
 tree
Date: Fri, 8 Jan 2016 16:17:06 +0900
Message-ID: <20160108071706.GA9692@bbox>
References: <20160108165908.2da89bfd@canb.auug.org.au>
 <20160108083449-mutt-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from LGEAMRELO11.lge.com ([156.147.23.51]:55112 "EHLO
	lgeamrelo11.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040AbcAHHPW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2016 02:15:22 -0500
In-Reply-To: <20160108083449-mutt-send-email-mst@redhat.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 08, 2016 at 08:46:15AM +0200, Michael S. Tsirkin wrote:
> On Fri, Jan 08, 2016 at 04:59:08PM +1100, Stephen Rothwell wrote:
> > Hi Andrew,
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

And I replied on your comment that it's not a deadlock but it seem
you lost my mail because you didn't reply to me.
Could you expalin why it's deadlock in my reply thread?
