From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: Fixes tag needs some work in the nfs-anna tree
Date: Tue, 15 Jan 2019 16:41:21 -0500
Message-ID: <A4B834E5-2DFD-428E-8E24-9F6F6A822B09@oracle.com>
References: <20190116083831.256824cf@canb.auug.org.au>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116083831.256824cf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen-

On Jan 15, 2019, at 4:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> [I am experimenting with checking the Fixes tags in commits in linux-next.
> Please let me know if you think I am being too strict.]
> 
> Hi all,
> 
> Commit
> 
>  deaa5c96c2f7 ("SUNRPC: Address Kerberos performance/behavior regression")
> 
> has problem with this Fixes tag:
> 
>  Fixes: 918f3c1fe83c ("SUNRPC: Improve latency for interactive ... ")
> 
> The subject should match the subject of the fixed commit.
> 
> -- 
> Cheers,
> Stephen Rothwell

I shortened the commit title so that the Fixes: line is shorter than 68
characters. I can leave these titles alone if that's preferred.


--
Chuck Lever
