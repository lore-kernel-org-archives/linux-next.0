From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Wed, 12 Dec 2018 21:45:21 -0800
Message-ID: <20181213054519.nhdcqisombemwnh7@ast-mbp.dhcp.thefacebook.com>
References: <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
 <20181213094820.62d26354@canb.auug.org.au>
 <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
 <20181212.164526.189502766995329983.davem@davemloft.net>
 <20181213043339.znj2674c2povyl2n@ast-mbp.dhcp.thefacebook.com>
 <20181213163728.037ac535@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213163728.037ac535@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Dec 13, 2018 at 04:37:28PM +1100, Stephen Rothwell wrote:
> Hi Alexei,
> 
> On Wed, 12 Dec 2018 20:33:41 -0800 Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> >
> > If Stephen's scripts can recognize SOB anywhere in the log then
> > --signoff can theoretically solve it.
> 
> My script just grabs all the Signed-off-by lines in the commit message.
> 
> > Unfortunately it's "Incompatible with the --interactive option"
> > So we have to do things manually
> > or fix scripts
> > or fix git.
> 
> My version (2.19.1 and 2.20.0) of git does not say it is incompatible
> with --interactive, so maybe the last is true :-)  It says:

Awesome! While 2.17.1 failed, 2.20.0 worked!
