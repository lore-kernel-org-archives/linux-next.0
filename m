From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Wed, 12 Dec 2018 20:33:41 -0800
Message-ID: <20181213043339.znj2674c2povyl2n@ast-mbp.dhcp.thefacebook.com>
References: <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
 <20181213094820.62d26354@canb.auug.org.au>
 <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
 <20181212.164526.189502766995329983.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181212.164526.189502766995329983.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Dec 12, 2018 at 04:45:26PM -0800, David Miller wrote:
> From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Date: Wed, 12 Dec 2018 15:39:10 -0800
> 
> > But this approach doesn't scale.
> > We do rebase our trees when we need to fixup or drop patches and
> > at any given point a number of commits will be committed by me
> > and another set by Daniel. When we rebase we cannot keep adding
> > our SOBs to the other person SOBs.
> > Then comes the next rebase and we get to the point of
> > double and triple SOBs ?
> 
> If you use "--signoff" in whatever commands do the rebase you will
> get exactly one signoff for yourself and Daniel at maximum.  If it
> is there already, git will not add a duplicate one on top.

If Stephen's scripts can recognize SOB anywhere in the log then
--signoff can theoretically solve it.
Unfortunately it's "Incompatible with the --interactive option"
So we have to do things manually
or fix scripts
or fix git.
