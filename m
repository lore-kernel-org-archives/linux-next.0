From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Wed, 12 Dec 2018 16:45:26 -0800 (PST)
Message-ID: <20181212.164526.189502766995329983.davem@davemloft.net>
References: <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
        <20181213094820.62d26354@canb.auug.org.au>
        <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexei.starovoitov@gmail.com
Cc: sfr@canb.auug.org.au, daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 12 Dec 2018 15:39:10 -0800

> But this approach doesn't scale.
> We do rebase our trees when we need to fixup or drop patches and
> at any given point a number of commits will be committed by me
> and another set by Daniel. When we rebase we cannot keep adding
> our SOBs to the other person SOBs.
> Then comes the next rebase and we get to the point of
> double and triple SOBs ?

If you use "--signoff" in whatever commands do the rebase you will
get exactly one signoff for yourself and Daniel at maximum.  If it
is there already, git will not add a duplicate one on top.
