From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 13:50:26 +1000
Message-ID: <20170714135018.5c849c1c@canb.auug.org.au>
References: <20170714111437.69a6b100@canb.auug.org.au>
        <1499995033.2936.12.camel@redhat.com>
        <20170714033416.GS1528@mtr-leonro.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170714033416.GS1528@mtr-leonro.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Fri, 14 Jul 2017 06:34:16 +0300 Leon Romanovsky <leon@kernel.org> wrote:
>
> Sorry Doug, but it is not expected at all for the code which will go to 4.14.
> 
> Both patches in question were targeted for 4.13 and you was expected to
> see the merge conflicts during last month or so, prior to merge window of 4.13.
> 
> In 4.14, you should base your tree on Linus's tree and don't have ANY
> conflicts in your subsystem, between ANY subsystems and especially
> Linus, so we will be able to develop and test.
> 
> For me, this merge conflict puts a large sign, that your tree is not ready for 4.14.
> 
> Please base your tree on Linus's tree.

And if these commits are destined for v4.14, then they should not have
been in linux-next yet.

-- 
Cheers,
Stephen Rothwell
