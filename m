From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the fscrypt tree
Date: Tue, 15 Jan 2019 19:55:39 -0700
Message-ID: <ca843f39-3fcd-1a03-34c9-7284f10fe262@kernel.dk>
References: <20190116132522.1b756433@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116132522.1b756433@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

On 1/15/19 7:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   fs/ext4/readpage.c
> 
> between commit:
> 
>   acc9eb0a6073 ("ext4: add fs-verity read support")
> 
> from the fscrypt tree and commit:
> 
>   eb754eb2a953 ("block: allow bio_for_each_segment_all() to iterate over multi-page bvec")
> 
> from the block tree.
> 
> I fixed it up (see below - the former moved the code modified by the
> latter) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Ming, I'm pulling this, I thought we agreed none of these bullshit
renames? The fact that a patch looks like this:

-               for_each_bvec(bv, (it)->bvecs, __cur_iter, __cur_iter)        \
+               for_each_segment(bv, (it)->bvecs, __cur_iter, __cur_iter)     \

is SUPER annoying and does NOTHING but to cause merge conflicts.

Resend it without that.

-- 
Jens Axboe
