From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the modules tree
Date: Tue, 30 Apr 2019 18:13:19 -0400
Message-ID: <fab23e00-5623-6fd0-18dd-f063dc1658ba@redhat.com>
References: <20190501081054.387820b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501081054.387820b2@canb.auug.org.au>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jessica Yu <jeyu@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 4/30/19 6:10 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   7e470ea99bcd ("kernel/module: Reschedule while waiting for modules to finish loading")
> 
> Fixes tag
> 
>   Fixes: linux-next commit f9a75c1d717f ("modules: Only return -EEXIST for modules that have finished loading")
> 
> has these problem(s):
> 
>   - the "linux-next commit" is unexpected (and not really meaningful
>     once this is merged into Linus' tree)
> 

Stephen, I will send out an updated patch now.

P.
