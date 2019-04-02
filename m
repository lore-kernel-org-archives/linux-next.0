From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 Apr 2019 04:26:56 -0700
Message-ID: <20190402112656.GE22763@bombadil.infradead.org>
References: <20190402105006.48f93e53@canb.auug.org.au>
 <CAKGbVbvj9cZnJuey_ra7U+xm-JhoB17bpTgcXKiKaHWbjB9Sxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKGbVbvj9cZnJuey_ra7U+xm-JhoB17bpTgcXKiKaHWbjB9Sxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qiang Yu <yuq825@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 02, 2019 at 01:55:03PM +0800, Qiang Yu wrote:
> Thanks, patch is:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>

This looks like a fairly naive conversion from the old IDR API to the
XArray API.  You should be able to remove mgr->lock entirely, relying on
the xa_lock for synchronising free and get.  If you think it's worth it,
you could even use kfree_rcu() to free the ctx and kref_get_unless_zero()
and then your get path would be lock-free.
