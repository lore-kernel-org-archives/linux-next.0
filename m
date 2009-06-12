From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: [Powerpc/SLQB] Next June 06 : BUG during scsi initialization
Date: Fri, 12 Jun 2009 11:38:07 +0300
Message-ID: <1244795887.30512.27.camel@penberg-laptop>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
	<4A081002.4050802@in.ibm.com> <4A2909E8.6000507@in.ibm.com>
	<Pine.LNX.4.64.0906071105030.11309@melkki.cs.Helsinki.FI>
	<4A2D001E.5060802@in.ibm.com> <20090609141903.GE15219@wotan.suse.de>
	<4A31EB2A.9080003@in.ibm.com> <20090612074213.GA21070@wotan.suse.de>
	<4A320D12.2050802@in.ibm.com> <20090612082145.GD24044@wotan.suse.de>
	<1244795139.30512.23.camel@penberg-laptop>
	<20090612183559.33018f0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20090612183559.33018f0c.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nick Piggin <npiggin@suse.de>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 2009-06-12 at 18:35 +1000, Stephen Rothwell wrote:
> Hi Pekka,
> 
> On Fri, 12 Jun 2009 11:25:39 +0300 Pekka Enberg <penberg@cs.helsinki.fi> wrote:
> >
> > Hmm, SLQB in my for-next branch. Stephen, is slab.git dropped from
> > linux-next or something?
> 
> Yesterday (next-20090611) the slab tree for linux-next had only one
> commit in it ("SLUB: Out-of-memory diagnostics").  Today (next-20090612)
> it has quite a lot in it again - including SLQB.

Ah, ok. I did mess it up for few hours and I guess you picked up then.
Thanks, Stephen!
