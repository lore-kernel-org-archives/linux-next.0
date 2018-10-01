From: dwalker@fifo99.com
Subject: Re: linux-next: commits in the cisco tree
Date: Mon, 1 Oct 2018 07:42:57 -0700
Message-ID: <20181001144257.GA13523@fifo99.com>
References: <20180930112419.6f880e46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180930112419.6f880e46@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Sep 30, 2018 at 11:24:19AM +1000, Stephen Rothwell wrote:
> Hi Daniel,
> 
> I noticed that you have added some commits to the cisco tree today.  Just a couple of comments:
> 
> Fristly, commits
> 
>   734245aec283 ("This code allows architectures to use a generic builtin command line."
> 
> and
> 
>   b17f223f16f2 ("This code allows architectures to use a generic builtin command line.")
> 
> are identical (though in different branches).
> 
> Secondly, commits
> 
>   2c070709ea75 ("his updates the x86 code to use the CONFIG_GENERIC_CMDLINE")
>   a5c4647c26da ("This updates the powerpc code to use the CONFIG_GENERIC_CMDLINE")
> 
> have no Acked-by or Reviewed-by from the repspective architecture
> maintainers/developers.

Is this just an alert , or are you not merging for these reasons ?

Daniel
