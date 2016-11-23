From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Wed, 23 Nov 2016 10:17:42 +0100
Message-ID: <20161123091742.GB10808@osiris>
References: <20161123144515.10cf9236@canb.auug.org.au>
 <c61978cc-c38b-a9fc-a963-4d988e9dfff3@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c61978cc-c38b-a9fc-a963-4d988e9dfff3@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Janosch Frank <frankja@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 23, 2016 at 09:24:17AM +0100, Christian Borntraeger wrote:
> On 11/23/2016 04:45 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the kvms390 tree got a conflict in:
> > 
> >   arch/s390/include/asm/facilities_src.h
> > 
> > between commit:
> > 
> >   d1f7e8f85b51 ("s390: squash facilities_src.h into gen_facilities.c")
> > 
> > from the s390 tree and commits:
> > 
> >   09ff894457e9 ("KVM: s390: gaccess: add ESOP2 handling")
> >   88abf0b54f51 ("KVM: s390: instruction-execution-protection support")
> > 
> > from the kvms390 tree.
> > 
> > I fixed it up (I deleted the file and then added the following merge fix
> > patch) and can carry the fix as necessary. This is now fixed as far as
> > linux-next is concerned, but any non trivial conflicts should be mentioned
> > to your upstream maintainer when your tree is submitted for merging.
> > You may also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
> 
> Thanks, looks fine.
> 
> Hmmm, Martin, Heiko, KVM is going to touch that file from time to time.
> Can we either have 
> a: a topic branch for this tool (like I did for the 4.9 merge window)
> with just the patches for this tool. This topic branch can then be merged
> into kvm/next and s390/features.

That's up to Martin.

> b: split out the kvm defines into arch/s390/tools/kvm_facilities.h
> b would like something like this (cut/paste so whitespace damaged)
> 
> From: Christian Borntraeger <borntraeger@de.ibm.com>
> Date: Wed, 23 Nov 2016 09:18:42 +0100
> Subject: [PATCH 1/1] s390:gen_facilites: Move kvm facilities into a separate
>  file
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  MAINTAINERS                      |  1 +
>  arch/s390/tools/gen_facilities.c | 25 +------------------------
>  arch/s390/tools/kvm_facilities.c | 26 ++++++++++++++++++++++++++
>  3 files changed, 28 insertions(+), 24 deletions(-)
>  create mode 100644 arch/s390/tools/kvm_facilities.c

No, please don't split this file again. Only kvm will ever touch the kvm
facilities, so we won't any conflicts here.
This time it's only because the file moved, otherwise there wouldn't be any
problem at all.
