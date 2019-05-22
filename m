From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the pidfd tree with Linus' tree
Date: Wed, 22 May 2019 07:52:35 +0200
Message-ID: <20190522055235.GC13702@kroah.com>
References: <20190522110115.7350be3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522110115.7350be3e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <christian@brauner.io>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Joel Fernandes (Google)" <joel@joelfernandes.org>
List-Id: linux-next.vger.kernel.org

On Wed, May 22, 2019 at 11:01:15AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pidfd tree got a conflict in:
> 
>   tools/testing/selftests/pidfd/Makefile
> 
> between commit:
> 
>   ec8f24b7faaf ("treewide: Add SPDX license identifier - Makefile/Kconfig")
> 
> from Linus' tree and commit:
> 
>   233ad92edbea ("pidfd: add polling selftests")
> 
> from the pidfd tree.

Sorry, you are going to get a number of these types of minor conflicts
now.  That's the problem of touching thousands of files :(

thanks,

greg k-h
