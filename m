From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for October 21 (printk format warnings)
Date: Tue, 21 Oct 2008 22:01:42 -0700
Message-ID: <20081022050142.GA11674@kroah.com>
References: <20081021195109.ed83b102.sfr@canb.auug.org.au> <20081021215725.b9c2b941.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753218AbYJVFES@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081021215725.b9c2b941.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 21, 2008 at 09:57:25PM -0700, Randy Dunlap wrote:
> On Tue, 21 Oct 2008 19:51:09 +1100 Stephen Rothwell wrote:
> 
> 
> printk format warnings summary:
> 
> i386:
> 
> linux-next-20081021/drivers/pci/hotplug/acpiphp_ibm.c:207: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'long long unsigned int'
> 
> linux-next-20081021/drivers/misc/intel_menlow.c:107: warning: format '%ld' expects type 'long int', but argument 3 has type 'long long unsigned int'
> 
> x86_64:
> 
> linux-next-20081021/drivers/pci/hotplug/acpiphp_ibm.c:207: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'long long unsigned int'
> 
> linux-next-20081021/drivers/usb/misc/vstusb.c:623: warning: format '%d' expects type 'int', but argument 5 has type 'size_t'

Crap.  What's the expected modifier for "size_t" to work on all arches?

Same goes for the result of "size_of()", what should we use there?  Or
are we just required to always cast things?

thanks,

greg k-h
