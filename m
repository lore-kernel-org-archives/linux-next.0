From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Thu, 7 Nov 2013 19:39:01 -0700
Message-ID: <20131108023901.GE10212@kernel.dk>
References: <5273C473.5070803@kernel.dk>
 <20131102072252.88d2380fa392705b912dbfad@canb.auug.org.au>
 <52740EB1.2070901@kernel.dk>
 <527411DD.7050008@oracle.com>
 <527414DE.9090704@kernel.dk>
 <52756583.2030808@oracle.com>
 <527BE7FA.90904@oracle.com>
 <20131107192545.GA20624@moria.home.lan>
 <527C2AA9.9040608@oracle.com>
 <20131108125307.613427c04a7527c4359e6443@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131108125307.613427c04a7527c4359e6443@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>, Kent Overstreet <kmo@daterainc.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zach Brown <zab@zabbo.net>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 08 2013, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 07 Nov 2013 18:04:57 -0600 Dave Kleikamp <dave.kleikamp@oracle.com> wrote:
> >
> > Can you please drop the aio-direct tree for the time being?
> 
> OK, I was afraid of this, but, yes, I can drop it.  I am not quite sure
> what affect this will have on Andrew's tree, though (hopefully not too
> much).
> 
> This is a bit disappointing.  Dave's stuff have been sitting in
> linux-next for quite some time (probably too long) so it is not as if
> Kent and Jens (should) have been unaware of it.

If it doesn't throw merge errors for you, I am not aware of it.

-- 
Jens Axboe
