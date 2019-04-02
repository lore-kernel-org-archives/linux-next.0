From: Qiang Yu <yuq825@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 Apr 2019 21:56:08 +0800
Message-ID: <CAKGbVbuY3mKAZ6bA9G87NHq7mdxkw95p7OoO_QyUU_101yQEuQ@mail.gmail.com>
References: <20190402105006.48f93e53@canb.auug.org.au> <CAKGbVbvj9cZnJuey_ra7U+xm-JhoB17bpTgcXKiKaHWbjB9Sxw@mail.gmail.com>
 <20190402112656.GE22763@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402112656.GE22763@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 2, 2019 at 7:26 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Apr 02, 2019 at 01:55:03PM +0800, Qiang Yu wrote:
> > Thanks, patch is:
> > Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> This looks like a fairly naive conversion from the old IDR API to the
> XArray API.  You should be able to remove mgr->lock entirely, relying on
> the xa_lock for synchronising free and get.

I'm afraid the a little complex free path may involve some might sleep
functions so use a mutex lock instead of spinlock.

> If you think it's worth it,
> you could even use kfree_rcu() to free the ctx and kref_get_unless_zero()
> and then your get path would be lock-free.

I can take a look this way, thanks.
