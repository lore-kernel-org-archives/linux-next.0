From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: linux-next: bad commit in the xen-tip tree
Date: Thu, 8 Jun 2017 15:09:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1706081509160.26108@sstabellini-ThinkPad-X260>
References: <20170609075910.66c300b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170609075910.66c300b6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 9 Jun 2017, Stephen Rothwell wrote:
> Hi all,
> 
> The current top commit of the xen-tip tree
> 
>   9e925824eccd ("xen: avoid type warning in xchg_xen_ulong")
> 
> has no Signed-off-by for its committer.

Fixed, thanks for pointing it out.
