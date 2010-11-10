From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the  tree
Date: Wed, 10 Nov 2010 10:40:04 -0800
Message-ID: <20101110184004.GB15089@kroah.com>
References: <20101110132408.67f73665.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101110132408.67f73665.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Dan Carpenter <error27@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 10, 2010 at 01:24:08PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/intel_sst/intel_sst_app_interface.c between commits from
> the staging.current tree and commit
> d0f40c5041f9c48afbd8f7fbf8a5faa9e5dbd39a ("Staging: intel_sst: Use
> pr_fmt, fix misspellings") from the staging tree.
> 
> I have just ignored the changes from the staging tree for today.

Thanks, that works, when these patches go to Linus I'll handle the
merge.

greg k-h
