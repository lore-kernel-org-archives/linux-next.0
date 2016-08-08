From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of Linus' tree
Date: Tue, 9 Aug 2016 07:53:15 +1000
Message-ID: <20160809075315.07a86b32@canb.auug.org.au>
References: <20160808115827.6dd7fa6f@canb.auug.org.au>
	<6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>, Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>, Leon Romanovsky <leon@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Doug,

On Mon, 8 Aug 2016 11:37:33 -0400 Doug Ledford <dledford@redhat.com> wrote:
>
> On 8/7/2016 9:58 PM, Stephen Rothwell wrote:
> > 
> > With Linus' tree, today's linux-next build (powerpc allyesconfig) failed
> > like this:
> > 
> > drivers/infiniband/sw/built-in.o:(.opd+0x1698): multiple definition of `copy_data'
> > drivers/infiniband/hw/built-in.o:(.opd+0xe5f8): first defined here
> > drivers/infiniband/sw/built-in.o:(.opd+0x1320): multiple definition of `rxe_av_from_attr'
> > drivers/infiniband/hw/built-in.o:(.opd+0xe280): first defined here  
> 
> This looks very suspicious.  I think you are picking up two copies of
> the rxe code.  One from Linus tree and one from probably Leon's tree.

Actually the second copy is from your tree
(git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git#for-next),
Leon's trees are empty (relative to Linus' tree).  I guess when you
rebased and squashed things, you forgot to reset your for-next tag, so
I got the old version of your tree as well as the rebased version via
Linus' tree.

-- 
Cheers,
Stephen Rothwell
