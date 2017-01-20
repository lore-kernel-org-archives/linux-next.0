From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the scsi tree with the tip tree
Date: Fri, 20 Jan 2017 07:52:16 -0500
Message-ID: <1484916736.3011.1.camel@HansenPartnership.com>
References: <20170120142343.3d2e72af@canb.auug.org.au>
         <20170120063552.GA14142@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120063552.GA14142@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2017-01-20 at 07:35 +0100, Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi James,
> > 
> > Today's linux-next merge of the scsi tree got a conflict in:
> > 
> >   drivers/scsi/mpt3sas/mpt3sas_scsih.c
> > 
> > between commit:
> > 
> >   e963b7088dac ("scsi: mpt3sas: Fix hang on ata passthru commands")
> > 
> > from the tip tree and commit:
> > 
> >   ffb584565894 ("scsi: mpt3sas: fix hang on ata passthrough
> > commands")
> > 
> > from the scsi tree.
> > 
> > I fixed it up (slightly different versions of the same patch - I 
> > used the latter version) and can carry the fix as necessary. This 
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your 
> > tree is submitted  or merging.  You may also want to consider 
> > cooperating with the maintainer of the conflicting tree to minimise 
> > any particularly complex conflicts.
> 
> I only had that patch for testing and it went into the -next branch 
> by accident - I have removed it so the conflict should be gone next 
> time -next is integrated.

Thanks for testing.  There was a last minute fuss about whether the
flag should be checked using a test_bit rather than a straight read,
which is the difference between the two versions.

James
