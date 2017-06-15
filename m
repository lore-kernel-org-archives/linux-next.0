From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the i2c tree
Date: Thu, 15 Jun 2017 11:34:52 +1000
Message-ID: <20170615113452.1fa1dc67@canb.auug.org.au>
References: <20170605111131.3a113eaa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170605111131.3a113eaa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Wolfram,

On Mon, 5 Jun 2017 11:11:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
>  #define DEBUG
>  ^
> <command-line>:0:0: note: this is the location of the previous definition
> 
> Introduced by commit
> 
>   6c42778780c4 ("i2c: stub: use pr_fmt")

I am still getting this ...

-- 
Cheers,
Stephen Rothwell
