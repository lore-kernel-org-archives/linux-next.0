From: Or Gerlitz <gerlitz.or@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 10 Dec 2018 13:38:54 +0200
Message-ID: <CAJ3xEMhyNMpiBVb6Q+RkxyxgacUMXnBs7-7f0OvuzXK1-TJvqQ@mail.gmail.com>
References: <20181210123633.4a0e4409@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210123633.4a0e4409@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Amritha Nambiar <amritha.nambiar@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>, Paul Blakey <paulb@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 10, 2018 at 3:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   net/sched/cls_flower.c
>
> between commit:
>
>   35cc3cefc4de ("net/sched: cls_flower: Reject duplicated rules also under skip_sw")
>
> from the net tree and commit:
>
>   5c72299fba9d ("net: sched: cls_flower: Classify packets using port ranges")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

[..]

The fix LGTM, thanks for addressing this.

Or.
