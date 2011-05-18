From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: linux-next: manual merge of the xen tree with Linus tree
Date: Wed, 18 May 2011 13:32:18 +0100
Message-ID: <1305721938.20907.132.camel@zakaz.uk.xensource.com>
References: <20110115120544.98a1f091.sfr@canb.auug.org.au>
	 <20110517211234.472e32f4.sfr@canb.auug.org.au>  <4DD2C947.9050501@goop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DD2C947.9050501@goop.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2011-05-17 at 12:15 -0700, Jeremy Fitzhardinge wrote:
> On 05/17/2011 04:12 AM, Stephen Rothwell wrote:
> > Hi Jeremy,
> >
> > On Sat, 15 Jan 2011 12:05:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> Today's linux-next merge of the xen tree got a conflict in
> >> drivers/xen/Kconfig, drivers/xen/gntdev.c and include/xen/gntdev.h
> >> between various commits Linus' tree and various commits from the xen tree.
> >>
> >> As previously discussed, I have dropped the xen tree for today (as it
> >> contains an older version of the changes that were merged into Linus'
> >> tree).
> > Just wondering if the xen tree is ever going to make a reappearance in
> > linux-next?
> 
> Konrad's tree has the bulk of the xen work in it at the moment.  I'm
> doing to start on a few bits and pieces, but I've not decided if I'll
> put them into linux-next myself or just push them via Konrad.
> 
> So, maybe, but maybe not.

Perhaps resetting your branch to some commit on Linus tree in the
meantime would mean Stephen doesn't have to see it everyday?

Ian.
-- 
Ian Campbell
Current Noise: Devin Townsend - Away

In an orderly world, there's always a place for the disorderly.
