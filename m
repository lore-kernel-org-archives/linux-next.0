From: Ming Lei <ming.lei@redhat.com>
Subject: Re: linux-next: manual merge of the block tree with the fscrypt tree
Date: Wed, 16 Jan 2019 15:39:16 +0800
Message-ID: <20190116073915.GA1089@ming.t460p>
References: <20190116132522.1b756433@canb.auug.org.au>
 <ca843f39-3fcd-1a03-34c9-7284f10fe262@kernel.dk>
 <20190116031301.GC26146@ming.t460p>
 <a1ce4d1d-13e0-c765-bf22-55fd67c9f1d4@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a1ce4d1d-13e0-c765-bf22-55fd67c9f1d4@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Theodore Ts'o <tytso@mit.edu>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 15, 2019 at 08:17:36PM -0700, Jens Axboe wrote:
> On 1/15/19 8:13 PM, Ming Lei wrote:
> > On Tue, Jan 15, 2019 at 07:55:39PM -0700, Jens Axboe wrote:
> >> On 1/15/19 7:25 PM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Today's linux-next merge of the block tree got a conflict in:
> >>>
> >>>   fs/ext4/readpage.c
> >>>
> >>> between commit:
> >>>
> >>>   acc9eb0a6073 ("ext4: add fs-verity read support")
> >>>
> >>> from the fscrypt tree and commit:
> >>>
> >>>   eb754eb2a953 ("block: allow bio_for_each_segment_all() to iterate over multi-page bvec")
> >>>
> >>> from the block tree.
> >>>
> >>> I fixed it up (see below - the former moved the code modified by the
> >>> latter) and can carry the fix as necessary. This is now fixed as far as
> >>> linux-next is concerned, but any non trivial conflicts should be mentioned
> >>> to your upstream maintainer when your tree is submitted for merging.
> >>> You may also want to consider cooperating with the maintainer of the
> >>> conflicting tree to minimise any particularly complex conflicts.
> >>
> >> Ming, I'm pulling this, I thought we agreed none of these bullshit
> >> renames? The fact that a patch looks like this:
> >>
> >> -               for_each_bvec(bv, (it)->bvecs, __cur_iter, __cur_iter)        \
> >> +               for_each_segment(bv, (it)->bvecs, __cur_iter, __cur_iter)     \
> >>
> >> is SUPER annoying and does NOTHING but to cause merge conflicts.
> >>
> >> Resend it without that.
> > 
> > We need to differentiate 'segment' with 'bvec' in bvec helpers, which is
> > usually seldom used by drivers. For example, only two in-tree users(ceph, iov_iter).
> > That is why I rename it, and seems Christoph prefers to do it too.
> 
> If you want to do a rename, then we do it after. I don't want to deal with
> weeks and weeks of fallout from this. Write a rename script that we can
> then run at the end of the next merge window. You're going to be playing
> catch-up until that happens if we go the current route, and honestly
> I'm not at all interested in the fallout from that.
> 
> I know exactly what will happen until 5.1-rc opens, and what my tree will
> look like from having to deal with this. And then I know exactly what Linus
> is going to say, and I can't even argue against it, since he'll be totally
> right.
> 
> Hence it's not going to happen this way.

I can remove the renaming in patch 'block: rename bvec helpers', but
change on bio_for_each_segment_all() is inevitable, and it is still an
API change, so merge conflict can't avoid too.

Thanks,
Ming
