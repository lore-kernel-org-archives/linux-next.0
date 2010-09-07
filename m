From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the final tree
	(driver-core tree related)
Date: Mon, 6 Sep 2010 19:34:04 -0700
Message-ID: <20100907023404.GA11972@kroah.com>
References: <20100907115426.fc0c3e13.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100907115426.fc0c3e13.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Renninger <trenn@suse.de>, Jason Baron <jbaron@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Sep 07, 2010 at 11:54:26AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) produced this warning:
> 
> kernel/params.c: In function 'parse_args':
> kernel/params.c:233: warning: the frame size of 1032 bytes is larger than 1024 bytes
> 
> Introduced by commit 32e6407e9361cd1aac39ff6b744cad48d1802a08 ("Dynamic
> Debug: Introduce global fake module param module.ddebug") which added a
> 1024 byte array to the stack ...

Wierd, why didn't this show up yesterday?  The patch was in that tree
then, right?

Thomas, care to fix this up?

thanks,

greg k-h
