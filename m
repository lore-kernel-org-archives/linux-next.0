From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Fri, 26 Sep 2014 10:57:41 +0100
Message-ID: <1411725461.2183.2.camel@jarvis>
References: <20140926183450.7474b448@canb.auug.org.au>
	 <20140926083632.GA19463@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140926083632.GA19463@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>, Xiong <wenxiong@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2014-09-26 at 10:36 +0200, Christoph Hellwig wrote:
> On Fri, Sep 26, 2014 at 06:34:50PM +1000, Stephen Rothwell wrote:
> > Hi James,
> > 
> > After merging the scsi tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > drivers/scsi/ipr.c: In function 'ipr_handle_log_data':
> > drivers/scsi/ipr.c:2468:15: error: 'IPR_IOASC_HW_CMD_FAILED' undeclared (first use in this function)
> >   if (ioasc == IPR_IOASC_HW_CMD_FAILED &&
> >                ^
> > 
> > Caused by commit 3185ea63907c ("ipr: don't log error messages when
> > applications issues illegal requests").  Someone typoed that name in
> > ipr.h ...
> > 
> > I have reverted that commit for today.
> 
> Thanks.  The fix should be here:
> 
> http://git.infradead.org/users/hch/scsi-queue.git/commitdiff/d247a70a4d67623eb738176ee703a7bb8b6c325c

OK, Pushed out.

I'll wait for the next couple of build cycles before pushing (assuming
merge window opens on Sunday) just in case more things show up.

James
