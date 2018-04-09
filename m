From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the efi-lock-down
 tree
Date: Mon, 9 Apr 2018 12:51:53 +1000 (AEST)
Message-ID: <alpine.LRH.2.21.1804091251380.14450@namei.org>
References: <20180315183412.01412755@canb.auug.org.au> <20180406092216.4579a70c@canb.auug.org.au> <20180409115831.46a351ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409115831.46a351ef@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 9 Apr 2018, Stephen Rothwell wrote:

> Hi all,
> 
> On Fri, 6 Apr 2018 09:22:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 15 Mar 2018 18:34:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the scsi-mkp tree got a conflict in:
> > > 
> > >   drivers/scsi/eata.c
> > > 
> > > between commit:
> > > 
> > >   5b76b160badb ("scsi: Lock down the eata driver")
> > > 
> > > from the efi-lock-down tree and commit:
> > > 
> > >   6b1745caa14a ("scsi: eata: eata-pio: Deprecate legacy EATA drivers")
> > > 
> > > from the scsi-mkp tree.
> > > 
> > > I fixed it up (I just removed the file) and can carry the fix as
> > > necessary. This is now fixed as far as linux-next is concerned, but any
> > > non trivial conflicts should be mentioned to your upstream maintainer
> > > when your tree is submitted for merging.  You may also want to consider
> > > cooperating with the maintainer of the conflicting tree to minimise any
> > > particularly complex conflicts.  
> > 
> > This is now a conflict between the efi-lock-down tree and Linus' tree.
> 
> This is now a conflict between the security tree and Linus' tree.

That's odd, my next-general branch is merged to Linus.

-- 
James Morris
<jmorris@namei.org>
