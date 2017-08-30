From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-bys missing for commits in the block
 tree
Date: Thu, 31 Aug 2017 03:34:00 +1000
Message-ID: <20170831033400.423f0e6b@canb.auug.org.au>
References: <20170831030647.19c22478@canb.auug.org.au>
        <20170830170936.GA3925@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170830170936.GA3925@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sagi Grimberg <sagi@grimberg.me>, Arnav Dawn <a.dawn@samsung.com>, Guan Junxiong <guanjunxiong@huawei.com>, Max Gurtovoy <maxg@mellanox.com>, James Smart <james.smart@broadcom.com>, Martin Wilck <mwilck@suse.com>, "Jan H. =?UTF-8?B?U2Now7ZuaGVycg==?=" <jschoenh@amazon.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Roland Kammerer <roland.kammerer@linbit.com>
List-Id: linux-next.vger.kernel.org

Hi Christoph,

On Wed, 30 Aug 2017 19:09:36 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> They all have singnoffs from the original committer.  It's just
> that we team-maintain the tree and had a rebase.
>=20
> Are we supposed to add another Signoff just for the rebase?

=46rom a previous discussion, Linus said:

"On Wed, Aug 2, 2017 at 5:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
>
> I would say that if you rebase someone's commit(s), then you are on the
> "patch's delivery path" and so should add a Signed-off-by tag. =20

Yeah, I agree. Rebasing really is pretty much the exact same thing as
applying a patch."

So, yes, you are suppose to.
--=20
Cheers,
Stephen Rothwell
