From: Or Gerlitz <gerlitz.or@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 18 Dec 2018 00:01:57 +0200
Message-ID: <CAJ3xEMjvoNZLaCWk8KydUTKH-fmqnF1Vgbu42u0ame_s-Cj3UQ@mail.gmail.com>
References: <20181217112546.4e400eb3@canb.auug.org.au> <CALzJLG_g3QcYLM+ZXwfpu5E71nUOrG=KA4X2uR-WGeYAOYcsLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALzJLG_g3QcYLM+ZXwfpu5E71nUOrG=KA4X2uR-WGeYAOYcsLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saeed Mahameed <saeedm@dev.mellanox.co.il>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Or Gerlitz <ogerlitz@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Eli Britstein <elibr@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 17, 2018 at 11:29 PM Saeed Mahameed
<saeedm@dev.mellanox.co.il> wrote:
> On Sun, Dec 16, 2018 at 4:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > I fixed it up (see below) and can carry the fix as necessary. This

> Looks good to me.

here too


> > Today's linux-next merge of the net-next tree got a conflict in:
> >   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> > between commit:

> >   154e62abe9cd ("net/mlx5e: Properly initialize flow attributes for slow path eswitch rule deletion")
> > from the net tree and commit:

> >   e88afe759a49 ("net/mlx5e: Err if asked to mirror a goto chain tc eswitch rule")
> >   e85e02bad29e ("net/mlx5: E-Switch, Rename esw attr mirror count field")
> > from the net-next tree.

Just a note,

e88afe759a49  ("net/mlx5e: Err if asked to mirror a goto chain tc
eswitch rule")i

s from net  and not net-next

see it here [1] among the top 10 patches

https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/log/?qt=grep&q=mlx5
